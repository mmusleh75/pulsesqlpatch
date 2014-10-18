delimiter $$

drop procedure if exists `sp_dba_add_nav_element`$$

create procedure `sp_dba_add_nav_element`(
  in _mockup_id varchar(255)           -- mockup_id of the inserted element
  , in _parent_mockup_id varchar(255)  -- parent mockup_id
  , in _label varchar(255)
  , in _description varchar(255)
  , in _long_description varchar(1024) -- defaults to _description
  , in _page varchar(1024)
  , in _iconid varchar(255)
  , in _body varchar(255)
  , in _target varchar(255)
  )

begin
  set @timestamp = utc_timestamp();

  insert into navigation_element
      (version, created, modified, status, domain_id, mockup_id, label,
       description, long_description, page, iconid, body, target, subclass, parent_id, default_selection,
       order_id, archivable)
    select
        0 as version, @timestamp as created, @timestamp as modified, 'Active' as status, pn.domain_id as domain_id,
        _mockup_id as mockup_id, _label as label,
        _description as description, ifnull(_long_description, _description) as long_description,
        _page as page, _iconid as iconid, _body as body, _target as target,
        'Geolearning.Entity.GeoNavigationElement' as subclass,
        pn.id as parent_id,
        0 as default_selection,
        max(cn.order_id) + 1 as order_id,
        1 as archivable
      from navigation_element pn
      left outer join navigation_element cn on cn.parent_id = pn.id
      where
        pn.mockup_id = _parent_mockup_id
      group by pn.id;
end$$

delimiter ;
