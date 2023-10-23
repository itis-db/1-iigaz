create function hierarchy(pn_activityid int)
returns table (level int, name text)
as
$$
select row_number() over () as level, t.name from
(
    with recursive get_hierarchy as
    (
        select 1 as level, activityid, activitytypeid, name,
               case when contract.contractid is not null
                         then (select name from area where areaid = contract.areaid)
                    else null
                    end as area_name,
               0 as area_level
               from activity
               left join contract
                    on activity.activityid = contract.contractid
               where activity.activityid = coalesce(pn_activityid, 1)
        union all
        select get_hierarchy.level + 1 as level,
               activity.activityid,
               activity.activitytypeid,
               activity.name,
               case when contract.contractid is not null
                         then (select name from area where areaid = contract.areaid)
                    else get_hierarchy.area_name
                    end,
               case when activity.activitytypeid = 3
                         then level
                    else get_hierarchy.area_level
                    end
               from activity
               join get_hierarchy
                    on activity.parentid = get_hierarchy.activityid
               left join contract
                    on activity.activityid = contract.contractid
    )
    select name, level, activitytypeid as priority from get_hierarchy
    union
    select area_name as name, area_level as level, 0 as priority from get_hierarchy where activitytypeid = 4
    order by level, priority desc
) as t
$$
language sql;

select * from hierarchy(null);
