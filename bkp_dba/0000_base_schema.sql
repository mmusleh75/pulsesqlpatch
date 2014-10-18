-- MySQL dump 10.13  Distrib 5.5.27, for Win64 (x86)
--
-- Host: nonpatcheddb.corp.geolearning.com    Database: scrubbedprod
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abstract_test`
--

DROP TABLE IF EXISTS `abstract_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abstract_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `preview` tinyint(1) DEFAULT NULL,
  `random_order` tinyint(1) DEFAULT NULL,
  `random_answer_order` tinyint(1) DEFAULT NULL,
  `review_responses` tinyint(1) DEFAULT NULL,
  `email_results` tinyint(1) DEFAULT NULL,
  `available_start` int(11) DEFAULT NULL,
  `available_end` int(11) DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `dm_test_code` varchar(255) DEFAULT NULL,
  `question_pooling` tinyint(1) DEFAULT NULL,
  `allocate_questions_by_category` tinyint(1) DEFAULT NULL,
  `questions_per_instance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `dm_ix_test_code` (`dm_test_code`)
) ENGINE=InnoDB AUTO_INCREMENT=22504041328 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `acctstatus` smallint(2) NOT NULL DEFAULT '0',
  `failcount` int(11) NOT NULL DEFAULT '0',
  `pwcreated` datetime NOT NULL,
  `pwsuccess` datetime NOT NULL,
  `last_failed_attempt_date` datetime NOT NULL,
  `first_failed_attempt_date` datetime NOT NULL,
  `change_password_nextLogin` tinyint(1) NOT NULL,
  `FIRST` int(11) NOT NULL,
  `LAST` int(11) NOT NULL,
  `dm_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_ix_account_dm_username` (`dm_username`(100))
) ENGINE=InnoDB AUTO_INCREMENT=22510821346 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_request`
--

