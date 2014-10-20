#!/usr/bin/python
"""
Initialize and update the Maestro5 SQL database

Usage:
       DeploySQL [OPTIONS] db-server db-user db-pass db-name
   or: DeploySQL --help

Where OPTIONS is zero or more of:

  --dryrun                processes the files but does not run any SQL
                          commands.

  --verbose               some comments on how things are going

  --help                  prints this message and exits.

  --silent                suppresses console output

You can specify (note, that we support only above predefined configurations):
  db-server       is the SQL server to connect to. Default is 'localhost'.
  db-user         is the username to use with SQL. Default: sa
  db-pass         is the SQL password for DB-USER. Default: public2000
  db-name         is the database name to use. Default: medmas
"""
import os, sys, glob, time, subprocess, datetime
from subprocess import Popen, PIPE, STDOUT

if sys.version_info[0] != 3 or sys.version_info[1] != 1:
  print("Python 3.1 is expected")
  sys.exit(4)

class Updater:

  # The complete list of options:
  opts = ["dbname", "dryrun", "help", "verbose",  "silent"]

  def __init__(self, args):
    self.args = args
    self.type = "f"
    self.db_server = ""#"localhost"
    self.db_name = ""#"medmas"
    self.db_user = ""#"sa"
    self.db_password = ""#"public2000"
    self.msg = "Msg"
    self.errlvl = 0
    self.ip = "999.999.999.999"
    self.cloud_service = "CLOUD-SERVICE"
    self.client = "NA"
    self.client_ini = "NA"

    for opt in self.opts:
      setattr(self, "opt_" + opt, False)

    # internal settings
    self.result = 0                # Record worst-case status in result so --force can exit correctly.
    self.line_ended = True

  def exit(self):
    outcome = "PASS" if self.result == 0 else "FAIL"
    self.log("*** FINISHED. Overall result: " + outcome)
#    if self.result != 0 and not self.opt_quiet:
#      os.system("@pause")
    exit(self.result)

  def save_sql_patch(self, sql, exec_time):
    file_array= sql.split('_')
    if file_array[0].startswith('sqlpatches'):
        version_array=file_array[0].split('.')
        major=(version_array[0]+"."+version_array[1])[11:]
        num_major=major[:1]
        minor=version_array[1]
        patch=version_array[2]
        hotfix=version_array[3]
        full_version=(version_array[0]+"."+version_array[1]+"."+version_array[2]+"."+version_array[3])[11:]
        seq=file_array[1]
        patch_name=sql[11:]

        sql1=" IF NOT EXISTS (SELECT 1 FROM VERSION_INFO WHERE [DATE]=CONVERT(VARCHAR(8),GETDATE(),112) AND VERSION = 'V"+full_version+"')" \
        " BEGIN " \
        " INSERT VERSION_INFO ([version],[major],[minor],[patch_level],[HotFix],[date])" \
        " VALUES('V"+full_version+"','"+num_major+"','"+minor+"','"+patch+"','"+hotfix+"',CONVERT(VARCHAR(8),GETDATE(),112)) " \
        " END"

        sql2="if not exists (select 1 from step_version_info where description='"+patch_name+"' and CONVERT(VARCHAR(8),[date],112)=CONVERT(VARCHAR(8),GETDATE(),112))	" \
             "insert step_version_info ([step], [version], [hot_fix], [description], [date], [exec_time_sec])" \
             "values('"+seq+"','V"+full_version+"','"+hotfix+"','"+patch_name+"',getdate(), '"+exec_time+"')"

        self.log ("** Saving ["+patch_name+"] in VERSION_INFO table", eol = False)
        self.execute_sql("q", sql1, self.db_name)
        self.log ("** Saving ["+patch_name+"] in STEP_VERSION_INFO table", eol = False)
        self.execute_sql("q", sql2, self.db_name)

  def setresult(self, errorlevel,sql,exec_time):

    self.result = errorlevel
    if self.result != 0:
        self.exit()
    else:
        self.save_sql_patch(sql, exec_time)

  def log(self, message, eol = True, line_continued = False):
    if not self.line_ended and not line_continued:
      print()

#    print(message, end = "\n" if eol else "")
    if not self.opt_silent:
        print (message),
        if eol:
          print

    sys.stdout.flush()
    self.line_ended = eol

  def info(self, message, eol = True, line_continued = False):
    if self.opt_verbose:
      self.log(message, eol, line_continued)

  def args_error(self, message):
    self.log(message)
    self.result = 1
    self.opt_help = True

  def parse_options(self, args):
    ix = 0
    while ix < len(args):
      arg = args[ix]

      if arg.startswith("--"):
        opt = arg[2:].split("-=_")[0]
        if opt.split('=')[0] == "dbname":
          self.client = opt.split('=')[1]
          setattr(self, "opt_" + opt.split('=')[0], True)
        elif opt not in self.opts:
          self.args_error("Unknown command-line switch: " + arg)
          return False
        else:
          setattr(self, "opt_" + opt, True)
        del args[ix]
      else:
        ix += 1
    return True

  def parse_positional(self, args):
    if len(args) == 4:
      self.db_server, self.db_name, self.db_user, self.db_password = args
    elif len(args) == 1:
      self.db_name, = args
    elif len(args) != 0:
      self.args_error("unexpected arguments: " + (" ".join(args)))
      return False
    return True

  def parse_args(self, args):
    if len(args) == 0: return

    if not self.parse_options(args): return

