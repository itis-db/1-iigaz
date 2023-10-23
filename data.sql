insert into activitytype (activitytypeid, name, sysname)
select d.*
from (values (1,'Программа','Program'),
             (2,'Подпрограмма','SubProgram'),
             (3,'Проект','Project'),
             (4,'Контракт','Contract'),
             (5,'КТ','Point'))
     d(activitytypeid, name, sysname)
where not exists (
    select 1 from activitytype t
    where t.activitytypeid = d.activitytypeid
);

insert into activity (activityid, activitytypeid, code, name, parentid)
select d.*
from (values (1, 1, '#prog1', 'Программа', null),
             (2, 2, '#subprog1', 'Подпрограмма', 1),
             (3, 3, '#proj1', 'Проект', 2),
             (4, 4, '#cont1', 'Контракт', 3),
             (5, 5, '#point1', 'КТ (Проекта)', 3),
             (6, 5, '#point2', 'КТ (Контракта)', 4))
     d(activityid, code, name, parentid)
where not exists(
    select 1 from activity t
    where t.activityid = d.activityid
);

insert into area (areaid, name)
select d.*
from (values (1, 'Территория'))
     d(areaid, name)
where not exists(
    select 1 from area t
    where t.areaid = d.areaid
);

insert into contract (contractid, areaid)
select d.*
from (values (4, 1))
     d(contractid, areaid)
where not exists(
    select 1 from contract t
    where t.contractid = d.contractid
);

insert into point (pointid, plandate, factdate)
select d.*
from (values (5, to_date('2012-12-21', 'YYYY-MM-DD'), to_date('2020-01-01', 'YYYY-MM-DD')),
             (6, to_date('2023-10-24', 'YYYY-MM-DD'), null))
     d(pointid, plandate, factdate)
where not exists(
    select 1 from point t
    where t.pointid = d.pointid
);

insert into program (programid, indexnum, yearstart, yearfinish)
select d.*
from (values (1, 1, 2012, 2024))
     d(programid, indexnum, yearstart, yearfinish)
where not exists(
    select 1 from program t
    where t.programid = d.programid
);

insert into subprogram (subprogramid, indexnum)
select d.*
from (values (2, 2))
     d(subprogramid, indexnum)
where not exists(
    select 1 from subprogram t
    where t.subprogramid = d.subprogramid
);

insert into project (projectid, targetdescr)
select d.*
from (values (3, 'Описание'))
     d(projectid, targetdescr)
where not exists(
    select 1 from project t
    where t.projectid = d.projectid
);