DROP TABLE IF EXISTS `account_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `middle_initial` varchar(16) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
  `postal_code_type` varchar(32) DEFAULT NULL,
  `office_telephone` varchar(32) DEFAULT NULL,
  `extension` varchar(16) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `account_reason` varchar(255) DEFAULT NULL,
  `approver_notes` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `agency_subelement_code` varchar(4) DEFAULT NULL,
  `privacy_data` bigint(20) DEFAULT NULL,
  `time_zone_id` smallint(6) DEFAULT NULL,
  `optin` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_location_id` (`location_id`),
  KEY `ix_account_time_zone_id` (`time_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=479190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adobe_connect_settings`
--

DROP TABLE IF EXISTS `adobe_connect_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_connect_settings` (
  `domain_id` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `adobe_domain_url` varchar(80) DEFAULT NULL,
  `super_username` varchar(50) DEFAULT NULL,
  `super_password` varchar(100) DEFAULT NULL,
  `folder_id` bigint(20) DEFAULT NULL,
  `use_email_as_login` tinyint(1) NOT NULL DEFAULT '1',
  `attendance_service_lastrun` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adobe_connect_user`
--

DROP TABLE IF EXISTS `adobe_connect_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_connect_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `adobe_connect_username` varchar(50) DEFAULT NULL,
  `adobe_connect_password` varchar(100) DEFAULT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  `principal_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) NOT NULL,
  `adobe_unique_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adobe_unique_id` (`adobe_unique_id`,`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2727 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adobe_session_host`
--

DROP TABLE IF EXISTS `adobe_session_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adobe_session_host` (
  `session_id` bigint(20) NOT NULL,
  `host_id` int(11) NOT NULL,
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `subheader` varchar(255) DEFAULT NULL,
  `publish` datetime DEFAULT NULL,
  `unpublish` datetime DEFAULT NULL,
  `content` text,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  `fk_widget_id` bigint(20) DEFAULT NULL,
  `default_translation_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9893 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement_translation`
--

DROP TABLE IF EXISTS `announcement_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `subheader` varchar(255) DEFAULT NULL,
  `content` text,
  `fk_announcement_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_fk_announcement_id` (`fk_announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9967 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `description` varchar(350) DEFAULT NULL,
  `feedback` varchar(350) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `order_position` int(11) DEFAULT NULL,
  `dm_answer_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_question_id` (`question_id`),
  KEY `dm_ix_answer_code` (`dm_answer_code`),
  CONSTRAINT `fk1m_answer__question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505684198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answer_instance`
--

DROP TABLE IF EXISTS `answer_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `question_instance_id` bigint(20) DEFAULT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `freeform_answer` varchar(10000) DEFAULT NULL,
  `order_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_answer_id` (`answer_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_question_instance_id` (`question_instance_id`),
  CONSTRAINT `fk1m_answer_instance__question_instance` FOREIGN KEY (`question_instance_id`) REFERENCES `question_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71694534 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `approval_workflow`
--

DROP TABLE IF EXISTS `approval_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_workflow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_request_form_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_parent_request_form_id` (`parent_request_form_id`),
  CONSTRAINT `fk1m_approval_workflow__request_form` FOREIGN KEY (`parent_request_form_id`) REFERENCES `request_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505004461 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `approval_workflow_step`
--

DROP TABLE IF EXISTS `approval_workflow_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_workflow_step` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `parent_approval_workflow_id` bigint(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_request_form_step_id` bigint(20) DEFAULT NULL,
  `is_requestor` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_parent_approval_workflow_id` (`parent_approval_workflow_id`),
  KEY `ix_parent_request_form_step_id` (`parent_request_form_step_id`),
  CONSTRAINT `fk1m_approval_workflow_step__approval_workflow` FOREIGN KEY (`parent_approval_workflow_id`) REFERENCES `approval_workflow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505012247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assigned_security_permission`
--

DROP TABLE IF EXISTS `assigned_security_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assigned_security_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Version` int(10) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `domain_id` bigint(20) unsigned NOT NULL,
  `fk_role_id` bigint(20) DEFAULT NULL,
  `permission_name` varchar(255) NOT NULL,
  `permission_type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_fk_role_id` (`fk_role_id`),
  CONSTRAINT `fk1m_role__assigned_security_permission` FOREIGN KEY (`fk_role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960056 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `assignment_type` int(11) DEFAULT NULL,
  `completion_status` int(11) DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `completion_percentage` int(11) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `pre_reminder2` tinyint(1) DEFAULT NULL,
  `pre_reminder7` tinyint(1) DEFAULT NULL,
  `pre_reminder30` tinyint(1) DEFAULT NULL,
  `post_reminder2` tinyint(1) DEFAULT NULL,
  `post_reminder7` tinyint(1) DEFAULT NULL,
  `post_reminder30` tinyint(1) DEFAULT NULL,
  `expired` tinyint(1) DEFAULT NULL,
  `recurrent` tinyint(1) DEFAULT NULL,
  `learning_plan_id` bigint(20) DEFAULT NULL,
  `assignment_rule_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `previous_assignment_id` bigint(20) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `flag` smallint(6) DEFAULT '0',
  `fk_lp_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_assignment_rule_id` (`assignment_rule_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_learning_plan_id_user_id_assignment_rule_id` (`user_id`,`assignment_rule_id`),
  KEY `ix_learning_plan_id` (`learning_plan_id`),
  KEY `ix_user_id_learning_plan_id` (`user_id`,`learning_plan_id`),
  KEY `ix_previous_assignment_id` (`previous_assignment_id`),
  KEY `fk_assignment_lp_template` (`fk_lp_template_id`),
  CONSTRAINT `fk1m_assignment__learning_plan` FOREIGN KEY (`learning_plan_id`) REFERENCES `learning_plan` (`id`),
  CONSTRAINT `fk_assignment_lp_template` FOREIGN KEY (`fk_lp_template_id`) REFERENCES `learning_plan_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22516099969 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_pending`
--

DROP TABLE IF EXISTS `assignment_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_pending` (
  `fk_learning_plan_id` bigint(20) NOT NULL,
  `fk_lms_user_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `job_id` char(42) NOT NULL,
  `fk_domain_id` bigint(20) NOT NULL,
  `fk_rule_identifier` varchar(255) NOT NULL,
  KEY `ix_fk_lms_user_id_fk_learning_plan_id` (`fk_lms_user_id`,`fk_learning_plan_id`),
  KEY `ix_domain_id` (`fk_domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_rule`
--

DROP TABLE IF EXISTS `assignment_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` char(1) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `learning_plan_id` bigint(20) DEFAULT NULL,
  `original_assignment_rule_id` bigint(20) DEFAULT NULL,
  `parent_recurring_assignment_rule_id` bigint(20) DEFAULT NULL,
  `length` smallint(6) DEFAULT NULL,
  `units` varchar(64) DEFAULT NULL,
  `trigger_type` varchar(64) DEFAULT NULL,
  `access_window` smallint(6) DEFAULT NULL,
  `custom_date` datetime DEFAULT NULL,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  `is_template` tinyint(4) DEFAULT '0',
  `assigning_group` bigint(20) DEFAULT NULL,
  `mac_enforced` tinyint(1) DEFAULT NULL,
  `fk_expiration_id` bigint(20) DEFAULT NULL,
  `duedate_type` tinyint(4) DEFAULT '0',
  `do_not_auto_enroll` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_unique_expiration_id` (`fk_expiration_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_learning_plan_id` (`learning_plan_id`),
  KEY `ix_subclass_status` (`subclass`,`status`),
  KEY `ix_rule_identifier` (`identifier`(16))
) ENGINE=InnoDB AUTO_INCREMENT=22537407847 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `type` varchar(500) NOT NULL,
  `creation_date` datetime NOT NULL,
  `action` varchar(32) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `changes` text,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_object_id_type` (`domain_id`,`object_id`,`type`(255)),
  KEY `ix_parent_id` (`parent_id`),
  KEY `ix_type` (`type`(255))
) ENGINE=InnoDB AUTO_INCREMENT=982325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awe_form_trigger`
--

DROP TABLE IF EXISTS `awe_form_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awe_form_trigger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `custom_attribute_definition_id` bigint(20) DEFAULT NULL,
  `min_hours` int(11) DEFAULT NULL,
  `max_hours` int(11) DEFAULT NULL,
  `min_cost` decimal(19,5) DEFAULT NULL,
  `max_cost` decimal(19,5) DEFAULT NULL,
  `trigger_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_custom_attribute_definition_id` (`custom_attribute_definition_id`),
  KEY `ix_domain_id_trigger_type` (`domain_id`,`trigger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3899 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awe_form_trigger_custom_option`
--

DROP TABLE IF EXISTS `awe_form_trigger_custom_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awe_form_trigger_custom_option` (
  `fk_awe_form_trigger_id` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL,
  UNIQUE KEY `uniqueness` (`fk_awe_form_trigger_id`,`option_id`),
  KEY `ix_option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awe_form_trigger_custom_value`
--

DROP TABLE IF EXISTS `awe_form_trigger_custom_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awe_form_trigger_custom_value` (
  `fk_awe_form_trigger_id` bigint(20) NOT NULL,
  `expected_value` varchar(255) NOT NULL,
  UNIQUE KEY `uniqueness` (`fk_awe_form_trigger_id`,`expected_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awe_form_trigger_group_node`
--

DROP TABLE IF EXISTS `awe_form_trigger_group_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awe_form_trigger_group_node` (
  `fk_awe_form_trigger_id` bigint(20) NOT NULL DEFAULT '0',
  `fk_group_node_id` bigint(20) NOT NULL,
  UNIQUE KEY `ix_awe_form_trigger_id_group_node_id` (`fk_awe_form_trigger_id`,`fk_group_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awe_form_trigger_request_form`
--

DROP TABLE IF EXISTS `awe_form_trigger_request_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awe_form_trigger_request_form` (
  `fk_request_form_id` bigint(20) NOT NULL,
  `fk_awe_form_trigger_id` bigint(20) NOT NULL,
  KEY `ix_awe_form_trigger_request_form_request_form_id` (`fk_request_form_id`),
  KEY `ix_awe_form_trigger_request_form_awe_form_trigger_id` (`fk_awe_form_trigger_id`),
  CONSTRAINT `fk1m_awe_form_trigger_request_form__request_form_id` FOREIGN KEY (`fk_request_form_id`) REFERENCES `request_form` (`id`),
  CONSTRAINT `fk1m_form_trigger_request_form__awe_form_trigger_id` FOREIGN KEY (`fk_awe_form_trigger_id`) REFERENCES `awe_form_trigger` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awe_matching_triggers`
--

DROP TABLE IF EXISTS `awe_matching_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awe_matching_triggers` (
  `job_id` varchar(40) NOT NULL,
  `fk_trigger_id` bigint(20) NOT NULL,
  KEY `ix_job_id_fk_trigger_id` (`job_id`,`fk_trigger_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awe_step_escalation`
--

DROP TABLE IF EXISTS `awe_step_escalation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awe_step_escalation` (
  `parent_workflow_step_id` bigint(20) NOT NULL,
  `escalation_type` tinyint(4) NOT NULL,
  `approver_type` tinyint(4) NOT NULL,
  `escalation_days` smallint(2) NOT NULL DEFAULT '1',
  `custom_attribute_def_id` bigint(20) DEFAULT NULL,
  `custom_select_option_id` bigint(20) DEFAULT NULL,
  `text_value` varchar(255) DEFAULT NULL,
  `fk_role_id` bigint(20) DEFAULT NULL,
  `fk_lms_user_id` bigint(20) DEFAULT NULL,
  KEY `ix_parent_workflow_step_id` (`parent_workflow_step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_class_job_queue`
--

DROP TABLE IF EXISTS `batch_class_job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_class_job_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `job_key` varchar(64) DEFAULT NULL,
  `uploaded_file_name` varchar(512) DEFAULT NULL,
  `file_name` varchar(512) DEFAULT NULL,
  `submitted_by` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `completion_time` datetime DEFAULT NULL,
  `job_status` smallint(6) DEFAULT NULL,
  `total_records` int(11) DEFAULT '0',
  `records_with_error` int(11) DEFAULT '0',
  `total_count` int(11) DEFAULT NULL,
  `classes_created_count` int(11) DEFAULT '0',
  `classes_modified_count` int(11) DEFAULT '0',
  `failed_count` int(11) DEFAULT NULL,
  `warning_count` int(11) DEFAULT '0',
  `has_error_log_file` tinyint(1) NOT NULL,
  `suppress_notifications` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_user_job_queue`
--

DROP TABLE IF EXISTS `batch_user_job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_user_job_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `job_key` varchar(64) DEFAULT NULL,
  `uploaded_file_name` varchar(512) DEFAULT NULL,
  `file_name` varchar(512) DEFAULT NULL,
  `submitted_by` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `completion_time` datetime DEFAULT NULL,
  `job_status` smallint(6) DEFAULT NULL,
  `total_records` int(11) DEFAULT '0',
  `records_with_error` int(11) DEFAULT '0',
  `total_count` int(11) DEFAULT NULL,
  `user_created_count` int(11) DEFAULT '0',
  `user_modified_count` int(11) DEFAULT '0',
  `failed_count` int(11) DEFAULT NULL,
  `warning_count` int(11) DEFAULT '0',
  `has_error_log_file` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157424 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blockout`
--

DROP TABLE IF EXISTS `blockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blockout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `instructor_id` bigint(20) DEFAULT NULL,
  `classroom_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_classroom_id` (`classroom_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1054 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bundle_courses`
--

DROP TABLE IF EXISTS `bundle_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_courses` (
  `fk_bundle_id` bigint(20) unsigned NOT NULL,
  `fk_course_id` bigint(20) unsigned NOT NULL,
  KEY `ix_fk_bundle_id` (`fk_bundle_id`),
  KEY `ix_fk_course_id` (`fk_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cac_course_assignment`
--

DROP TABLE IF EXISTS `cac_course_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cac_course_assignment` (
  `fk_course_id` bigint(20) unsigned NOT NULL,
  `fk_catalog_access_code_id` bigint(20) unsigned NOT NULL,
  KEY `ix_fk_course_id` (`fk_course_id`),
  KEY `ix_fk_catalog_access_code_id` (`fk_catalog_access_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cac_learning_plan_assignment`
--

DROP TABLE IF EXISTS `cac_learning_plan_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cac_learning_plan_assignment` (
  `fk_learning_plan_id` bigint(20) unsigned NOT NULL,
  `fk_catalog_access_code_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`fk_learning_plan_id`,`fk_catalog_access_code_id`),
  KEY `ix_fk_learning_plan_id` (`fk_learning_plan_id`),
  KEY `ix_fk_catalog_access_code_id` (`fk_catalog_access_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cac_user_assignment`
--

DROP TABLE IF EXISTS `cac_user_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cac_user_assignment` (
  `fk_user_id` bigint(20) unsigned NOT NULL,
  `fk_catalog_access_code_id` bigint(20) unsigned NOT NULL,
  KEY `ix_fk_user_id` (`fk_user_id`),
  KEY `ix_fk_catalog_access_code_id` (`fk_catalog_access_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_access_code`
--

DROP TABLE IF EXISTS `catalog_access_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_access_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  `open_site` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_code` (`domain_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22505010891 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_settings`
--

DROP TABLE IF EXISTS `catalog_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_settings` (
  `version` smallint(5) unsigned NOT NULL,
  `modified` datetime NOT NULL,
  `domain_id` bigint(20) unsigned NOT NULL,
  `show_featured_tab` bit(1) NOT NULL DEFAULT b'1',
  `show_category_tab` bit(1) NOT NULL DEFAULT b'1',
  `show_alphabetical_tab` bit(1) NOT NULL DEFAULT b'1',
  `show_open_ilt_tab` bit(1) NOT NULL DEFAULT b'1',
  `show_online_resources_tab` bit(1) NOT NULL DEFAULT b'1',
  `default_landing` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `universal_search_visible` bit(1) NOT NULL DEFAULT b'0',
  `universal_search_target` tinyint(3) NOT NULL DEFAULT '1',
  `show_ilt_calendar_tab` bit(1) NOT NULL DEFAULT b'0',
  `show_bundle_tab` bit(1) NOT NULL,
  `show_universal_search_option_by_default` tinyint(1) NOT NULL DEFAULT '0',
  `show_courses_filter` tinyint(1) NOT NULL DEFAULT '1',
  `show_ilt_class_filter` tinyint(1) NOT NULL DEFAULT '1',
  `show_featured_filter` tinyint(1) NOT NULL DEFAULT '1',
  `show_olr_filter` tinyint(1) NOT NULL DEFAULT '1',
  `show_bundles_filter` tinyint(1) NOT NULL DEFAULT '1',
  `link_training_to_login` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `dm_category_code` varchar(255) DEFAULT NULL,
  `open_site` tinyint(1) DEFAULT '1',
  `tm_competency` tinyint(1) NOT NULL DEFAULT '0',
  `tm_code` varchar(50) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_category_name_parent_id` (`category_name`,`parent_id`),
  KEY `ix_parent_id` (`parent_id`),
  KEY `dm_ix_category_code` (`dm_category_code`),
  CONSTRAINT `fk1m_category__category` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505053465 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_assignment`
--

DROP TABLE IF EXISTS `category_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_assignment` (
  `course_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`course_id`,`category_id`),
  CONSTRAINT `fk_category_assignment_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certificate`
--

DROP TABLE IF EXISTS `certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `default_certificate` tinyint(1) DEFAULT '0',
  `External_Id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13044 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certificate_courses`
--

DROP TABLE IF EXISTS `certificate_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_courses` (
  `certificate_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  KEY `ix_certificate_id` (`certificate_id`),
  KEY `ix_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certificate_group`
--

DROP TABLE IF EXISTS `certificate_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_group` (
  `group_id` bigint(20) NOT NULL,
  `certificate_id` bigint(20) DEFAULT NULL,
  KEY `ix_group_id` (`group_id`),
  KEY `ix_certificate_id` (`certificate_id`),
  CONSTRAINT `fk1m_certificate_id` FOREIGN KEY (`certificate_id`) REFERENCES `certificate` (`id`),
  CONSTRAINT `fk1m_group_id` FOREIGN KEY (`group_id`) REFERENCES `group_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cj_ka_class_fields`
--

DROP TABLE IF EXISTS `cj_ka_class_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cj_ka_class_fields` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `lms_class_id` bigint(20) NOT NULL DEFAULT '0',
  `CUSTOM01` varchar(255) DEFAULT NULL,
  `ccla_MODIFIED` datetime DEFAULT '1990-01-01 00:00:00',
  KEY `ix_lms_class_id` (`lms_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cj_ka_course_fields`
--

DROP TABLE IF EXISTS `cj_ka_course_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cj_ka_course_fields` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `lms_course_id` bigint(20) NOT NULL DEFAULT '0',
  `CUSTOM01` varchar(255) DEFAULT NULL,
  `cca_MODIFIED` datetime DEFAULT '1990-01-01 00:00:00',
  KEY `ix_lms_course_id` (`lms_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cj_ka_fields`
--

DROP TABLE IF EXISTS `cj_ka_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cj_ka_fields` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `lms_user_id` bigint(20) NOT NULL DEFAULT '0',
  `CUSTOM01` varchar(255) DEFAULT NULL,
  `CUSTOM02` varchar(255) DEFAULT NULL,
  `CUSTOM03` varchar(255) DEFAULT NULL,
  `CUSTOM04` varchar(255) DEFAULT NULL,
  `CUSTOM05` varchar(255) DEFAULT NULL,
  `CUSTOM06` varchar(255) DEFAULT NULL,
  `CUSTOM07` varchar(255) DEFAULT NULL,
  `CUSTOM08` varchar(255) DEFAULT NULL,
  `CUSTOM09` varchar(255) DEFAULT NULL,
  `CUA_MODIFIED` datetime DEFAULT '1990-01-01 00:00:00',
  PRIMARY KEY (`domain_id`,`lms_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cj_registration_ws_log`
--

DROP TABLE IF EXISTS `cj_registration_ws_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cj_registration_ws_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` datetime DEFAULT NULL,
  `mapping` varchar(512) DEFAULT NULL,
  `action` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cj_sf_fields`
--

DROP TABLE IF EXISTS `cj_sf_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cj_sf_fields` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `lms_user_id` bigint(20) NOT NULL DEFAULT '0',
  `CUSTOM01` varchar(255) DEFAULT NULL,
  `CUSTOM02` varchar(255) DEFAULT NULL,
  `CUSTOM03` varchar(255) DEFAULT NULL,
  `CUSTOM04` varchar(255) DEFAULT NULL,
  `CUSTOM05` varchar(255) DEFAULT NULL,
  `CUSTOM06` varchar(255) DEFAULT NULL,
  `CUSTOM07` varchar(255) DEFAULT NULL,
  `CUSTOM08` varchar(255) DEFAULT NULL,
  `CUSTOM09` varchar(255) DEFAULT NULL,
  `CUSTOM10` varchar(255) DEFAULT NULL,
  `CUSTOM11` varchar(255) DEFAULT NULL,
  `CUSTOM12` varchar(255) DEFAULT NULL,
  `CUSTOM13` varchar(255) DEFAULT NULL,
  `CUSTOM14` varchar(255) DEFAULT NULL,
  `CUSTOM15` varchar(255) DEFAULT NULL,
  `DEPARTMENT` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `GENDER` varchar(255) DEFAULT NULL,
  `HR` varchar(255) DEFAULT NULL,
  `DIVISION` varchar(255) DEFAULT NULL,
  `EMPID` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `JOBCODE` varchar(255) DEFAULT NULL,
  `REVIEW_FREQ` varchar(255) DEFAULT NULL,
  `LAST_REVIEW_DATE` varchar(255) DEFAULT NULL,
  `MATRIX_MANAGER` varchar(255) DEFAULT NULL,
  `CUA_MODIFIED` datetime DEFAULT '1990-01-01 00:00:00',
  PRIMARY KEY (`domain_id`,`lms_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cj_ws_dups_registration`
--

DROP TABLE IF EXISTS `cj_ws_dups_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cj_ws_dups_registration` (
  `rcount` bigint(21) NOT NULL DEFAULT '0',
  `course_code` varchar(190) NOT NULL,
  `username` varchar(255) NOT NULL,
  `registration_entry_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` char(1) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `description` text,
  `cost` decimal(19,2) DEFAULT NULL,
  `external_student_cost` decimal(19,2) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `instructor_id` bigint(20) DEFAULT NULL,
  `fk_course_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `class_code` varchar(255) DEFAULT NULL,
  `max_students` int(11) DEFAULT NULL,
  `exceed_max_students` tinyint(2) NOT NULL DEFAULT '0',
  `registration_open_date` datetime DEFAULT NULL,
  `registration_closed_date` datetime DEFAULT NULL,
  `part_can_record` tinyint(1) DEFAULT NULL,
  `host_id` bigint(20) DEFAULT NULL,
  `agenda` text,
  `greeting` text,
  `teleconference_instructions` varchar(1000) DEFAULT NULL,
  `teleconference_type` int(11) DEFAULT NULL,
  `private_class` tinyint(1) DEFAULT '0',
  `created_by_id` bigint(20) DEFAULT NULL,
  `listing` varchar(12) DEFAULT NULL,
  `session_pattern` varchar(225) DEFAULT NULL,
  `integrated_voip` tinyint(4) DEFAULT '0',
  `show_webex_attendance` tinyint(4) DEFAULT '0',
  `launch_url` varchar(600) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `fk_time_zone_id` smallint(6) NOT NULL DEFAULT '393',
  `folder_sco_id` bigint(20) DEFAULT NULL,
  `min_attendees` smallint(6) DEFAULT NULL,
  `fk_reason_id` bigint(20) DEFAULT NULL,
  `daemon_processed` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_subclass_class_code` (`subclass`,`class_code`),
  KEY `ix_domain_id_subclass_name` (`subclass`,`name`(255)),
  KEY `ix_host_id` (`host_id`),
  KEY `ix_instructor_id` (`instructor_id`),
  KEY `dm_ix_class_code` (`class_code`),
  KEY `ix_fk_course_id` (`fk_course_id`),
  KEY `ix_class_fk_time_zone_id` (`fk_time_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22507554275 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class_filterset`
--

DROP TABLE IF EXISTS `class_filterset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_filterset` (
  `class_id` bigint(20) NOT NULL,
  `fk_filter_set_id` bigint(20) NOT NULL,
  UNIQUE KEY `ix_class_filterset` (`class_id`,`fk_filter_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `permanent_amenities` varchar(10000) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `dm_classroom_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_name_location_id` (`name`,`location_id`),
  KEY `ix_location_id` (`location_id`),
  KEY `dm_ix_classroom_code` (`dm_classroom_code`),
  CONSTRAINT `fk1m_classroom__location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505025535 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configure_table_view`
--

DROP TABLE IF EXISTS `configure_table_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configure_table_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) DEFAULT NULL,
  `col_attribute_id` bigint(20) DEFAULT NULL,
  `col_position` int(11) NOT NULL,
  `object_type` int(11) DEFAULT NULL,
  `version` mediumint(8) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_name` (`domain_id`,`col_attribute_id`,`object_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1659 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `code` varchar(190) DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `ceu_credits` double DEFAULT NULL,
  `ceu_hours` int(11) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `format` int(11) DEFAULT NULL,
  `live` tinyint(1) DEFAULT NULL,
  `allow_waivers` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `subject_matter_expert` varchar(255) DEFAULT NULL,
  `training_objectives` varchar(1000) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `show_class_roster` tinyint(1) DEFAULT NULL,
  `test_completes` tinyint(1) DEFAULT NULL,
  `user_mark_complete` tinyint(1) DEFAULT NULL,
  `feedback` tinyint(1) DEFAULT NULL,
  `feedback_type` varchar(255) DEFAULT NULL,
  `certificate` tinyint(1) DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `vendor_course_id` varchar(255) DEFAULT NULL,
  `has_webex_recording` tinyint(1) DEFAULT NULL,
  `external_guid` varchar(40) DEFAULT NULL,
  `external_volume_id` varchar(150) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `vendor_telephone` varchar(32) DEFAULT NULL,
  `vendor_fax` varchar(32) DEFAULT NULL,
  `vendor_email` varchar(255) DEFAULT NULL,
  `vendor_city` varchar(128) DEFAULT NULL,
  `vendor_state` varchar(128) DEFAULT NULL,
  `vendor_postal_code` varchar(25) DEFAULT NULL,
  `vendor_country` varchar(128) DEFAULT NULL,
  `vendor_id_ein` varchar(255) DEFAULT NULL,
  `vendor_payment_number` varchar(255) DEFAULT NULL,
  `allow_elective_course_registration` tinyint(1) DEFAULT NULL,
  `special_cost` double DEFAULT NULL,
  `special_from_date` datetime DEFAULT NULL,
  `special_to_date` datetime DEFAULT NULL,
  `tax_class` int(32) DEFAULT NULL,
  `name_changeable` tinyint(1) DEFAULT NULL,
  `description_changeable` tinyint(1) DEFAULT NULL,
  `subscription_days` smallint(4) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `auth_type` tinyint(4) NOT NULL DEFAULT '0',
  `social_commenting` tinyint(1) NOT NULL DEFAULT '0',
  `review_mode` bit(1) NOT NULL DEFAULT b'1',
  `fk_assignment_rule_id` bigint(20) DEFAULT NULL,
  `folder_sco_id` bigint(20) NOT NULL DEFAULT '0',
  `admin_prints_prior_completion` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_subclass_code` (`subclass`,`code`),
  KEY `ix_domain_id_subclass_external_guid_external_volume_id` (`external_guid`,`external_volume_id`),
  KEY `ix_name` (`name`(255)),
  KEY `ix_vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22506510800 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_assignment`
--

DROP TABLE IF EXISTS `course_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_assignment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `reason_id` bigint(20) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `fk_assignment_rule_id` bigint(20) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  `data_source` tinyint(4) DEFAULT '0',
  `purchased` tinyint(1) NOT NULL DEFAULT '0',
  `fk_bundle_id` bigint(20) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_unique_rule_id` (`fk_assignment_rule_id`),
  KEY `ix_course_id` (`course_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_user_id_course_id` (`user_id`,`course_id`),
  KEY `ix_reason_id` (`reason_id`),
  KEY `fk_course_assignment_filter_set` (`fk_filter_set_id`),
  CONSTRAINT `fk_course_assignment_filter_set` FOREIGN KEY (`fk_filter_set_id`) REFERENCES `filter_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22543012843 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_auto_assignments`
--

DROP TABLE IF EXISTS `course_auto_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_auto_assignments` (
  `domain_id` bigint(20) NOT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `filter_set_id` bigint(20) NOT NULL,
  PRIMARY KEY (`domain_id`,`lms_user_id`,`course_id`,`filter_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_auto_assignments_pass1`
--

DROP TABLE IF EXISTS `course_auto_assignments_pass1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_auto_assignments_pass1` (
  `domain_id` bigint(20) NOT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `filter_set_id` bigint(20) NOT NULL,
  `learning_assignment_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`,`lms_user_id`,`course_id`,`filter_set_id`,`learning_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_auto_assignments_pass2`
--

DROP TABLE IF EXISTS `course_auto_assignments_pass2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_auto_assignments_pass2` (
  `domain_id` bigint(20) NOT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `filter_set_id` bigint(20) NOT NULL,
  `learning_assignment_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`,`lms_user_id`,`course_id`,`filter_set_id`,`learning_assignment_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_lms_user_id` (`lms_user_id`),
  KEY `ix_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_ehri`
--

DROP TABLE IF EXISTS `course_ehri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_ehri` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `continued_service_agreement_required_indicator` varchar(2) DEFAULT NULL,
  `accreditation_indicator` varchar(2) DEFAULT NULL,
  `credit_type_code` varchar(4) DEFAULT NULL,
  `duty_hours` double DEFAULT NULL,
  `non_duty_hours` double DEFAULT NULL,
  `credit_designation_type_code` varchar(4) DEFAULT NULL,
  `training_type_code` varchar(4) DEFAULT NULL,
  `training_subtype_code` varchar(4) DEFAULT NULL,
  `purpose_type_code` varchar(4) DEFAULT NULL,
  `source_type_code` varchar(4) DEFAULT NULL,
  `delivery_type_code` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49989 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_instructor_assignment`
--

DROP TABLE IF EXISTS `course_instructor_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_instructor_assignment` (
  `course_id` bigint(20) NOT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  KEY `ix_course_id` (`course_id`),
  KEY `ix_lms_user_id` (`lms_user_id`),
  CONSTRAINT `fkmm_course_instructor_assignment__course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_result`
--

DROP TABLE IF EXISTS `course_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `registration_entry_id` bigint(20) NOT NULL,
  `is_passed` tinyint(1) NOT NULL,
  `completion_date` datetime DEFAULT NULL,
  `score` int(11) NOT NULL,
  `grade_type` int(11) NOT NULL,
  `letter_grade` varchar(2) DEFAULT NULL,
  `queue_email` tinyint(1) NOT NULL DEFAULT '0',
  `cw_completion_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_registration_entry_id` (`domain_id`,`registration_entry_id`),
  KEY `ix_registration_entry_id` (`registration_entry_id`),
  KEY `ix_queue_email` (`queue_email`)
) ENGINE=InnoDB AUTO_INCREMENT=22561986913 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_rules`
--

DROP TABLE IF EXISTS `course_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rules` (
  `fk_course_id` bigint(20) NOT NULL,
  `rule_name` varchar(255) NOT NULL,
  `fk_filter_set_id` bigint(20) NOT NULL,
  `fk_assignment_rule_id` bigint(20) DEFAULT NULL,
  `with_no_rule` tinyint(1) NOT NULL DEFAULT '0',
  `elective` tinyint(1) NOT NULL DEFAULT '0',
  `fk_reason_id` bigint(20) DEFAULT NULL,
  KEY `fk_course_rules_course` (`fk_course_id`),
  KEY `fk_course_rules_filterset` (`fk_filter_set_id`),
  CONSTRAINT `fk_course_rules_course` FOREIGN KEY (`fk_course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_course_rules_filterset` FOREIGN KEY (`fk_filter_set_id`) REFERENCES `filter_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_version`
--

DROP TABLE IF EXISTS `course_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_version` (
  `registration_entry_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`registration_entry_id`,`version`),
  CONSTRAINT `fk_registration_entry_id` FOREIGN KEY (`registration_entry_id`) REFERENCES `registration_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cultures`
--

DROP TABLE IF EXISTS `cultures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cultures` (
  `culture_code` varchar(5) DEFAULT NULL,
  `culture_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_attribute_def`
--

DROP TABLE IF EXISTS `custom_attribute_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attribute_def` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(110) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_searchable` tinyint(1) DEFAULT NULL,
  `sf_mapping_field` varchar(16) DEFAULT NULL,
  `select_type` smallint(6) DEFAULT NULL,
  `is_catalog_displayable` tinyint(4) DEFAULT NULL,
  `position` smallint(6) NOT NULL,
  `ka_mapping_field` varchar(25) DEFAULT NULL,
  `is_field_visible_in_manager` tinyint(4) NOT NULL DEFAULT '0',
  `is_required` tinyint(4) NOT NULL DEFAULT '0',
  `is_field_configurable` tinyint(4) NOT NULL DEFAULT '1',
  `attribute_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_attribute_type_name` (`domain_id`,`attribute_type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22505319256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_awe_attribute`
--

DROP TABLE IF EXISTS `custom_awe_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_awe_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `request_id` bigint(20) DEFAULT NULL,
  `custom_awe_attribute_def_id` bigint(20) DEFAULT NULL,
  `text_value` varchar(255) DEFAULT NULL,
  `custom_select_attribute_option_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_custom_select_attribute_option_id` (`custom_select_attribute_option_id`),
  KEY `ix_custom_awe_attribute_def_id` (`custom_awe_attribute_def_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_request_id_custom_awe_attribute_def_id` (`request_id`,`custom_awe_attribute_def_id`),
  KEY `ix_request_id` (`request_id`),
  CONSTRAINT `fk1m_custom_awe_attribute_request` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=522542 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_class_attribute`
--

DROP TABLE IF EXISTS `custom_class_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_class_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `custom_class_attribute_def_id` bigint(20) DEFAULT NULL,
  `lms_class_id` bigint(20) DEFAULT NULL,
  `text_value` varchar(255) DEFAULT NULL,
  `custom_select_attribute_option_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_custom_select_attribute_option_id` (`custom_select_attribute_option_id`),
  KEY `ix_custom_class_attribute_def_id` (`custom_class_attribute_def_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_lms_class_id_custom_class_attribute_def_id` (`lms_class_id`,`custom_class_attribute_def_id`),
  CONSTRAINT `fk1m_custom_class_attribute_class` FOREIGN KEY (`lms_class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229797 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_course_attribute`
--

DROP TABLE IF EXISTS `custom_course_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_course_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `custom_course_attribute_def_id` bigint(20) DEFAULT NULL,
  `lms_course_id` bigint(20) DEFAULT NULL,
  `text_value` varchar(255) DEFAULT NULL,
  `custom_select_attribute_option_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_custom_select_attribute_option_id` (`custom_select_attribute_option_id`),
  KEY `ix_custom_course_attribute_def_id` (`custom_course_attribute_def_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_lms_course_id_custom_course_attribute_def_id` (`lms_course_id`,`custom_course_attribute_def_id`),
  CONSTRAINT `fk1m_custom_course_attribute__course` FOREIGN KEY (`lms_course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=671167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_score_comments`
--

DROP TABLE IF EXISTS `custom_score_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_score_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `test_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `percentage_from` int(11) DEFAULT NULL,
  `percentage_to` int(11) DEFAULT NULL,
  `order_position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_test_id` (`test_id`),
  CONSTRAINT `fk1m_custom_score_comments__abstract_test` FOREIGN KEY (`test_id`) REFERENCES `abstract_test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000021717 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_select_attribute_option`
--

DROP TABLE IF EXISTS `custom_select_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_select_attribute_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `custom_select_attribute_def_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_custom_select_attribute_def_id_value` (`custom_select_attribute_def_id`,`value`),
  CONSTRAINT `fk1m_custom_select_attribute_option__custom_attribute_def` FOREIGN KEY (`custom_select_attribute_def_id`) REFERENCES `custom_attribute_def` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22504098990 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_user_attribute`
--

DROP TABLE IF EXISTS `custom_user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_user_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `custom_user_attribute_def_id` bigint(20) DEFAULT NULL,
  `lms_user_id` bigint(20) DEFAULT NULL,
  `text_value` varchar(255) DEFAULT NULL,
  `custom_select_attribute_option_id` bigint(20) DEFAULT NULL,
  `account_request_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_custom_select_attribute_option_id` (`custom_select_attribute_option_id`),
  KEY `ix_custom_user_attribute_def_id` (`custom_user_attribute_def_id`),
  KEY `ix_domain_id_lms_user_id_custom_user_attribute_def_id` (`lms_user_id`,`custom_user_attribute_def_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_text_value` (`text_value`),
  KEY `ix_account_request_id` (`account_request_id`),
  CONSTRAINT `fk1m_custom_user_attribute__lms_user` FOREIGN KEY (`lms_user_id`) REFERENCES `lms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22690737118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_validation_values`
--

DROP TABLE IF EXISTS `custom_validation_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_validation_values` (
  `custom_attribute_def_id` bigint(20) NOT NULL,
  `validation_value` varchar(255) NOT NULL,
  PRIMARY KEY (`custom_attribute_def_id`,`validation_value`),
  KEY `ix_custom_attribute_def_id` (`custom_attribute_def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_course`
--

DROP TABLE IF EXISTS `dashboard_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_course` (
  `fk_learning_assignment_id` bigint(20) NOT NULL,
  `fk_domain_id` bigint(20) NOT NULL,
  `course_name` varchar(512) NOT NULL,
  `course_type` tinyint(4) NOT NULL,
  `course_code` varchar(190) DEFAULT NULL,
  `course_assignment_expired` tinyint(1) NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `fk_user_id` bigint(20) NOT NULL,
  `fk_registration_entry_id` bigint(20) DEFAULT NULL,
  `entry_status` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `course_assignment_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fk_learning_assignment_id`),
  KEY `idx_fk_domain_id` (`fk_domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_domain`
--

DROP TABLE IF EXISTS `dashboard_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_domain` (
  `fk_domain_id` bigint(20) NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `in_progress` bit(1) DEFAULT b'0',
  PRIMARY KEY (`fk_domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_item`
--

DROP TABLE IF EXISTS `dashboard_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_item` (
  `fk_learning_assignment_id` bigint(20) NOT NULL,
  `is_learning_plan` tinyint(1) NOT NULL DEFAULT '0',
  `fk_domain_id` bigint(20) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `fk_user_id` bigint(20) NOT NULL,
  `assignment_expired` tinyint(1) NOT NULL,
  PRIMARY KEY (`fk_learning_assignment_id`,`is_learning_plan`),
  KEY `idx_fk_domain_id_is_required_is_complete` (`fk_domain_id`,`is_completed`,`is_required`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_learning_plan`
--

DROP TABLE IF EXISTS `dashboard_learning_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_learning_plan` (
  `fk_learning_assignment_id` bigint(20) NOT NULL,
  `fk_domain_id` bigint(20) NOT NULL,
  `fk_learning_plan_id` bigint(20) NOT NULL,
  `learning_plan_type` tinyint(1) NOT NULL,
  `fk_assignment_id` bigint(20) DEFAULT NULL,
  `assignment_expired` tinyint(1) NOT NULL,
  `fk_user_id` bigint(20) NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `learning_plan_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fk_learning_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_log`
--

DROP TABLE IF EXISTS `dashboard_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_domain_id` bigint(20) NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=632176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_maxla_temp`
--

DROP TABLE IF EXISTS `dashboard_maxla_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_maxla_temp` (
  `laid` bigint(20) NOT NULL,
  PRIMARY KEY (`laid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_settings`
--

DROP TABLE IF EXISTS `dashboard_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_settings` (
  `domain_id` bigint(20) unsigned NOT NULL,
  `modified` datetime DEFAULT NULL,
  `instruction_heading` varchar(100) DEFAULT NULL,
  `instruction_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `default_domain_lang`
--

DROP TABLE IF EXISTS `default_domain_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_domain_lang` (
  `domain_id` bigint(20) NOT NULL,
  `lang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delegates`
--

DROP TABLE IF EXISTS `delegates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegates` (
  `user_id` bigint(20) NOT NULL,
  `delegated_user_id` bigint(20) DEFAULT NULL,
  `is_delegation_on` tinyint(4) DEFAULT NULL,
  KEY `ix_user_id` (`user_id`),
  KEY `ix_delegated_user_id` (`delegated_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `old_domain_id` bigint(20) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `mapping` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo1_image_name` varchar(255) DEFAULT NULL,
  `login_subtitle` varchar(255) DEFAULT NULL,
  `login_instructions` varchar(255) DEFAULT NULL,
  `parent_domain_id` bigint(20) DEFAULT NULL,
  `volume_id` varchar(40) DEFAULT NULL,
  `key_id` varchar(255) DEFAULT NULL,
  `fk_time_zone_id` smallint(6) DEFAULT NULL,
  `sso_key` char(36) NOT NULL,
  `fk_theme_id` bigint(20) DEFAULT NULL,
  `effective_provisions` int(11) NOT NULL DEFAULT '0',
  `fk_tm_integration_theme_id` bigint(20) DEFAULT NULL,
  `broker_url` varchar(255) DEFAULT NULL,
  `tenant_key` varchar(50) DEFAULT NULL,
  `broker_enabled` bit(1) DEFAULT b'0',
  `thumbprint` varchar(50) DEFAULT NULL,
  `cert_issuer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_mapping` (`mapping`(32)),
  KEY `ix_id_parent_domain_id` (`id`,`parent_domain_id`),
  KEY `ix_name_parent_domain_id` (`name`,`parent_domain_id`),
  KEY `ix_parent_domain_id` (`parent_domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505001777 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_questions`
--

DROP TABLE IF EXISTS `domain_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_questions` (
  `fk_domain_id` bigint(20) NOT NULL,
  `fk_question_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_remapping`
--

DROP TABLE IF EXISTS `domain_remapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_remapping` (
  `domain_newid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `domain_oldid` bigint(20) DEFAULT NULL,
  `domain_oldparentid` bigint(20) DEFAULT NULL,
  `processed` tinyint(4) DEFAULT '0',
  `timetaken` varchar(255) DEFAULT NULL,
  `mapping` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`domain_newid`)
) ENGINE=InnoDB AUTO_INCREMENT=1277 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_remapping_track`
--

DROP TABLE IF EXISTS `domain_remapping_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_remapping_track` (
  `domain_id` smallint(5) DEFAULT NULL,
  `table_name` varchar(64) DEFAULT NULL,
  `column_name` varchar(64) DEFAULT NULL,
  `rowcount` smallint(5) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ehri_data`
--

DROP TABLE IF EXISTS `ehri_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ehri_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `Record_Action` varchar(1) DEFAULT NULL,
  `Agency_Subelement_Code` varchar(4) DEFAULT NULL,
  `Training_Type_Code` varchar(4) DEFAULT NULL,
  `Training_Subtype_Code` varchar(4) DEFAULT NULL,
  `Continued_Service_Agreement_Expiration_Date` date DEFAULT NULL,
  `Continued_Service_Agreement_Required_Indicator` varchar(2) DEFAULT NULL,
  `Training_Materials_Cost` double DEFAULT NULL,
  `Training_Per_Diem_Cost` double DEFAULT NULL,
  `Training_Travel_Cost` double DEFAULT NULL,
  `Training_Tuition_and_Fees` double DEFAULT NULL,
  `Training_Non_Government_Contribution_Cost` double DEFAULT NULL,
  `Social_Security_Number` varchar(255) DEFAULT NULL,
  `Birth_Date` varchar(255) DEFAULT NULL,
  `Training_Title` varchar(60) DEFAULT NULL,
  `Training_Start_Date` date DEFAULT NULL,
  `Training_End_Date` date DEFAULT NULL,
  `Training_Purpose_TypeCode` varchar(4) DEFAULT NULL,
  `Training_Delivery_Type_Code` varchar(4) DEFAULT NULL,
  `Training_Source_Type_Code` varchar(4) DEFAULT NULL,
  `Training_Accreditation_Indicator` varchar(2) DEFAULT NULL,
  `Training_Credit` double DEFAULT NULL,
  `Training_Credit_Designation_Type_Code` varchar(4) DEFAULT NULL,
  `Training_Credit_Type_Code` varchar(4) DEFAULT NULL,
  `Training_Duty_Hours` double DEFAULT NULL,
  `Training_Non_Duty_Hours` double DEFAULT NULL,
  `User_Status` varchar(10) DEFAULT NULL,
  `supervisor` tinyint(1) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_initial` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ehri_exporter`
--

DROP TABLE IF EXISTS `ehri_exporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ehri_exporter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` smallint(5) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `record_count` int(10) unsigned DEFAULT '0',
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_location`
--

DROP TABLE IF EXISTS `equipment_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_location` (
  `equipment_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  KEY `ix_equipment_id` (`equipment_id`),
  CONSTRAINT `fkmm_equipment_location__resource` FOREIGN KEY (`equipment_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `escalated_request_approvers`
--

DROP TABLE IF EXISTS `escalated_request_approvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalated_request_approvers` (
  `request_id` bigint(20) NOT NULL,
  `aws_step_id` bigint(20) NOT NULL,
  KEY `ix_request_id` (`request_id`),
  CONSTRAINT `fkmm_parent_request` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failed_fulfillment_offline_request`
--

DROP TABLE IF EXISTS `failed_fulfillment_offline_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_fulfillment_offline_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `parent_course_id` bigint(20) NOT NULL,
  `course_id_bag` mediumblob,
  `completion_date` datetime NOT NULL,
  `error_description` mediumtext,
  `error_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12079 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failed_learning_plan_assignment_request`
--

DROP TABLE IF EXISTS `failed_learning_plan_assignment_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_learning_plan_assignment_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `learning_plan_id` bigint(20) NOT NULL,
  `fk_assignment_rule_identifier` varchar(255) NOT NULL,
  `user_id_bag` mediumblob,
  `error_description` mediumtext,
  `error_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=549033 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `feature_on` tinyint(1) DEFAULT NULL,
  `module_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_module_id` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505007289 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `subclass` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `fk_filter_set_id` bigint(4) DEFAULT NULL,
  `fk_group_node_id` bigint(20) DEFAULT NULL,
  `expected_value` varchar(255) DEFAULT NULL,
  `cad_id` bigint(20) DEFAULT NULL,
  `option_id` bigint(20) DEFAULT NULL,
  `fk_lms_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_fk_filter_set_id` (`fk_filter_set_id`),
  KEY `ix_option_id` (`option_id`),
  KEY `ix_expected_value` (`expected_value`),
  KEY `ix_cad_id` (`cad_id`),
  KEY `ix_fk_group_node_id` (`fk_group_node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=362189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter_set`
--

DROP TABLE IF EXISTS `filter_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` char(1) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `operator_and` tinyint(1) NOT NULL DEFAULT '0',
  `dm_class_id` bigint(20) DEFAULT NULL,
  `dm_group_node_id` bigint(20) DEFAULT NULL,
  `dm_OLR_id` bigint(20) DEFAULT NULL,
  `do_not_auto_unassign` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7565313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fulfillment_learning_object`
--

DROP TABLE IF EXISTS `fulfillment_learning_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fulfillment_learning_object` (
  `learning_object_id` bigint(20) NOT NULL,
  `fulfillment_id` bigint(20) NOT NULL,
  `completion_type` int(11) NOT NULL,
  KEY `ix_learning_object_id` (`learning_object_id`),
  KEY `ix_fulfillment_id` (`fulfillment_id`),
  CONSTRAINT `fkmm_fulfillment_learning_object__course` FOREIGN KEY (`learning_object_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fulfillment_offline_request`
--

DROP TABLE IF EXISTS `fulfillment_offline_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fulfillment_offline_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_id_bag` mediumblob,
  `parent_course_id` bigint(20) NOT NULL,
  `course_id_bag` mediumblob,
  `completion_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_settings` (
  `domain_id` bigint(20) unsigned NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `modified` datetime NOT NULL,
  `linked_registration` int(10) unsigned NOT NULL,
  `enduser_tutorial` tinyint(3) unsigned NOT NULL,
  `admin_tutorial` tinyint(3) unsigned NOT NULL,
  `custom_enduser_url` varchar(255) DEFAULT NULL,
  `custom_admin_url` varchar(255) DEFAULT NULL,
  `custom_awe` varchar(255) DEFAULT NULL,
  `conflict_management` tinyint(3) unsigned NOT NULL,
  `available_languages` varchar(255) DEFAULT NULL,
  `contact_instructions` varchar(255) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `allow_account_requests` tinyint(3) unsigned NOT NULL,
  `accounts_require_approval` tinyint(3) unsigned NOT NULL,
  `accounts_require_reason` tinyint(3) unsigned NOT NULL,
  `accounts_show_link` tinyint(3) unsigned NOT NULL,
  `allow_opt_out` tinyint(3) unsigned NOT NULL,
  `ehri_code` varchar(4) DEFAULT NULL,
  `display_geo_logo` tinyint(4) NOT NULL DEFAULT '1',
  `max_user_count` int(11) NOT NULL DEFAULT '2',
  `max_disk_gb` smallint(6) NOT NULL DEFAULT '2',
  `host` varchar(255) DEFAULT NULL,
  `enable_assignment_reasons` tinyint(2) NOT NULL DEFAULT '0',
  `assign_elective_learning` tinyint(2) NOT NULL DEFAULT '0',
  `enforce_group_inheritance` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_session_state`
--

DROP TABLE IF EXISTS `geo_session_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_session_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `session_id` varchar(42) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `page` varchar(255) NOT NULL DEFAULT '',
  `workable_objects` mediumtext,
  `stack_level` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_member` (
  `group_node_id` bigint(20) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  KEY `ix_group_node_id` (`group_node_id`),
  KEY `ix_object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_node`
--

DROP TABLE IF EXISTS `group_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `group_name` varchar(255) NOT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `theme_id` bigint(20) DEFAULT NULL,
  `group_code` varchar(255) DEFAULT NULL,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(36) DEFAULT NULL,
  `logo_file` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_parent_id` (`parent_id`),
  KEY `ix_theme_id` (`theme_id`),
  KEY `ix_fk_filter_set_id` (`fk_filter_set_id`),
  KEY `ix_external_id` (`external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22504130255 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `implicit_group_member`
--

DROP TABLE IF EXISTS `implicit_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `implicit_group_member` (
  `fk_group_node_id` bigint(20) NOT NULL,
  `fk_user_id` bigint(20) NOT NULL,
  KEY `ix_fk_group_node_id` (`fk_group_node_id`),
  KEY `ix_fk_user_id` (`fk_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instructor_assignment`
--

DROP TABLE IF EXISTS `instructor_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_assignment` (
  `session_id` bigint(20) NOT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  KEY `ix_session_id` (`session_id`),
  KEY `ix_lms_user_id` (`lms_user_id`),
  CONSTRAINT `fkmm_instructor_assignment__session` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integration_settings`
--

DROP TABLE IF EXISTS `integration_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration_settings` (
  `domain_id` bigint(20) unsigned NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `modified` datetime NOT NULL,
  `echo_site_url` varchar(255) DEFAULT NULL,
  `google_trac_code` varchar(20) DEFAULT NULL,
  `enable_rich_text` tinyint(1) NOT NULL DEFAULT '1',
  `enable_image_attachments` tinyint(1) NOT NULL DEFAULT '1',
  `disable_guest_comments` tinyint(1) NOT NULL DEFAULT '1',
  `enable_comment_expand` tinyint(1) NOT NULL DEFAULT '1',
  `items_per_page` int(11) NOT NULL DEFAULT '25',
  `max_comment_length` int(11) NOT NULL DEFAULT '10000',
  `enable_email_subscription` tinyint(1) NOT NULL DEFAULT '1',
  `allow_social_media_sharing` tinyint(1) NOT NULL DEFAULT '0',
  `enable_rss_feed` tinyint(1) NOT NULL DEFAULT '0',
  `enable_pre_moderation` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invalid_sso_tokens`
--

DROP TABLE IF EXISTS `invalid_sso_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invalid_sso_tokens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `token` varchar(80) DEFAULT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3798 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ka_settings`
--

DROP TABLE IF EXISTS `ka_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ka_settings` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `VERSION` smallint(6) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `filter_type` tinyint(4) DEFAULT NULL,
  `days_from_interval_ilt` tinyint(4) DEFAULT NULL,
  `days_to_interval_ilt` tinyint(4) DEFAULT NULL,
  `days_from_interval_olt` tinyint(4) DEFAULT NULL,
  `days_to_interval_olt` tinyint(4) DEFAULT NULL,
  `max_reporters_allowed` int(11) DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ka_user_completions`
--

DROP TABLE IF EXISTS `ka_user_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ka_user_completions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `external_id` varchar(40) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_status` varchar(10) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_initial` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `KA_Manager_First_Name` varchar(255) DEFAULT NULL,
  `KA_Manager_Last_Name` varchar(255) DEFAULT NULL,
  `ka_manager_email` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `street_address_2` varchar(255) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `postal_code` varchar(25) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `user_location` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `LANGUAGE` varchar(5) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `default_group_name` varchar(255) DEFAULT NULL,
  `demographic_field_01` varchar(255) DEFAULT NULL,
  `demographic_field_02` varchar(255) DEFAULT NULL,
  `demographic_field_03` varchar(255) DEFAULT NULL,
  `demographic_field_04` varchar(255) DEFAULT NULL,
  `demographic_field_05` varchar(255) DEFAULT NULL,
  `demographic_field_06` varchar(255) DEFAULT NULL,
  `demographic_field_07` varchar(255) DEFAULT NULL,
  `demographic_field_08` varchar(255) DEFAULT NULL,
  `demographic_field_09` varchar(255) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `custom_course_field_01` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `custom_class_field_01` varchar(255) DEFAULT NULL,
  `class_cost` varchar(25) DEFAULT NULL,
  `class_start_date` datetime DEFAULT NULL,
  `class_end_date` datetime DEFAULT NULL,
  `session_classroom` varchar(255) DEFAULT NULL,
  `session_location` varchar(255) DEFAULT NULL,
  `instructor` varchar(1000) DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_class_id` (`class_id`),
  KEY `ix_course_id` (`course_id`),
  KEY `ix_session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcms_user`
--

DROP TABLE IF EXISTS `lcms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcms_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` smallint(6) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `lcms_user_id` varchar(64) DEFAULT NULL,
  `fk_lms_user_id` bigint(20) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `lcms_role` varchar(32) DEFAULT NULL,
  `lcms_container` varchar(64) DEFAULT NULL,
  `is_reviewer` tinyint(1) DEFAULT '0',
  `lcms_container_name` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `learning_assignment`
--

DROP TABLE IF EXISTS `learning_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_assignment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) NOT NULL,
  `course_assignment_id` bigint(20) DEFAULT NULL,
  `registration_entry_id` bigint(20) DEFAULT NULL,
  `request_id` bigint(20) DEFAULT NULL,
  `learning_plan_assignment_id` bigint(20) DEFAULT NULL,
  `learning_plan_entry_id` bigint(20) DEFAULT NULL,
  `subscription_expiration_date` datetime DEFAULT NULL,
  `data_source` tinyint(4) DEFAULT '0',
  `is_self_enrolled` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `ix_class_id` (`class_id`),
  KEY `ix_course_assignment_id` (`course_assignment_id`),
  KEY `ix_course_id` (`course_id`),
  KEY `ix_domain_id_lms_user_id` (`domain_id`,`lms_user_id`),
  KEY `ix_learning_plan_assignment_id` (`learning_plan_assignment_id`),
  KEY `ix_learning_plan_entry_id` (`learning_plan_entry_id`),
  KEY `ix_lms_user_id` (`lms_user_id`),
  KEY `ix_registration_entry_id` (`registration_entry_id`),
  KEY `ix_request_id` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22616732523 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `learning_assignment_reason`
--

DROP TABLE IF EXISTS `learning_assignment_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_assignment_reason` (
  `fk_learning_assignment_id` bigint(20) unsigned NOT NULL,
  `fk_reason_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`fk_learning_assignment_id`),
  KEY `ix_reason_id` (`fk_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `learning_plan`
--

DROP TABLE IF EXISTS `learning_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `ceu` double DEFAULT NULL,
  `required_number_of_courses` int(11) DEFAULT NULL,
  `learning_plan_completion_rule` int(11) DEFAULT NULL,
  `learning_objects_ordered` tinyint(1) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `subclass` varchar(255) NOT NULL DEFAULT 'Geolearning.LearningPlan.LearningPlan',
  `dm_lp_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_name` (`domain_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22504057680 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `learning_plan_assignment_request`
--

DROP TABLE IF EXISTS `learning_plan_assignment_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_plan_assignment_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `learning_plan_id` bigint(20) NOT NULL,
  `fk_assignment_rule_identifier` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_id_bag` mediumblob,
  `lp_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_unique_request` (`domain_id`,`learning_plan_id`,`user_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `learning_plan_entry`
--

DROP TABLE IF EXISTS `learning_plan_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_plan_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `learning_plan_id` bigint(20) DEFAULT NULL,
  `learning_object_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_learning_plan_id_learning_object_id` (`learning_plan_id`,`learning_object_id`),
  KEY `ix_learning_object_id` (`learning_object_id`),
  CONSTRAINT `fk1m_learning_plan_entry__learning_plan` FOREIGN KEY (`learning_plan_id`) REFERENCES `learning_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22504519061 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `learning_plan_expiration`
--

DROP TABLE IF EXISTS `learning_plan_expiration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_plan_expiration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `fixed_date` datetime DEFAULT NULL,
  `number_of_days` int(11) DEFAULT NULL,
  `expiration_mode` int(11) DEFAULT NULL,
  `expiration_day` int(11) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2001901066 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `learning_plan_template`
--

DROP TABLE IF EXISTS `learning_plan_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_plan_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `fk_learning_plan_id` bigint(20) NOT NULL,
  `fk_assignment_rule_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_fk_learning_plan_id` (`fk_learning_plan_id`),
  KEY `ix_fk_assignment_rule_id` (`fk_assignment_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=903 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lms_user`
--

DROP TABLE IF EXISTS `lms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `super_user` tinyint(1) DEFAULT NULL,
  `optin` tinyint(1) DEFAULT '1',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_initial` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `postal_code` varchar(25) DEFAULT NULL,
  `postal_code_type` varchar(25) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `external_id` varchar(40) DEFAULT NULL,
  `agency_subelement_code` varchar(4) DEFAULT NULL,
  `privacy_data_id` bigint(20) DEFAULT NULL,
  `default_role_id` bigint(20) DEFAULT NULL,
  `default_group_id` bigint(20) DEFAULT NULL,
  `unique_id` varchar(50) DEFAULT NULL,
  `culture` varchar(5) DEFAULT 'en-US',
  `fk_time_zone_id` smallint(6) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `is_community` tinyint(1) DEFAULT '0',
  `default_supervisor_id` bigint(20) DEFAULT NULL,
  `fk_theme_id` bigint(20) DEFAULT NULL,
  `fk_account_id` bigint(20) NOT NULL DEFAULT '0',
  `owner` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_default_role_id` (`default_role_id`),
  KEY `ix_domain_id_default_role_id` (`domain_id`,`default_role_id`),
  KEY `ix_domain_id_email` (`domain_id`,`email`),
  KEY `ix_domain_id_username` (`domain_id`,`username`),
  KEY `ix_external_id` (`external_id`),
  KEY `ix_privacy_data` (`privacy_data_id`),
  KEY `dm_ix_username` (`username`),
  KEY `ix_default_supervisor_id` (`default_supervisor_id`),
  KEY `ix_user_fk_time_zone_id` (`fk_time_zone_id`),
  KEY `ix_fk_account_id` (`fk_account_id`),
  KEY `ix_unique_id` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22510821280 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `zip_code_type` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `dm_location_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_name` (`domain_id`,`name`),
  KEY `dm_ix_location_code` (`dm_location_code`)
) ENGINE=InnoDB AUTO_INCREMENT=22505156891 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_lpaad_cycles`
--

DROP TABLE IF EXISTS `log_lpaad_cycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_lpaad_cycles` (
  `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `job_id` varchar(32) NOT NULL,
  `step_status_code` tinyint(1) unsigned NOT NULL,
  `step` tinyint(1) unsigned NOT NULL,
  `step_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3345 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_data`
--

DROP TABLE IF EXISTS `login_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_modified` (`modified`),
  KEY `ix_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68096978 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lp_error_log`
--

DROP TABLE IF EXISTS `lp_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lp_error_log` (
  `procedure_name` varchar(150) DEFAULT NULL,
  `assignment_id` bigint(20) DEFAULT NULL,
  `run_date` datetime DEFAULT NULL,
  `assignment_rule_id` bigint(20) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m5_sp_tmp_user_cua_filter_count`
--

DROP TABLE IF EXISTS `m5_sp_tmp_user_cua_filter_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m5_sp_tmp_user_cua_filter_count` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `lms_user_id` bigint(20) NOT NULL DEFAULT '0',
  `fk_filter_set_id` bigint(20) NOT NULL DEFAULT '0',
  `group_count` tinyint(4) DEFAULT NULL,
  `cua_count` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`lms_user_id`,`fk_filter_set_id`),
  KEY `ix_domain_id` (`domain_id`,`lms_user_id`,`fk_filter_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m5_sp_tmp_user_filter_count`
--

DROP TABLE IF EXISTS `m5_sp_tmp_user_filter_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m5_sp_tmp_user_filter_count` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `lms_user_id` bigint(20) NOT NULL DEFAULT '0',
  `fk_filter_set_id` bigint(20) NOT NULL DEFAULT '0',
  `group_count` tinyint(4) DEFAULT NULL,
  `cua_count` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`lms_user_id`,`fk_filter_set_id`),
  KEY `ix_domain_id` (`domain_id`,`lms_user_id`,`fk_filter_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m5_sp_tmp_user_group_membership`
--

DROP TABLE IF EXISTS `m5_sp_tmp_user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m5_sp_tmp_user_group_membership` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `lms_user_id` bigint(20) NOT NULL DEFAULT '0',
  `fk_filter_set_id` bigint(20) NOT NULL DEFAULT '0',
  `fk_group_node_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`,`lms_user_id`,`fk_filter_set_id`,`fk_group_node_id`),
  KEY `ix_domain_id` (`domain_id`,`lms_user_id`,`fk_filter_set_id`,`fk_group_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m5_sp_tmp_user_total_filter_count`
--

DROP TABLE IF EXISTS `m5_sp_tmp_user_total_filter_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m5_sp_tmp_user_total_filter_count` (
  `domain_id` bigint(20) NOT NULL DEFAULT '0',
  `fk_filter_set_id` bigint(20) NOT NULL DEFAULT '0',
  `total_filter_count` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`fk_filter_set_id`),
  KEY `ix_domain_id` (`domain_id`,`fk_filter_set_id`),
  KEY `ix_fk_filter_set_id` (`fk_filter_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m5_sumt_pwresult`
--

DROP TABLE IF EXISTS `m5_sumt_pwresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m5_sumt_pwresult` (
  `domain` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `msg` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m5tmp_auditidstodelete`
--

DROP TABLE IF EXISTS `m5tmp_auditidstodelete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m5tmp_auditidstodelete` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m5tmp_auditobjectids`
--

DROP TABLE IF EXISTS `m5tmp_auditobjectids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m5tmp_auditobjectids` (
  `object_id` bigint(20) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `object_type` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maestro_patch`
--

DROP TABLE IF EXISTS `maestro_patch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maestro_patch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(512) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_ix_file_name` (`file_name`(255)),
  KEY `dm_execute_time` (`execute_time`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `magento_prices`
--

DROP TABLE IF EXISTS `magento_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_prices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `external_course_id` varchar(36) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `base_price` double DEFAULT NULL,
  `group_price` double DEFAULT NULL,
  `external_group_node_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_external_course_id` (`external_course_id`),
  KEY `ix_external_group_node_id` (`external_group_node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26268615 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `magento_sync_request`
--

DROP TABLE IF EXISTS `magento_sync_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magento_sync_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `requestor_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `additional_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_status_created` (`status`,`created`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `management_access_controls`
--

DROP TABLE IF EXISTS `management_access_controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_access_controls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT '0',
  `domain_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `group_node_id` bigint(20) DEFAULT NULL,
  `access` tinyint(4) NOT NULL,
  `target_type` varchar(8) DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1m_group_node` (`group_node_id`),
  KEY `ix_target` (`target_type`,`target_id`),
  KEY `ix_target_id` (`target_id`),
  CONSTRAINT `fk1m_group_node` FOREIGN KEY (`group_node_id`) REFERENCES `group_node` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clazz` varchar(255) DEFAULT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22504318910 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `version` int(16) NOT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `is_client_administratable` tinyint(1) NOT NULL DEFAULT '0',
  `is_beta` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85707 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ms_sp_tmp_assignment_percent`
--

DROP TABLE IF EXISTS `ms_sp_tmp_assignment_percent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_sp_tmp_assignment_percent` (
  `assignment_id` bigint(20) NOT NULL,
  `learning_plan_rule` int(11) NOT NULL,
  `learning_plan_id` bigint(20) NOT NULL,
  PRIMARY KEY (`assignment_id`,`learning_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navigation_element`
--

DROP TABLE IF EXISTS `navigation_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_element` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `mockup_id` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `long_description` varchar(1024) DEFAULT NULL,
  `page` varchar(1024) DEFAULT NULL,
  `iconid` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `subclass` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `default_selection` tinyint(4) DEFAULT NULL,
  `order_id` tinyint(4) DEFAULT NULL,
  `archivable` tinyint(1) DEFAULT '1',
  `height` smallint(6) NOT NULL DEFAULT '0',
  `width` smallint(6) NOT NULL DEFAULT '0',
  `tm_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_navigation_element_parent_id` (`parent_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250602 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_name` (`domain_id`,`name`),
  KEY `ix_user_id` (`user_id`),
  CONSTRAINT `fk1m_notes__lms_user` FOREIGN KEY (`user_id`) REFERENCES `lms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7528 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_event`
--

DROP TABLE IF EXISTS `notification_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `default_message_id` bigint(20) DEFAULT NULL,
  `supervisor_notification` tinyint(1) DEFAULT '1',
  `disable_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_default_message_id` (`default_message_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505091432 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_message`
--

DROP TABLE IF EXISTS `notification_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `notification_event_id` bigint(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` varchar(10000) DEFAULT NULL,
  `rank` smallint(5) unsigned DEFAULT NULL,
  `user_list_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_notification_event_id` (`notification_event_id`),
  KEY `ix_user_list_id` (`user_list_id`),
  CONSTRAINT `fk1m_notification_message__notification_event` FOREIGN KEY (`notification_event_id`) REFERENCES `notification_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505093471 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_message_audience`
--

DROP TABLE IF EXISTS `notification_message_audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_message_audience` (
  `fk_notification_message_id` bigint(20) NOT NULL,
  `fk_audience_id` bigint(20) NOT NULL,
  KEY `fk_notification_message_id` (`fk_notification_message_id`),
  KEY `fk_audience_id` (`fk_audience_id`),
  CONSTRAINT `notification_message_audience_ibfk_1` FOREIGN KEY (`fk_notification_message_id`) REFERENCES `notification_message` (`id`),
  CONSTRAINT `notification_message_audience_ibfk_2` FOREIGN KEY (`fk_audience_id`) REFERENCES `filter_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `null_search_log`
--

DROP TABLE IF EXISTS `null_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `null_search_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `search_type` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `tab_name` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5796460 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `null_search_log_filter`
--

DROP TABLE IF EXISTS `null_search_log_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `null_search_log_filter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `filter_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `entry_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1836682 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_settings`
--

DROP TABLE IF EXISTS `oauth_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_settings` (
  `domain_id` bigint(20) unsigned NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `modified` datetime NOT NULL,
  `oauth_enabled` tinyint(1) NOT NULL,
  `google_enabled` tinyint(1) NOT NULL,
  `validation_service_enabled` tinyint(1) NOT NULL,
  `new_user_url` varchar(1024) DEFAULT NULL,
  `new_user_success_id` varchar(64) DEFAULT NULL,
  `new_user_failure_id` varchar(64) DEFAULT NULL,
  `existing_user_url` varchar(1024) DEFAULT NULL,
  `existing_user_success_id` varchar(64) DEFAULT NULL,
  `existing_user_failure_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_resource`
--

DROP TABLE IF EXISTS `online_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `resource_id` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content` text,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  `launch_method` varchar(255) DEFAULT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  `open_site` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_fk_filter_set_id` (`fk_filter_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83266 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_resource_category_assignment`
--

DROP TABLE IF EXISTS `online_resource_category_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_resource_category_assignment` (
  `online_resource_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  KEY `ix_online_resource_id` (`online_resource_id`),
  CONSTRAINT `fkmm_online_resource_category_assignment__online_resource` FOREIGN KEY (`online_resource_id`) REFERENCES `online_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_resource_course_assignment`
--

DROP TABLE IF EXISTS `online_resource_course_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_resource_course_assignment` (
  `online_resource_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  KEY `ix_online_resource_id` (`online_resource_id`),
  KEY `ix_course_id` (`course_id`),
  CONSTRAINT `fkmm_online_resource_course_assignment__online_resource` FOREIGN KEY (`online_resource_id`) REFERENCES `online_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_resource_tracker`
--

DROP TABLE IF EXISTS `online_resource_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_resource_tracker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `online_resource_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `last_accessed_date` datetime DEFAULT NULL,
  `access_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_user_id` (`user_id`),
  KEY `ix_online_resource_id` (`online_resource_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5871678 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oru_registration_ws`
--

DROP TABLE IF EXISTS `oru_registration_ws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oru_registration_ws` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_code` varchar(255) NOT NULL,
  `course_code` varchar(190) NOT NULL,
  `course_type` varchar(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `grade_type` varchar(2) DEFAULT NULL,
  `score` varchar(4) DEFAULT NULL,
  `letter_grade` varchar(2) DEFAULT NULL,
  `is_passed` varchar(1) DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `completion_status` varchar(50) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `lms_user_id` bigint(20) DEFAULT NULL,
  `lms_course_id` bigint(20) DEFAULT NULL,
  `lms_course_assignment_id` bigint(20) DEFAULT NULL,
  `lms_registration_id` bigint(20) DEFAULT NULL,
  `lms_class_id` bigint(20) DEFAULT NULL,
  `lms_registration_entry_id` bigint(20) DEFAULT NULL,
  `lms_request_id` bigint(20) DEFAULT NULL,
  `lms_course_type` varchar(50) DEFAULT NULL,
  `registration_entry_status` varchar(20) DEFAULT NULL,
  `registration_type` varchar(16) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `mapping` varchar(255) DEFAULT NULL,
  `load_date` varchar(64) DEFAULT NULL,
  `error_msg` text,
  `error_flag` tinyint(4) DEFAULT '0',
  `exists_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dm_ix_username` (`username`),
  KEY `dm_ix_course_code` (`course_code`),
  KEY `dm_ix_lms_course_id` (`lms_course_id`),
  KEY `dm_ix_lms_user_id` (`lms_user_id`),
  KEY `dm_ix_class_code` (`class_code`),
  KEY `dm_ix_lms_class_id` (`lms_class_id`),
  KEY `dm_ix_lms_registration_id` (`lms_registration_id`),
  KEY `dm_ix_score` (`score`),
  KEY `dm_ix_lms_registration_entry_id` (`lms_registration_entry_id`),
  KEY `dm_ix_completion_date` (`completion_date`),
  KEY `dm_ix_registration_date` (`registration_date`),
  KEY `dm_ix_lms_course_assignment_id` (`lms_course_assignment_id`),
  KEY `dm_ix_error_flag` (`error_flag`),
  KEY `dm_ix_exists_flag` (`exists_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=3369 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oru_registration_ws_log`
--

DROP TABLE IF EXISTS `oru_registration_ws_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oru_registration_ws_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` datetime DEFAULT NULL,
  `mapping` varchar(512) DEFAULT NULL,
  `action` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oru_ws_rules_lookup`
--

DROP TABLE IF EXISTS `oru_ws_rules_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oru_ws_rules_lookup` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_completion_status` varchar(255) NOT NULL,
  `file_completion_status` varchar(20) NOT NULL,
  `exists_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_sys_completion_status` (`sys_completion_status`),
  KEY `ix_file_completion_status` (`file_completion_status`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_queue`
--

DROP TABLE IF EXISTS `password_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_queue` (
  `acct_id` bigint(20) NOT NULL,
  `dbstring` varchar(255) DEFAULT NULL,
  `idx` bigint(20) NOT NULL,
  KEY `ix_acct_id` (`acct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persistent_enum`
--

DROP TABLE IF EXISTS `persistent_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_enum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_type_name_value` (`type_name`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prerequisite_learning_object`
--

DROP TABLE IF EXISTS `prerequisite_learning_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prerequisite_learning_object` (
  `learning_object_id` bigint(20) NOT NULL,
  `prerequisite_id` bigint(20) NOT NULL,
  KEY `ix_learning_object_id` (`learning_object_id`),
  KEY `ix_prerequisite_id` (`prerequisite_id`),
  CONSTRAINT `fkmm_prerequisite_learning_object__course` FOREIGN KEY (`learning_object_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `learning_objective_id` bigint(20) DEFAULT NULL,
  `abstract_test_id` bigint(20) DEFAULT NULL,
  `description` varchar(350) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_position` int(11) DEFAULT NULL,
  `point_value` int(11) DEFAULT NULL,
  `alignment` varchar(255) DEFAULT NULL,
  `control_option` varchar(255) DEFAULT NULL,
  `image_file` varchar(255) DEFAULT NULL,
  `dm_question_code` varchar(255) DEFAULT NULL,
  `partial_credit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_abstract_test_id` (`abstract_test_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_learning_objective_id` (`learning_objective_id`),
  KEY `dm_ix_question_code` (`dm_question_code`),
  CONSTRAINT `fk1m_question__abstract_test` FOREIGN KEY (`abstract_test_id`) REFERENCES `abstract_test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22504496295 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question_category_assignment`
--

DROP TABLE IF EXISTS `question_category_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_category_assignment` (
  `question_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`question_id`,`category_id`),
  CONSTRAINT `fk_question_category_assignment_course` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question_instance`
--

DROP TABLE IF EXISTS `question_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `scored` tinyint(1) DEFAULT NULL,
  `correct` double DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `test_instance_id` bigint(20) DEFAULT NULL,
  `order_position` int(11) DEFAULT NULL,
  `dm_question_instance_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_question_id` (`question_id`),
  KEY `ix_test_instance_id` (`test_instance_id`),
  KEY `dm_ix_question_instance_code` (`dm_question_instance_code`),
  CONSTRAINT `fk1m_question_instance__test_instance` FOREIGN KEY (`test_instance_id`) REFERENCES `test_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68395311 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate_limit_entries`
--

DROP TABLE IF EXISTS `rate_limit_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_limit_entries` (
  `domain_id` bigint(20) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reason`
--

DROP TABLE IF EXISTS `reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reason_type` varchar(190) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `dm_reason_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_name_reason_type` (`name`,`reason_type`),
  KEY `dm_ix_reason_code` (`dm_reason_code`)
) ENGINE=InnoDB AUTO_INCREMENT=22504006889 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registration_entry`
--

DROP TABLE IF EXISTS `registration_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `entry_status` varchar(255) DEFAULT NULL,
  `userid` bigint(20) NOT NULL,
  `reasonid` bigint(20) DEFAULT NULL,
  `completion_status` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `fk_class_id` bigint(20) NOT NULL,
  `droppable` int(11) NOT NULL DEFAULT '1',
  `admin_override` tinyint(1) NOT NULL DEFAULT '0',
  `data_source` tinyint(4) DEFAULT '0',
  `launch_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_reasonid` (`reasonid`),
  KEY `ix_userid_fk_class_id` (`userid`,`fk_class_id`),
  KEY `ix_fk_class_id_status` (`fk_class_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=22587870169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registration_entry_webex_recording`
--

DROP TABLE IF EXISTS `registration_entry_webex_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_entry_webex_recording` (
  `registration_entry_id` bigint(20) NOT NULL,
  `fk_webex_recording_id` bigint(20) DEFAULT NULL,
  KEY `ix_registration_entry_id` (`registration_entry_id`),
  CONSTRAINT `fkmm_registration_entry_webex_recording__registration_entry` FOREIGN KEY (`registration_entry_id`) REFERENCES `registration_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_instance`
--

DROP TABLE IF EXISTS `report_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `report_base_name` varchar(255) DEFAULT NULL,
  `owner_lms_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `fk1m_report_instance__lms_user` (`owner_lms_user_id`),
  CONSTRAINT `fk1m_report_instance__domain` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
  CONSTRAINT `fk1m_report_instance__lms_user` FOREIGN KEY (`owner_lms_user_id`) REFERENCES `lms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25600 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_instance_share_entry`
--

DROP TABLE IF EXISTS `report_instance_share_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_instance_share_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `lms_user_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `report_instance_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `fk1m_report_instance_share_entry__lms_user` (`lms_user_id`),
  KEY `fk1m_report_instance_share_entry__group_node` (`group_id`),
  KEY `fk1m_report_instance_share_entry__role` (`role_id`),
  KEY `fk1m_report_instance_share_entry__report_instance` (`report_instance_id`),
  CONSTRAINT `fk1m_report_instance_share_entry__domain` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
  CONSTRAINT `fk1m_report_instance_share_entry__group_node` FOREIGN KEY (`group_id`) REFERENCES `group_node` (`id`),
  CONSTRAINT `fk1m_report_instance_share_entry__lms_user` FOREIGN KEY (`lms_user_id`) REFERENCES `lms_user` (`id`),
  CONSTRAINT `fk1m_report_instance_share_entry__report_instance` FOREIGN KEY (`report_instance_id`) REFERENCES `report_instance` (`id`),
  CONSTRAINT `fk1m_report_instance_share_entry__role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15427 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_preference`
--

DROP TABLE IF EXISTS `report_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_preference` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `preference_kind` varchar(64) DEFAULT NULL,
  `sign` varchar(32) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `preference_enabled` int(11) DEFAULT NULL,
  `report_instance_id` bigint(20) DEFAULT NULL,
  `custom_attribute` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `fk1m_report_preference__report_instance` (`report_instance_id`),
  CONSTRAINT `fk1m_report_preference__domain` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
  CONSTRAINT `fk1m_report_preference__report_instance` FOREIGN KEY (`report_instance_id`) REFERENCES `report_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2422869 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_preference_value`
--

DROP TABLE IF EXISTS `report_preference_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_preference_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `report_preference_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `fk1m_report_preference_value__report_preference` (`report_preference_id`),
  CONSTRAINT `fk1m_report_preference_value__domain` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
  CONSTRAINT `fk1m_report_preference_value__report_preference` FOREIGN KEY (`report_preference_id`) REFERENCES `report_preference` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1149417 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` char(1) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `review_comments` varchar(1000) DEFAULT NULL,
  `visible_comments` tinyint(1) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `request_status` int(11) DEFAULT NULL,
  `requestor_id` bigint(20) DEFAULT NULL,
  `parent_approval_workflow_id` bigint(20) DEFAULT NULL,
  `learning_object_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `continued_service_agreement` tinyint(1) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `requestor_supervisor_id` bigint(20) DEFAULT NULL,
  `request_title` varchar(100) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `parent_request_id` bigint(20) DEFAULT NULL,
  `requestor_comment` varchar(1000) DEFAULT NULL,
  `escalated` tinyint(4) DEFAULT '0',
  `drop_reason_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_class_id` (`class_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_learning_object_id` (`learning_object_id`),
  KEY `ix_parent_approval_workflow_id` (`parent_approval_workflow_id`),
  KEY `ix_requestor_id` (`requestor_id`),
  KEY `ix_requestor_supervisor_id` (`requestor_supervisor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000388399 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_form`
--

DROP TABLE IF EXISTS `request_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `required_submitted` tinyint(1) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `certifying_official_id` bigint(20) DEFAULT NULL,
  `Template_name` varchar(255) DEFAULT NULL,
  `parent_request_form_id` bigint(20) DEFAULT NULL,
  `days_prior_to_drop` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_certifying_official_id` (`certifying_official_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505004834 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_form_certifying_official`
--

DROP TABLE IF EXISTS `request_form_certifying_official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_form_certifying_official` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `parent_request_form_id` bigint(20) DEFAULT NULL,
  `immediate_supervisor` tinyint(1) DEFAULT NULL,
  `self_approves` tinyint(1) DEFAULT NULL,
  `user_role_id` bigint(20) DEFAULT NULL,
  `user_cua` varchar(255) DEFAULT NULL,
  `individual_id` bigint(20) DEFAULT NULL,
  `certifying_official_type` int(11) DEFAULT NULL,
  `show_user_name` tinyint(1) DEFAULT NULL,
  `show_user_email` tinyint(1) DEFAULT NULL,
  `show_user_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_individual_id` (`individual_id`),
  KEY `ix_parent_request_form_id` (`parent_request_form_id`),
  KEY `ix_user_role_id` (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505001250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_form_custom_attribute_def`
--

DROP TABLE IF EXISTS `request_form_custom_attribute_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_form_custom_attribute_def` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `request_form_id` bigint(20) NOT NULL,
  `custom_attribute_def_id` bigint(20) NOT NULL,
  `order_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_request_form_id` (`request_form_id`),
  KEY `ix_custom_attribute_def_id` (`custom_attribute_def_id`),
  CONSTRAINT `fk1m_request_form` FOREIGN KEY (`request_form_id`) REFERENCES `request_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92688 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_form_customucca_def`
--

DROP TABLE IF EXISTS `request_form_customucca_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_form_customucca_def` (
  `request_form_id` bigint(20) NOT NULL,
  `custom_ucca_def_id` bigint(20) NOT NULL,
  KEY `ix_request_form_id` (`request_form_id`),
  CONSTRAINT `fkmm_request_form_customucca_def_request_form` FOREIGN KEY (`request_form_id`) REFERENCES `request_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_form_section`
--

DROP TABLE IF EXISTS `request_form_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_form_section` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_section_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_parent_section_id` (`parent_section_id`),
  CONSTRAINT `fk1m_request_form_section__request_form_section` FOREIGN KEY (`parent_section_id`) REFERENCES `request_form_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505010655 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_form_step`
--

DROP TABLE IF EXISTS `request_form_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_form_step` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_request_form_id` bigint(20) DEFAULT NULL,
  `immediate_supervisor` tinyint(1) DEFAULT NULL,
  `user_role_id` bigint(20) DEFAULT NULL,
  `user_cua` varchar(255) DEFAULT NULL,
  `individual_id` bigint(20) DEFAULT NULL,
  `approver_type` int(11) DEFAULT NULL,
  `show_user_name` tinyint(1) DEFAULT NULL,
  `show_user_email` tinyint(1) DEFAULT NULL,
  `show_user_status` tinyint(1) DEFAULT NULL,
  `secondlevel_supervisor` tinyint(1) DEFAULT NULL,
  `class_instructor` tinyint(1) DEFAULT NULL,
  `is_drop_approval` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_individual_id` (`individual_id`),
  KEY `ix_parent_request_form_id` (`parent_request_form_id`),
  KEY `ix_user_role_id` (`user_role_id`),
  CONSTRAINT `fk1m_request_form_step__request_form` FOREIGN KEY (`parent_request_form_id`) REFERENCES `request_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505008623 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_step`
--

DROP TABLE IF EXISTS `request_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_step` (
  `comments` varchar(1024) DEFAULT NULL,
  `approver_id` bigint(20) DEFAULT NULL,
  `parent_request_id` bigint(20) DEFAULT NULL,
  `parent_workflow_step_id` bigint(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `request_status` int(11) DEFAULT NULL,
  `visible_comments` tinyint(1) DEFAULT NULL,
  `step_date` datetime DEFAULT NULL,
  `super_approver` tinyint(1) DEFAULT NULL,
  KEY `ix_approver_id` (`approver_id`),
  KEY `ix_parent_request_id` (`parent_request_id`),
  KEY `ix_parent_workflow_step_id` (`parent_workflow_step_id`),
  CONSTRAINT `fk1m_request_step__request` FOREIGN KEY (`parent_request_id`) REFERENCES `request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `equipment_type` varchar(255) DEFAULT NULL,
  `equipment_identification` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cost` decimal(19,2) DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20000001209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `reviewer_id` bigint(20) DEFAULT NULL,
  `review_text` varchar(10000) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `stars` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_course_id` (`course_id`),
  KEY `ix_domain_id_course_id` (`domain_id`,`course_id`),
  KEY `ix_domain_id_reviewer_id` (`domain_id`,`reviewer_id`),
  KEY `ix_reviewer_id` (`reviewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33011 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_editable` tinyint(1) DEFAULT NULL,
  `default_navigation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_name` (`domain_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22505012565 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_assignment`
--

DROP TABLE IF EXISTS `role_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_assignment` (
  `lms_user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `ix_lms_user_id` (`lms_user_id`),
  KEY `ix_role_id` (`role_id`),
  CONSTRAINT `fkmm_role_assignment__lms_user` FOREIGN KEY (`lms_user_id`) REFERENCES `lms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roster_entry`
--

DROP TABLE IF EXISTS `roster_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roster_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `lms_user_id` bigint(20) DEFAULT NULL,
  `meeting_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_lms_user_id_meeting_id` (`lms_user_id`,`meeting_id`),
  KEY `ix_meeting_id` (`meeting_id`),
  CONSTRAINT `fk1m_roster_entry__meeting` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000120612 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rule_reminder`
--

DROP TABLE IF EXISTS `rule_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_reminder` (
  `fk_assignment_rule_id` bigint(20) NOT NULL,
  `offset_days` smallint(6) NOT NULL,
  KEY `ix_fk_assignment_rule_id` (`fk_assignment_rule_id`),
  CONSTRAINT `rule_reminder_ibfk_1` FOREIGN KEY (`fk_assignment_rule_id`) REFERENCES `assignment_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saml_settings`
--

DROP TABLE IF EXISTS `saml_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saml_settings` (
  `domain_id` bigint(20) unsigned NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `modified` datetime NOT NULL,
  `x509` blob,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `secondary_logo`
--

DROP TABLE IF EXISTS `secondary_logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secondary_logo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `file_name` varchar(512) DEFAULT NULL,
  `file_identifier` varchar(50) DEFAULT NULL,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=812 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_answers`
--

DROP TABLE IF EXISTS `security_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_answers` (
  `fk_lms_user_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `answer_hash` varchar(255) NOT NULL,
  KEY `ix_fk_lms_user_id` (`fk_lms_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_questions`
--

DROP TABLE IF EXISTS `security_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` smallint(5) unsigned DEFAULT NULL,
  `question` varchar(1024) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `is_public` smallint(6) DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_settings`
--

DROP TABLE IF EXISTS `security_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_settings` (
  `domain_id` bigint(20) unsigned NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `modified` datetime NOT NULL,
  `hard_life_time` double unsigned NOT NULL,
  `idle_life_time` double unsigned NOT NULL,
  `inactive_user_time` smallint(5) unsigned NOT NULL,
  `dictionary_file` varchar(25) DEFAULT NULL,
  `max_failure_count` smallint(5) unsigned NOT NULL,
  `max_queue_length` smallint(5) unsigned NOT NULL,
  `min_length` smallint(5) unsigned NOT NULL,
  `min_lowercase` smallint(5) unsigned NOT NULL,
  `min_numbers` smallint(5) unsigned NOT NULL,
  `min_punctuation` smallint(5) unsigned NOT NULL,
  `min_uppercase` smallint(5) unsigned NOT NULL,
  `pw_hold_time` double unsigned NOT NULL,
  `pw_life_time` double unsigned NOT NULL,
  `punctuation_set` varchar(35) DEFAULT NULL,
  `tmp_pw_lifetime` double unsigned NOT NULL,
  `max_failture_release_time` smallint(5) unsigned NOT NULL,
  `attempt_login_interval` smallint(5) unsigned NOT NULL,
  `logout_url` varchar(255) DEFAULT NULL,
  `password_reset` smallint(5) DEFAULT NULL,
  `question_count` smallint(5) DEFAULT NULL,
  `user_answer` smallint(5) DEFAULT NULL,
  `notification_path` varchar(255) DEFAULT NULL,
  `disable_maestro_login` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `classroom_id` bigint(20) DEFAULT NULL,
  `session_key` varchar(64) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `dm_session_code` varchar(255) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `original_start_date_time` datetime DEFAULT NULL,
  `original_end_date_time` datetime DEFAULT NULL,
  `recurrence_value` smallint(1) DEFAULT '0',
  `sco_id` bigint(20) DEFAULT NULL,
  `meeting_url` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_class_id` (`class_id`),
  KEY `ix_classroom_id` (`classroom_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_subclass_class_id` (`subclass`,`class_id`),
  CONSTRAINT `fk1m_session__class` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk1m_session__classroom` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22506726186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_reminder_email`
--

DROP TABLE IF EXISTS `session_reminder_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_reminder_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_class_id` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `interval_minutes` int(6) NOT NULL DEFAULT '15',
  `custom_message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_fk_class_id` (`fk_class_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=411869 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_reminder_email_sent`
--

DROP TABLE IF EXISTS `session_reminder_email_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_reminder_email_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_session_id` bigint(11) NOT NULL,
  `fk_lms_user_id` bigint(11) NOT NULL,
  `date_sent` datetime NOT NULL,
  `session_date_start` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_fk_session_id` (`fk_session_id`),
  KEY `ix_fk_lms_user_id` (`fk_lms_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=572758 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_resources`
--

DROP TABLE IF EXISTS `session_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_resources` (
  `resource_id` bigint(20) NOT NULL,
  `session_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `ix_resource_id` (`resource_id`),
  CONSTRAINT `fkmm_session_resources__resource` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_result`
--

DROP TABLE IF EXISTS `session_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `roster_entry_id` bigint(20) DEFAULT NULL,
  `attendance` tinyint(1) DEFAULT NULL,
  `external_attendance` tinyint(1) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `lms_user_id` bigint(20) DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_roster_entry_id` (`domain_id`,`roster_entry_id`),
  KEY `ix_roster_entry_id` (`roster_entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2003089333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `setting_enum` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_setting_enum` (`domain_id`,`setting_enum`),
  KEY `ix_domain_id_setting_enum_user_id` (`setting_enum`,`user_id`),
  KEY `ix_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22505174852 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_current_unique_ids`
--

DROP TABLE IF EXISTS `sf_current_unique_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_current_unique_ids` (
  `unique_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_flattable_supervisors`
--

DROP TABLE IF EXISTS `sf_flattable_supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_flattable_supervisors` (
  `learner_id` bigint(20) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `sup_unique_ids` text,
  KEY `sf_ix_learner_id` (`learner_id`),
  KEY `sf_ix_domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_user_time_zone`
--

DROP TABLE IF EXISTS `sf_user_time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_user_time_zone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `geo_time_zone` varchar(255) DEFAULT NULL,
  `offset` varchar(16) DEFAULT NULL,
  `sf_time_zone` varchar(255) NOT NULL,
  `lms_time_zone_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_ix_geo_time_zone` (`geo_time_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortcut`
--

DROP TABLE IF EXISTS `shortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcut` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `navigation_element_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39354 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `splash_screen`
--

DROP TABLE IF EXISTS `splash_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splash_screen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `splash_rule` smallint(3) DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `content` text,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `splash_screen_views`
--

DROP TABLE IF EXISTS `splash_screen_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splash_screen_views` (
  `fk_splash_screen_id` int(11) NOT NULL,
  `fk_lms_user_id` bigint(20) NOT NULL,
  KEY `ix_fk_lms_user_id` (`fk_lms_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_duplicate_list`
--

DROP TABLE IF EXISTS `store_duplicate_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_duplicate_list` (
  `store_number` varchar(255) NOT NULL,
  `domain_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `successfactors_run_dates`
--

DROP TABLE IF EXISTS `successfactors_run_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `successfactors_run_dates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `course_export_last_ran` datetime DEFAULT NULL,
  `user_export_last_ran` datetime DEFAULT NULL,
  `completion_export_last_ran` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=904 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `successfactors_settings`
--

DROP TABLE IF EXISTS `successfactors_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `successfactors_settings` (
  `domain_id` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `sso_protocol` tinyint(4) DEFAULT NULL,
  `sso_url` varchar(255) DEFAULT NULL,
  `company_id` varchar(50) DEFAULT NULL,
  `ftp_ip` varchar(50) DEFAULT NULL,
  `ftp_username` varchar(25) DEFAULT NULL,
  `ftp_password` varchar(50) DEFAULT NULL,
  `secret_key` varchar(50) DEFAULT NULL,
  `tk_login_key` varchar(50) DEFAULT NULL,
  `trusted_password` varchar(50) DEFAULT NULL,
  `trusted_user` varchar(50) DEFAULT NULL,
  `course_completion_url` varchar(255) DEFAULT NULL,
  `completion_export_interval` smallint(6) NOT NULL DEFAULT '1',
  `has_user_export` tinyint(4) NOT NULL DEFAULT '0',
  `has_course_export` tinyint(4) NOT NULL DEFAULT '0',
  `has_bg_export` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisor` (
  `supervisor_id` bigint(20) NOT NULL,
  `direct_report_id` bigint(20) NOT NULL,
  KEY `ix_direct_report_id` (`direct_report_id`),
  KEY `ix_supervisor_id` (`supervisor_id`),
  CONSTRAINT `fkmm_supervisor__lms_user` FOREIGN KEY (`direct_report_id`) REFERENCES `lms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `id` bigint(20) NOT NULL,
  `anonymous_response` tinyint(1) DEFAULT NULL,
  `completions` int(11) DEFAULT NULL,
  KEY `ix_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Version` smallint(5) unsigned NOT NULL,
  `start_utc` datetime NOT NULL,
  `end_utc` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_reg_entry_id`
--

DROP TABLE IF EXISTS `temp_reg_entry_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_reg_entry_id` (
  `reg_entry_id` bigint(20) DEFAULT NULL,
  `droppable` int(11) DEFAULT NULL,
  KEY `ix_reg_entry_id` (`reg_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL,
  `display_objective` tinyint(1) DEFAULT NULL,
  `immediate_feedback` tinyint(1) DEFAULT NULL,
  `display_results` tinyint(1) DEFAULT NULL,
  `passing_score` int(11) DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `display_time_left` tinyint(1) DEFAULT NULL,
  `is_timed` tinyint(1) DEFAULT NULL,
  `attempts_allowed` int(11) DEFAULT NULL,
  KEY `ix_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_course_assignment`
--

DROP TABLE IF EXISTS `test_course_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_course_assignment` (
  `abstract_test_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  KEY `ix_abstract_test_id` (`abstract_test_id`),
  KEY `ix_course_id` (`course_id`),
  CONSTRAINT `fkmm_test_course_assignment__abstract_test` FOREIGN KEY (`abstract_test_id`) REFERENCES `abstract_test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_instance`
--

DROP TABLE IF EXISTS `test_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `started` datetime DEFAULT NULL,
  `finished` datetime DEFAULT NULL,
  `attempt_number` int(11) DEFAULT NULL,
  `test_id` bigint(20) DEFAULT NULL,
  `current_question_id` bigint(20) DEFAULT NULL,
  `registration_entry_id` bigint(20) DEFAULT NULL,
  `test_result_id` bigint(20) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_current_question_id` (`current_question_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_registration_entry_id` (`registration_entry_id`),
  KEY `ix_test_id` (`test_id`),
  KEY `ix_test_result_id` (`test_result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7297637 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_question_categories`
--

DROP TABLE IF EXISTS `test_question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_question_categories` (
  `test_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `question_count` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_result`
--

DROP TABLE IF EXISTS `test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `test_instance_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_test_instance_id` (`test_instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7020005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `skin` varchar(255) DEFAULT NULL,
  `color_scheme` varchar(255) DEFAULT NULL,
  `icon_set` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4619 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `old_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_country`
--

DROP TABLE IF EXISTS `tm_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(8) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_ix_value` (`value`),
  KEY `tm_ix_description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_settings`
--

DROP TABLE IF EXISTS `tm_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_settings` (
  `domain_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `talent_host` varchar(255) DEFAULT NULL,
  `sso_key` varchar(50) DEFAULT NULL,
  `client_cd` varchar(10) DEFAULT NULL,
  `super_username` varchar(255) DEFAULT NULL,
  `super_pw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_state`
--

DROP TABLE IF EXISTS `tm_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(8) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_ix_value` (`value`),
  KEY `tm_ix_description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_auditids`
--

DROP TABLE IF EXISTS `tmp_auditids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_auditids` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_store_batch`
--

DROP TABLE IF EXISTS `tmp_store_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_store_batch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_number` varchar(255) NOT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `parent_store_number` varchar(255) DEFAULT NULL,
  `territory` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `vision` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `mapping` varchar(255) DEFAULT NULL,
  `load_date` varchar(64) DEFAULT NULL,
  `error_msg` text,
  `error_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `dm_ix_error_flag` (`error_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1572612 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_store_batch_log`
--

DROP TABLE IF EXISTS `tmp_store_batch_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_store_batch_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` datetime DEFAULT NULL,
  `mapping` varchar(512) DEFAULT NULL,
  `action` varchar(512) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_account`
--

DROP TABLE IF EXISTS `training_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `version` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `show_balance_at_checkout` tinyint(1) DEFAULT '0',
  `expiration_date` datetime DEFAULT NULL,
  `max_limit_per_use` decimal(10,2) DEFAULT NULL,
  `access_limit_count` int(10) DEFAULT NULL,
  `created_by_user_id` bigint(20) DEFAULT NULL,
  `current_balance` decimal(10,2) DEFAULT '0.00',
  `starting_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `email_processed` tinyint(1) DEFAULT '0',
  `notification_days_before_expiration_date` int(10) DEFAULT NULL,
  `notification_balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_account_audience`
--

DROP TABLE IF EXISTS `training_account_audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_account_audience` (
  `training_account_id` int(10) NOT NULL,
  `fk_audience_id` bigint(20) NOT NULL,
  KEY `ix_training_account_id1` (`training_account_id`),
  KEY `ix_audience_id` (`fk_audience_id`),
  CONSTRAINT `fk1_audience_id` FOREIGN KEY (`fk_audience_id`) REFERENCES `filter_set` (`id`),
  CONSTRAINT `fk1_training_account_id` FOREIGN KEY (`training_account_id`) REFERENCES `training_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_account_cacs`
--

DROP TABLE IF EXISTS `training_account_cacs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_account_cacs` (
  `training_account_id` int(10) NOT NULL,
  `fk_cac_id` bigint(20) NOT NULL,
  KEY `ix_training_account_id3` (`training_account_id`),
  KEY `ix_fk_cac_id` (`fk_cac_id`),
  CONSTRAINT `fk3_fk_cac_id` FOREIGN KEY (`fk_cac_id`) REFERENCES `catalog_access_code` (`id`),
  CONSTRAINT `fk3_training_account_id` FOREIGN KEY (`training_account_id`) REFERENCES `training_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_account_owners`
--

DROP TABLE IF EXISTS `training_account_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_account_owners` (
  `training_account_id` int(10) NOT NULL,
  `fk_lms_user_id` bigint(20) NOT NULL,
  KEY `ix_training_account_id2` (`training_account_id`),
  KEY `fk_fk_lms_user_id` (`fk_lms_user_id`),
  CONSTRAINT `fk2_lms_user_id` FOREIGN KEY (`fk_lms_user_id`) REFERENCES `lms_user` (`id`),
  CONSTRAINT `fk2_training_account_id` FOREIGN KEY (`training_account_id`) REFERENCES `training_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_account_transaction`
--

DROP TABLE IF EXISTS `training_account_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_account_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `version` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `fk_training_account_id` int(10) NOT NULL,
  `fk_learning_object_id` bigint(20) DEFAULT NULL,
  `learning_assignment_id` bigint(20) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT '0.00',
  `credit` decimal(10,2) DEFAULT '0.00',
  `fk_lms_user_id` bigint(20) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `dm_ix_fk_account_id` (`fk_training_account_id`),
  KEY `dm_ix_fk_lms_user_id` (`fk_lms_user_id`),
  KEY `dm_ix_fk_learning_object_id` (`fk_learning_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_certification_request`
--

DROP TABLE IF EXISTS `training_certification_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_certification_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `request_id` bigint(20) DEFAULT NULL,
  `training_costs_required` tinyint(1) DEFAULT NULL,
  `training_hours_required` tinyint(1) DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `date_certified` datetime DEFAULT NULL,
  `certifier_id` bigint(20) DEFAULT NULL,
  `estimated_direct_tuition` decimal(19,2) DEFAULT NULL,
  `estimated_direct_books_materials` decimal(19,2) DEFAULT NULL,
  `estimated_direct_other` decimal(19,2) DEFAULT NULL,
  `estimated_indirect_travel` decimal(19,2) DEFAULT NULL,
  `estimated_indirect_per_diem` decimal(19,2) DEFAULT NULL,
  `estimated_indirect_other` decimal(19,2) DEFAULT NULL,
  `actual_direct_tuition` decimal(19,2) DEFAULT NULL,
  `actual_direct_books_materials` decimal(19,2) DEFAULT NULL,
  `actual_direct_other` decimal(19,2) DEFAULT NULL,
  `actual_indirect_travel` decimal(19,2) DEFAULT NULL,
  `actual_indirect_per_diem` decimal(19,2) DEFAULT NULL,
  `actual_indirect_other` decimal(19,2) DEFAULT NULL,
  `actual_hours_during_duty` decimal(19,5) DEFAULT NULL,
  `actual_hours_during_nonduty` decimal(19,5) DEFAULT NULL,
  `estimated_hours_during_duty` decimal(19,5) DEFAULT NULL,
  `estimated_hours_during_nonduty` decimal(19,5) DEFAULT NULL,
  `review_comments` varchar(255) DEFAULT NULL,
  `comments_viewable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_request_id` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000036422 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_attribute_params`
--

DROP TABLE IF EXISTS `user_attribute_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_attribute_params` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `use_in_user_profile` tinyint(4) DEFAULT NULL,
  `use_in_account_request` tinyint(4) DEFAULT NULL,
  `attribute_name` varchar(512) DEFAULT NULL,
  `custom_user_attribute_def_id` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `user_readonly` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_custom_user_attribute_def_id` (`custom_user_attribute_def_id`),
  KEY `ix_attribute_name` (`attribute_name`(255))
) ENGINE=InnoDB AUTO_INCREMENT=27411 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_linked_document`
--

DROP TABLE IF EXISTS `user_linked_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_linked_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `resource_type` varchar(10) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `fk_user_id` bigint(20) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11869 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_list`
--

DROP TABLE IF EXISTS `user_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2388 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_list_user`
--

DROP TABLE IF EXISTS `user_list_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_list_user` (
  `user_list_id` bigint(20) NOT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  KEY `ix_user_list_id` (`user_list_id`),
  CONSTRAINT `fkmm_user_list_user__user_list` FOREIGN KEY (`user_list_id`) REFERENCES `user_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_privacy_data`
--

DROP TABLE IF EXISTS `user_privacy_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_privacy_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `social_security_number` varchar(255) DEFAULT NULL,
  `birth_date` varchar(255) DEFAULT NULL,
  `lms_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_lms_user_id` (`lms_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22506847917 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_to_filterset_mapper`
--

DROP TABLE IF EXISTS `user_to_filterset_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_to_filterset_mapper` (
  `filter_set_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `direct_audience` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `ix_user_filterset_domain_direct_audience_id` (`user_id`,`filter_set_id`,`domain_id`,`direct_audience`),
  KEY `ix_filter_set_id` (`filter_set_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_direct_audience` (`direct_audience`),
  KEY `ix_user_id` (`user_id`),
  CONSTRAINT `fk_user_to_filter_to_filter_set` FOREIGN KEY (`filter_set_id`) REFERENCES `filter_set` (`id`),
  CONSTRAINT `fk_user_to_filter_to_user` FOREIGN KEY (`user_id`) REFERENCES `lms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_to_filterset_mapper_chunk`
--

DROP TABLE IF EXISTS `user_to_filterset_mapper_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_to_filterset_mapper_chunk` (
  `filter_set_id` bigint(20) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  KEY `ix_filter_set_id` (`filter_set_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_to_filterset_mapper_request`
--

DROP TABLE IF EXISTS `user_to_filterset_mapper_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_to_filterset_mapper_request` (
  `filter_set_id` bigint(20) NOT NULL,
  `domain_id` bigint(20) NOT NULL,
  `job_id` char(42) DEFAULT NULL,
  KEY `ix_filter_set_id_job_id` (`filter_set_id`,`job_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_to_filterset_mapper_wip`
--

DROP TABLE IF EXISTS `user_to_filterset_mapper_wip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_to_filterset_mapper_wip` (
  `filter_set_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) NOT NULL,
  PRIMARY KEY (`filter_set_id`,`domain_id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` varchar(255) NOT NULL,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_first_name` varchar(255) DEFAULT NULL,
  `contact_last_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `display_url` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `postal_code` varchar(25) DEFAULT NULL,
  `postal_code_type` varchar(25) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `external_guid` varchar(255) DEFAULT NULL,
  `dm_vendor_code` varchar(255) DEFAULT NULL,
  `allowed_licenses` int(11) DEFAULT NULL,
  `anniversary_date` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_name` (`domain_id`,`name`),
  KEY `dm_ix_vendor_code` (`dm_vendor_code`)
) ENGINE=InnoDB AUTO_INCREMENT=22505023347 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waitlist_entry`
--

DROP TABLE IF EXISTS `waitlist_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waitlist_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `enrollment_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `is_class_required` tinyint(4) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webex_attendee`
--

DROP TABLE IF EXISTS `webex_attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webex_attendee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `lms_user_id` bigint(20) DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL,
  `webex_id` varchar(64) DEFAULT NULL,
  `register_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_domain_id_lms_user_id_webex_id` (`lms_user_id`,`webex_id`),
  KEY `ix_session_id` (`session_id`),
  CONSTRAINT `fk1m_webex_attendee__session` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148388 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webex_cohost`
--

DROP TABLE IF EXISTS `webex_cohost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webex_cohost` (
  `host_id` bigint(20) NOT NULL,
  `assigned_host_id` bigint(20) NOT NULL,
  KEY `ix_host_id` (`host_id`),
  CONSTRAINT `fkmm_webex_cohost__webex_host` FOREIGN KEY (`host_id`) REFERENCES `webex_host` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webex_host`
--

DROP TABLE IF EXISTS `webex_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webex_host` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `webexusername` varchar(255) DEFAULT NULL,
  `webexpassword` varchar(255) DEFAULT NULL,
  `webexid` bigint(20) DEFAULT NULL,
  `lms_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_domain_id_name` (`domain_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=978 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webex_recording`
--

DROP TABLE IF EXISTS `webex_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webex_recording` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `parent_course_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `recording_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_course_id` (`course_id`),
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_parent_course_id` (`parent_course_id`),
  CONSTRAINT `fk1m_webex_recording__course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2559 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webex_session_cohost`
--

DROP TABLE IF EXISTS `webex_session_cohost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webex_session_cohost` (
  `session_id` bigint(20) NOT NULL,
  `host_id` bigint(20) NOT NULL,
  KEY `ix_session_id` (`session_id`),
  CONSTRAINT `fkmm_webex_session_cohost__session` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webex_settings`
--

DROP TABLE IF EXISTS `webex_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webex_settings` (
  `domain_id` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `webex_domain_name` varchar(50) DEFAULT NULL,
  `max_host` smallint(6) NOT NULL DEFAULT '0',
  `partner_id` varchar(25) DEFAULT NULL,
  `site_id` varchar(25) DEFAULT NULL,
  `super_username` varchar(50) DEFAULT NULL,
  `super_password` varchar(100) DEFAULT NULL,
  `attendance_service_lastrun` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subclass` tinyint(4) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `height` smallint(5) unsigned DEFAULT '0',
  `content` text,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  `can_set_height` bit(1) DEFAULT b'1',
  `open_site` tinyint(1) DEFAULT '0',
  `first_plan_open` tinyint(1) DEFAULT '1',
  `group_by_plan` tinyint(1) DEFAULT '0',
  `show_lp` tinyint(1) DEFAULT '0',
  `show_required` tinyint(1) DEFAULT '0',
  `show_electives` tinyint(1) DEFAULT '0',
  `show_desc` tinyint(1) DEFAULT '0',
  `show_duration` tinyint(1) DEFAULT '0',
  `item_order` tinyint(4) DEFAULT NULL,
  `show_prog` tinyint(1) DEFAULT '1',
  `show_duedate` tinyint(1) DEFAULT '0',
  `show_if_required` tinyint(1) DEFAULT '0',
  `max_rows_output` smallint(2) DEFAULT NULL,
  `completed_plans` tinyint(1) DEFAULT '0',
  `show_sub_exp_date` tinyint(1) DEFAULT '0',
  `cat_show_courses` tinyint(1) DEFAULT '0',
  `cat_show_ilt` tinyint(1) DEFAULT '0',
  `cat_show_bundles` tinyint(1) DEFAULT '0',
  `cat_show_olr` tinyint(1) DEFAULT '0',
  `cat_show_searchbox` tinyint(1) DEFAULT '0',
  `cat_order_by` tinyint(4) DEFAULT NULL,
  `cat_show_start` tinyint(1) DEFAULT '0',
  `cat_show_feature` tinyint(1) DEFAULT '0',
  `cat_show_lastmod` tinyint(1) DEFAULT '0',
  `order_direction` tinyint(4) NOT NULL DEFAULT '0',
  `ajax` tinyint(1) NOT NULL DEFAULT '0',
  `show_ceus` tinyint(4) DEFAULT '0',
  `show_comp_req` tinyint(4) DEFAULT '0',
  `default_translation_id` int(10) unsigned DEFAULT NULL,
  `completed_courses` tinyint(1) DEFAULT '0',
  `show_atype` tinyint(1) NOT NULL DEFAULT '0',
  `show_areason` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41867 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_column`
--

DROP TABLE IF EXISTS `widget_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `domain_id` bigint(20) unsigned NOT NULL,
  `width` smallint(6) DEFAULT NULL,
  `column_width_unit` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12097 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_column_widgets`
--

DROP TABLE IF EXISTS `widget_column_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_column_widgets` (
  `fk_widget_column_id` int(10) unsigned NOT NULL,
  `fk_widget_id` bigint(20) unsigned NOT NULL,
  `order_num` tinyint(3) unsigned NOT NULL,
  KEY `ix_fk_widget_column_id` (`fk_widget_column_id`),
  KEY `ix_fk_widget_id` (`fk_widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_page`
--

DROP TABLE IF EXISTS `widget_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `code` varchar(190) DEFAULT NULL,
  `fk_filter_set_id` bigint(20) DEFAULT NULL,
  `fk_widget_id` bigint(20) DEFAULT NULL,
  `subclass` varchar(6) NOT NULL DEFAULT 'auto',
  `column_assignment_type` tinyint(4) NOT NULL DEFAULT '0',
  `open_site` tinyint(1) DEFAULT '0',
  `default_translation_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_code` (`code`),
  KEY `ix_domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_page_columns`
--

DROP TABLE IF EXISTS `widget_page_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_page_columns` (
  `fk_widget_page_id` bigint(20) unsigned NOT NULL,
  `fk_widget_column_id` int(10) unsigned NOT NULL,
  `order_num` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_page_translation`
--

DROP TABLE IF EXISTS `widget_page_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_page_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fk_widget_page_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_fk_widget_page_id` (`fk_widget_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8767 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_translation`
--

DROP TABLE IF EXISTS `widget_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` text,
  `fk_widget_id` bigint(20) DEFAULT NULL,
  `system_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ix_domain_id` (`domain_id`),
  KEY `ix_fk_widget_id` (`fk_widget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35547 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workflow_step_edit_awe_field`
--

DROP TABLE IF EXISTS `workflow_step_edit_awe_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_step_edit_awe_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` mediumint(8) unsigned NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `approval_workflow_step_id` bigint(20) DEFAULT NULL,
  `awe_definition_id` bigint(20) DEFAULT NULL,
  `permission_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_awe_definition_id_edit` (`awe_definition_id`),
  KEY `ix_approval_workflow_step_id_awe_edit` (`approval_workflow_step_id`),
  KEY `ix_domain_id` (`domain_id`),
  CONSTRAINT `fk1m_approval_workflow_step_awe_edit` FOREIGN KEY (`approval_workflow_step_id`) REFERENCES `approval_workflow_step` (`id`),
  CONSTRAINT `fk1m_awe_definition_edit` FOREIGN KEY (`awe_definition_id`) REFERENCES `custom_attribute_def` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228814 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-24 13:55:16
