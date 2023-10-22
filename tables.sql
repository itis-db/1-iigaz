
create table if not exists activitytype
(
    activitytypeid integer not null
                           constraint pk_activitytype
                                      primary key,
    name           text    not null,
    sysname        text    not null
);

-- 

create table if not exists activity
(
    activityid     integer not null
                           constraint pk_activity
                                      primary key,
    activitytypeid integer not null
                           constraint fk_activitytype
                                      references activitytype (activitytypeid),
    code           text    not null,
    name           text    not null,
    parentid       integer constraint fk_parent
                                      references activity (activityid)
);

create table if not exists area
(
    areaid integer not null
                   constraint pk_area
                              primary key,
    name   text    not null
);

create table if not exists contract
(
    contractid integer not null
                       constraint pk_contract
                                  primary key
                       constraint fk_contract_activity
                                  references activity (activityid),
    areaid     integer
                       constraint fk_area
                                  references area (areaid)
);

create table if not exists point
(
    pointid  integer not null
                     constraint pk_point
                                primary key
                     constraint fk_point_activity
                                references activity (activityid),
    plandate date not null,
    factdate date
);

create table if not exists program
(
    programid  integer not null
                       constraint pk_program
                                  primary key
                       constraint fk_program_activity
                                  references activity (activityid),
    indexnum   integer,
    yearstart  integer,
    yearfinish integer
);

create table if not exists project
(
    projectid   integer      not null
                             constraint pk_project
                                        primary key
                             constraint fk_project_activity
                                        references activity (activityid),
    targetdescr text
);

create table if not exists subprogram
(
    subprogramid integer not null
                         constraint pk_subprogram
                                    primary key
                         constraint fk_subprogram_activity
                                    references activity (activityid),
    indexnum     integer
);