#    if not self.parse_positional(args): return

    self.info("")
    self.info("Options:")
    for opt in self.opts:
      self.info("  --%-11s: %s" % (opt, getattr(self, "opt_" + opt)))

    self.info("")
    self.info("Arguments:")
    self.info("  db name  : " + str(self.db_name))
    self.info("  db server: " + str(self.db_server))
    self.info("  db user  : " + str(self.db_user))
    self.info("  db passwd: " + str(self.db_password))
    self.info("")

  def execute_sql(self, type, sql, dbname = ""):
    self.info(" - SQL: " + sql)
    errlvl = 0
    if type == "f":
        commandline = 'sqlcmd -S %s -d %s -U%s -P%s -i "%s"' % (self.db_server, dbname, self.db_user, self.db_password, sql)
    else:
        commandline = 'sqlcmd -S %s -d %s -U%s -P%s -Q "%s"' % (self.db_server, dbname, self.db_user, self.db_password, sql)

    if self.opt_dryrun:
      print(commandline)
    else:
      started = time.clock()
      error = os.popen(commandline).readlines()
      finished = time.clock()
      exec_time=finished - started
      self.log("   %.3f s" % (finished - started), line_continued = True);

      if len(error) != 0:
        if self.msg in error[0]: # if Msg string found in "error" then there was an error
           errlvl = 1
           self.info("   - got error level %s" % len(error))
           print (error)
        else:
           errlvl = 0

      self.setresult(errlvl,sql,"%.3f" % exec_time)

  def change_static_vars(self, filename):
      # add all of the replace tokens here
      self.change(filename, "#IP#", self.ip) # TO-DO

  def process_dir(self, title, dirname):
    files = []
    files += [filename.lower() for filename in glob.glob(dirname + "/*.sql")]
    if files:
      self.log(title)
    files.sort()
    for filename in files:
      basename = os.path.basename(filename)

#      if basename.startswith("00"):
#        if not self.opt_clean:
#          self.info("--clean was not given: " + basename)
#          continue

      self.change_static_vars(filename)
      self.log("* SQL Patch: " + basename, eol = False)
      self.info(" + applying change:", eol = False)
      self.execute_sql("f", filename, self.db_name)


  def load_base_data(self):
    self.process_dir("*** Processing dba", "dba")
    self.process_dir("*** Processing prereqs", "prereqs")

  def process_subdir(self, title, dirname):
    subdirs = [x[0] for x in os.walk(dirname)]
    subdirs.sort()

    for subdir in subdirs:
        self.process_dir("*** Processing "+subdir, subdir)

  def change(self, filename, old_string, new_string):
        s=open(filename).read()
        if old_string in s:
                self.log ('Changing "{old_string}" to "{new_string}"'.format(**locals()), eol=False)
                s=s.replace(old_string, new_string)
                f=open(filename, 'w')
                f.write(s)
                f.flush()
                f.close()
        else:
                self.info ('No occurances of "{old_string}" found in {filename}.'.format(**locals()))

  def process_all_dirs(self):
    self.load_base_data()
###    self.process_subdir("*** Processing patch files", "sqlpatches")
    self.process_dir("*** Processing patch files", "sqlpatches")
  def load_ini(self):
      found = 0
      cur_dir=os.path.dirname(__file__)
      ini_file=os.path.join(cur_dir, "ini_path.txt")
      ini_path = tuple(open(ini_file))

      for ini in ini_path:
          if ini.split('=')[0] == self.client:
              found = 1
              self.client_ini = ini.split('=')[1].rstrip()

      if (found == 0):
          self.log("ERROR: %s from the command line was not found in ini_path.txt" % self.client, eol=False)

      client_ini_arr = tuple(open(self.client_ini))

      for token in client_ini_arr:
          if token.startswith("SQL"):
              self.db_server=token.split('=')[1].rstrip()
          elif token.startswith("DB"):
              self.db_name=token.split('=')[1].rstrip()
          elif token.startswith("UN"):
              self.db_user=token.split('=')[1].rstrip()
          elif token.startswith("PW"):
              self.db_password=token.split('=')[1].rstrip()
          elif token.startswith("IP"):
              self.ip=token.split('=')[1].rstrip()

  def run(self):
    self.started = time.clock()

#    print ("SET FMTONLY ON")
#    self.execute_sql("q", "SET FMTONLY ON", self.db_name)

    self.parse_args(self.args)

    if self.opt_help:
      print(__doc__)
      sys.exit(self.result)

    #load ini_path.txt and figure out what client ini file it needs to use based n --dbname=dbname param
    self.load_ini()

    self.process_all_dirs()

    self.finished = time.clock()
    self.log("Exec Time =>   %.3f s" % (self.finished - self.started), line_continued = True);

    self.exit()

if __name__ == "__main__":
    Updater(sys.argv[1:]).run()