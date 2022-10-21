--create a database called callcenter  (case is important in postgress) then run this query


create schema dbo;

create table dbo.agents
(
    id       int not null unique primary key,
    firstname   varchar(50),
    lastname    varchar(50),
    extensionid int,
    startdate   date,
    enddate     date
);

create table dbo.communicationlog
(
    id   int not null unique primary key,
    communicationtypeid int not null,
    leadid              int not null,
    agentid             int not null,
    startedat           timestamp,
    endedat             timestamp
);

create table dbo.communicationtype
(
    id    int not null unique primary key,
    name varchar(50)
);


create table dbo.extensions
(
    id   int not null unique primary key,
    ext char(5)
);

create table dbo.leads
(
    id   int not null unique primary key,
    firstname   varchar(50) not null,
    lastname    varchar(50) not null,
    mobile      varchar(15) not null,
    email       varchar(125) not null,
    homephone   varchar(15) not null,
    convertedat timestamp,
    removedat   timestamp,
    agentid     int
);


alter table dbo.agents
    add constraint agents_ext_fk
        foreign key (extensionid) references dbo.extensions
            on update restrict on delete restrict;

alter table dbo.communicationlog
    add constraint communicationlog_leads_id_fk
        foreign key (leadid) references dbo.leads
            on update restrict on delete restrict;

alter table dbo.communicationlog
    add constraint communicationlog_agents_id_fk
        foreign key (agentid) references dbo.agents
            on update restrict on delete restrict;

alter table dbo.communicationlog
    add constraint communicationlog_communicationtype_id_fk
        foreign key (communicationtypeid) references dbo.communicationtype (id)
            on update restrict on delete restrict;


alter table dbo.leads
    add constraint leads_agents_id_fk
        foreign key (agentid) references dbo.agents
            on update restrict on delete restrict;



INSERT into dbo.CommunicationType (Id, Name) VALUES (1, N'MobileCall'),
                                                    (2, N'MobileSms'),
                                                    (3, N'Email'),
                                                    (4, N'HomePhone');


INSERT into dbo.Extensions (Id, Ext) VALUES (1, N'00000');
INSERT into dbo.Extensions (Id, Ext) VALUES (2, N'00001');
INSERT into dbo.Extensions (Id, Ext) VALUES (3, N'00002');
INSERT into dbo.Extensions (Id, Ext) VALUES (4, N'00003');
INSERT into dbo.Extensions (Id, Ext) VALUES (5, N'00004');
INSERT into dbo.Extensions (Id, Ext) VALUES (6, N'00005');
INSERT into dbo.Extensions (Id, Ext) VALUES (7, N'00006');
INSERT into dbo.Extensions (Id, Ext) VALUES (8, N'00007');
INSERT into dbo.Extensions (Id, Ext) VALUES (9, N'00008');
INSERT into dbo.Extensions (Id, Ext) VALUES (10, N'00009');
INSERT into dbo.Extensions (Id, Ext) VALUES (11, N'00010');
INSERT into dbo.Extensions (Id, Ext) VALUES (12, N'00011');
INSERT into dbo.Extensions (Id, Ext) VALUES (13, N'00012');
INSERT into dbo.Extensions (Id, Ext) VALUES (14, N'00013');
INSERT into dbo.Extensions (Id, Ext) VALUES (15, N'00014');
INSERT into dbo.Extensions (Id, Ext) VALUES (16, N'00015');
INSERT into dbo.Extensions (Id, Ext) VALUES (17, N'00016');
INSERT into dbo.Extensions (Id, Ext) VALUES (18, N'00017');
INSERT into dbo.Extensions (Id, Ext) VALUES (19, N'00018');
INSERT into dbo.Extensions (Id, Ext) VALUES (20, N'00019');
INSERT into dbo.Extensions (Id, Ext) VALUES (21, N'00020');
INSERT into dbo.Extensions (Id, Ext) VALUES (22, N'00021');
INSERT into dbo.Extensions (Id, Ext) VALUES (23, N'00022');
INSERT into dbo.Extensions (Id, Ext) VALUES (24, N'00023');
INSERT into dbo.Extensions (Id, Ext) VALUES (25, N'00024');
INSERT into dbo.Extensions (Id, Ext) VALUES (26, N'00025');
INSERT into dbo.Extensions (Id, Ext) VALUES (27, N'00026');
INSERT into dbo.Extensions (Id, Ext) VALUES (28, N'00027');
INSERT into dbo.Extensions (Id, Ext) VALUES (29, N'00028');
INSERT into dbo.Extensions (Id, Ext) VALUES (30, N'00029');
INSERT into dbo.Extensions (Id, Ext) VALUES (31, N'00030');
INSERT into dbo.Extensions (Id, Ext) VALUES (32, N'00031');
INSERT into dbo.Extensions (Id, Ext) VALUES (33, N'00032');
INSERT into dbo.Extensions (Id, Ext) VALUES (34, N'00033');
INSERT into dbo.Extensions (Id, Ext) VALUES (35, N'00034');
INSERT into dbo.Extensions (Id, Ext) VALUES (36, N'00035');
INSERT into dbo.Extensions (Id, Ext) VALUES (37, N'00036');
INSERT into dbo.Extensions (Id, Ext) VALUES (38, N'00037');
INSERT into dbo.Extensions (Id, Ext) VALUES (39, N'00038');
INSERT into dbo.Extensions (Id, Ext) VALUES (40, N'00039');
INSERT into dbo.Extensions (Id, Ext) VALUES (41, N'00040');
INSERT into dbo.Extensions (Id, Ext) VALUES (42, N'00041');
INSERT into dbo.Extensions (Id, Ext) VALUES (43, N'00042');
INSERT into dbo.Extensions (Id, Ext) VALUES (44, N'00043');
INSERT into dbo.Extensions (Id, Ext) VALUES (45, N'00044');
INSERT into dbo.Extensions (Id, Ext) VALUES (46, N'00045');
INSERT into dbo.Extensions (Id, Ext) VALUES (47, N'00046');
INSERT into dbo.Extensions (Id, Ext) VALUES (48, N'00047');
INSERT into dbo.Extensions (Id, Ext) VALUES (49, N'00048');
INSERT into dbo.Extensions (Id, Ext) VALUES (50, N'00049');
INSERT into dbo.Extensions (Id, Ext) VALUES (51, N'00050');
INSERT into dbo.Extensions (Id, Ext) VALUES (52, N'00051');
INSERT into dbo.Extensions (Id, Ext) VALUES (53, N'00052');
INSERT into dbo.Extensions (Id, Ext) VALUES (54, N'00053');
INSERT into dbo.Extensions (Id, Ext) VALUES (55, N'00054');
INSERT into dbo.Extensions (Id, Ext) VALUES (56, N'00055');
INSERT into dbo.Extensions (Id, Ext) VALUES (57, N'00056');
INSERT into dbo.Extensions (Id, Ext) VALUES (58, N'00057');
INSERT into dbo.Extensions (Id, Ext) VALUES (59, N'00058');
INSERT into dbo.Extensions (Id, Ext) VALUES (60, N'00059');
INSERT into dbo.Extensions (Id, Ext) VALUES (61, N'00060');
INSERT into dbo.Extensions (Id, Ext) VALUES (62, N'00061');
INSERT into dbo.Extensions (Id, Ext) VALUES (63, N'00062');
INSERT into dbo.Extensions (Id, Ext) VALUES (64, N'00063');
INSERT into dbo.Extensions (Id, Ext) VALUES (65, N'00064');
INSERT into dbo.Extensions (Id, Ext) VALUES (66, N'00065');
INSERT into dbo.Extensions (Id, Ext) VALUES (67, N'00066');
INSERT into dbo.Extensions (Id, Ext) VALUES (68, N'00067');
INSERT into dbo.Extensions (Id, Ext) VALUES (69, N'00068');
INSERT into dbo.Extensions (Id, Ext) VALUES (70, N'00069');
INSERT into dbo.Extensions (Id, Ext) VALUES (71, N'00070');
INSERT into dbo.Extensions (Id, Ext) VALUES (72, N'00071');
INSERT into dbo.Extensions (Id, Ext) VALUES (73, N'00072');
INSERT into dbo.Extensions (Id, Ext) VALUES (74, N'00073');
INSERT into dbo.Extensions (Id, Ext) VALUES (75, N'00074');
INSERT into dbo.Extensions (Id, Ext) VALUES (76, N'00075');
INSERT into dbo.Extensions (Id, Ext) VALUES (77, N'00076');
INSERT into dbo.Extensions (Id, Ext) VALUES (78, N'00077');
INSERT into dbo.Extensions (Id, Ext) VALUES (79, N'00078');
INSERT into dbo.Extensions (Id, Ext) VALUES (80, N'00079');
INSERT into dbo.Extensions (Id, Ext) VALUES (81, N'00080');
INSERT into dbo.Extensions (Id, Ext) VALUES (82, N'00081');
INSERT into dbo.Extensions (Id, Ext) VALUES (83, N'00082');
INSERT into dbo.Extensions (Id, Ext) VALUES (84, N'00083');
INSERT into dbo.Extensions (Id, Ext) VALUES (85, N'00084');
INSERT into dbo.Extensions (Id, Ext) VALUES (86, N'00085');
INSERT into dbo.Extensions (Id, Ext) VALUES (87, N'00086');
INSERT into dbo.Extensions (Id, Ext) VALUES (88, N'00087');
INSERT into dbo.Extensions (Id, Ext) VALUES (89, N'00088');
INSERT into dbo.Extensions (Id, Ext) VALUES (90, N'00089');
INSERT into dbo.Extensions (Id, Ext) VALUES (91, N'00090');
INSERT into dbo.Extensions (Id, Ext) VALUES (92, N'00091');
INSERT into dbo.Extensions (Id, Ext) VALUES (93, N'00092');
INSERT into dbo.Extensions (Id, Ext) VALUES (94, N'00093');
INSERT into dbo.Extensions (Id, Ext) VALUES (95, N'00094');
INSERT into dbo.Extensions (Id, Ext) VALUES (96, N'00095');
INSERT into dbo.Extensions (Id, Ext) VALUES (97, N'00096');
INSERT into dbo.Extensions (Id, Ext) VALUES (98, N'00097');
INSERT into dbo.Extensions (Id, Ext) VALUES (99, N'00098');
INSERT into dbo.Extensions (Id, Ext) VALUES (100, N'00099');


insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15283, N'Arthur', N'Smith', 38, CAST(N'2020-02-17' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15284, N'Simone', N'Reyes', 31, CAST(N'2016-02-09' AS Date), CAST(N'2020-06-28' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15285, N'Vina', N'Holmes', 14, CAST(N'2014-12-22' AS Date), CAST(N'2019-08-11' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15286, N'Reynold', N'Austin', 36, CAST(N'2016-06-13' AS Date), CAST(N'2022-03-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15287, N'Ruth', N'Jennings', 30, CAST(N'2017-07-16' AS Date), CAST(N'2018-07-05' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15288, N'Ty', N'Paul', 13, CAST(N'2014-11-30' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15289, N'Barbra', N'Sparks', 17, CAST(N'2021-10-06' AS Date), CAST(N'2022-01-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15290, N'Monique', N'Davenport', 41, CAST(N'2016-11-08' AS Date), CAST(N'2022-01-07' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15291, N'Eulah', N'Wiggins', 49, CAST(N'2017-10-14' AS Date), CAST(N'2020-03-11' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15292, N'Theresa', N'Whitehead', 44, CAST(N'2017-03-14' AS Date), CAST(N'2021-04-20' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15293, N'Malcolm', N'Walls', 58, CAST(N'2018-02-16' AS Date), CAST(N'2021-07-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15294, N'Charmaine', N'Mccarty', 4, CAST(N'2016-10-29' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15295, N'Ben', N'Mcneil', 15, CAST(N'2015-01-25' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15296, N'Marcellus', N'Barlow', 61, CAST(N'2019-04-13' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15297, N'Gerard', N'Hyde', 53, CAST(N'2018-01-01' AS Date), CAST(N'2019-10-07' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15298, N'Jerome', N'Sorensen', 6, CAST(N'2014-04-06' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15299, N'Vernie', N'Simons', 21, CAST(N'2019-03-29' AS Date), CAST(N'2021-01-13' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15300, N'Christy', N'Zapata', 10, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-25' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15301, N'Sandra', N'Rosen', 42, CAST(N'2016-11-23' AS Date), CAST(N'2019-12-12' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15302, N'Ambrose', N'Sheridan', 51, CAST(N'2018-10-21' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15303, N'Nanette', N'Stanford', 26, CAST(N'2015-12-26' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15304, N'Everett', N'Barnard', 10, CAST(N'2022-03-10' AS Date), CAST(N'2022-04-26' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15305, N'Jerrold', N'Spangler', 10, CAST(N'2014-08-02' AS Date), CAST(N'2021-11-08' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15306, N'Essie', N'Bledsoe', 19, CAST(N'2021-07-18' AS Date), CAST(N'2022-06-27' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15307, N'Dale', N'Moreland', 33, CAST(N'2020-08-15' AS Date), CAST(N'2022-02-11' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15308, N'Archibald', N'Comer', 34, CAST(N'2021-08-19' AS Date), CAST(N'2021-09-02' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15309, N'Edsel', N'Amador', 12, CAST(N'2020-01-14' AS Date), CAST(N'2022-05-24' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15310, N'Essence', N'Busby', 54, CAST(N'2018-01-21' AS Date), CAST(N'2022-01-30' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15311, N'Layne', N'Oliva', 14, CAST(N'2019-09-02' AS Date), CAST(N'2022-06-30' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15312, N'Olga', N'Alley', 20, CAST(N'2018-12-11' AS Date), CAST(N'2020-04-15' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15313, N'Ernestine', N'Crespo', 60, CAST(N'2018-06-06' AS Date), CAST(N'2019-01-01' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15314, N'Tyshawn', N'Callaway', 10, CAST(N'2021-12-02' AS Date), CAST(N'2022-02-28' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15315, N'Lennie', N'Chong', 25, CAST(N'2015-12-15' AS Date), CAST(N'2022-06-20' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15316, N'Rocio', N'Crisp', 39, CAST(N'2016-10-17' AS Date), CAST(N'2017-01-05' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15317, N'Petra', N'Mcarthur', 39, CAST(N'2017-01-09' AS Date), CAST(N'2021-07-07' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15318, N'Anastasia', N'Curley', 48, CAST(N'2017-10-02' AS Date), CAST(N'2022-03-06' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15319, N'Ross', N'Holton', 32, CAST(N'2016-03-22' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15320, N'Sherry', N'Negrete', 43, CAST(N'2017-01-18' AS Date), CAST(N'2021-06-14' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15321, N'Manuel', N'Newsom', 60, CAST(N'2019-01-12' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15322, N'Abraham', N'Keane', 21, CAST(N'2021-07-22' AS Date), CAST(N'2021-11-26' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15323, N'Hayden', N'Lennon', 15, CAST(N'2015-01-25' AS Date), CAST(N'2019-09-15' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15324, N'Gale', N'Betz', 52, CAST(N'2017-11-17' AS Date), CAST(N'2022-04-29' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15325, N'Alexandra', N'Castellano', 34, CAST(N'2019-10-27' AS Date), CAST(N'2020-05-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15326, N'Sandy', N'Chaffin', 46, CAST(N'2017-08-17' AS Date), CAST(N'2021-12-31' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15327, N'Rodger', N'Mangum', 4, CAST(N'2014-01-11' AS Date), CAST(N'2015-04-17' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15328, N'Wallace', N'Hiller', 62, CAST(N'2018-11-27' AS Date), CAST(N'2020-08-28' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15329, N'Alford', N'Gallant', 11, CAST(N'2021-06-13' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15330, N'Shani', N'Merriman', 40, CAST(N'2016-11-03' AS Date), CAST(N'2016-12-14' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15331, N'Delpha', N'Covey', 1, CAST(N'2015-05-12' AS Date), CAST(N'2021-09-13' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15332, N'Gerry', N'Montez', 56, CAST(N'2018-02-05' AS Date), CAST(N'2020-07-24' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15333, N'Jennie', N'Partin', 22, CAST(N'2021-09-03' AS Date), CAST(N'2022-05-25' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15334, N'Neva', N'Fuqua', 30, CAST(N'2018-08-18' AS Date), CAST(N'2021-01-07' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15335, N'Olivia', N'Cornish', 38, CAST(N'2016-10-01' AS Date), CAST(N'2019-07-07' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15336, N'Davin', N'Strunk', 2, CAST(N'2013-12-10' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15337, N'Angelica', N'Lacroix', 11, CAST(N'2020-12-23' AS Date), CAST(N'2021-06-12' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15338, N'Rexford', N'Stegall', 28, CAST(N'2016-01-14' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15339, N'Veda', N'Pogue', 3, CAST(N'2014-01-06' AS Date), CAST(N'2015-02-19' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15340, N'Mack', N'Kuehn', 20, CAST(N'2021-06-30' AS Date), CAST(N'2021-10-30' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15341, N'Junious', N'Martini', 3, CAST(N'2015-02-23' AS Date), CAST(N'2016-06-14' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15342, N'Georgina', N'Bowlin', 34, CAST(N'2016-05-04' AS Date), CAST(N'2019-10-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15343, N'Monica', N'Bare', 18, CAST(N'2015-08-10' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15344, N'Cynthia', N'Hembree', 1, CAST(N'2021-09-13' AS Date), CAST(N'2022-06-25' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15345, N'Jewell', N'Chavira', 20, CAST(N'2015-09-07' AS Date), CAST(N'2018-12-07' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15346, N'Patrice', N'Marques', 9, CAST(N'2015-07-10' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15347, N'Carolina', N'Huss', 24, CAST(N'2015-12-14' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15348, N'Aurora', N'Rawlins', 23, CAST(N'2015-11-16' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15349, N'Noel', N'Hoffer', 21, CAST(N'2022-04-11' AS Date), CAST(N'2022-06-29' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15350, N'Timmy', N'Doerr', 5, CAST(N'2014-03-17' AS Date), CAST(N'2021-03-22' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15351, N'Harold', N'Renaud', 4, CAST(N'2015-06-14' AS Date), CAST(N'2016-10-26' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15352, N'Larry', N'Vanburen', 8, CAST(N'2014-06-27' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15353, N'Olivia', N'Dickman', 34, CAST(N'2021-10-01' AS Date), CAST(N'2022-06-29' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15354, N'Marla', N'Kellum', 12, CAST(N'2014-11-26' AS Date), CAST(N'2019-02-10' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15355, N'Essie', N'Emory', 45, CAST(N'2017-08-09' AS Date), CAST(N'2021-07-25' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15356, N'Edwina', N'Federico', 27, CAST(N'2021-07-26' AS Date), CAST(N'2022-08-11' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15357, N'Forest', N'Voyles', 17, CAST(N'2022-03-14' AS Date), CAST(N'2022-04-20' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15358, N'Carolynn', N'Herd', 29, CAST(N'2016-01-25' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15359, N'Emmet', N'Oquinn', 51, CAST(N'2017-11-14' AS Date), CAST(N'2018-06-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15360, N'Janette', N'Dorsett', 57, CAST(N'2018-02-12' AS Date), CAST(N'2022-02-19' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15361, N'Hardy', N'Keil', 11, CAST(N'2017-03-09' AS Date), CAST(N'2020-03-11' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15362, N'Kaylin', N'Vanbuskirk', 17, CAST(N'2015-07-17' AS Date), CAST(N'2021-10-02' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15363, N'Lydia', N'Victoria', 12, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-25' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15364, N'Eunice', N'Khoury', 21, CAST(N'2015-09-26' AS Date), CAST(N'2019-01-19' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15365, N'Clevie', N'Delia', 61, CAST(N'2018-11-06' AS Date), CAST(N'2018-12-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15366, N'Brady', N'Staub', 19, CAST(N'2015-09-06' AS Date), CAST(N'2020-08-13' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15367, N'Madilyn', N'Resnick', 9, CAST(N'2014-07-04' AS Date), CAST(N'2015-04-28' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15368, N'Magdalena', N'Edmonson', 37, CAST(N'2020-11-16' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15369, N'Josh', N'Fears', 35, CAST(N'2016-06-04' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15370, N'Reuben', N'Crozier', 27, CAST(N'2016-01-07' AS Date), CAST(N'2020-09-04' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15371, N'Lula', N'Reiser', 20, CAST(N'2022-04-03' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15372, N'Mandy', N'Liggett', 5, CAST(N'2021-05-05' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15373, N'Quentin', N'Cargill', 54, CAST(N'2018-01-21' AS Date), CAST(N'2018-03-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15374, N'Rettie', N'Niemeyer', 12, CAST(N'2019-02-10' AS Date), CAST(N'2020-01-04' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15375, N'Idell', N'Jeffcoat', 47, CAST(N'2019-11-15' AS Date), CAST(N'2021-01-11' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15376, N'Laverna', N'Fetters', 38, CAST(N'2019-10-07' AS Date), CAST(N'2019-12-08' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15377, N'Donna', N'Thoma', 21, CAST(N'2021-01-18' AS Date), CAST(N'2021-05-12' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15378, N'Lola', N'Sokolowski', 1, CAST(N'2022-07-18' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15379, N'Elissa', N'Skelly', 27, CAST(N'2020-09-15' AS Date), CAST(N'2021-07-14' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15380, N'Richard', N'Lesher', 47, CAST(N'2017-10-01' AS Date), CAST(N'2019-05-29' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15381, N'Aisha', N'Crank', 17, CAST(N'2022-04-20' AS Date), CAST(N'2022-07-04' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15382, N'Tommy', N'Rana', 55, CAST(N'2018-01-28' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15383, N'Brian', N'Marmolejo', 3, CAST(N'2016-06-24' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15384, N'Georgette', N'Lillard', 7, CAST(N'2020-03-22' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15385, N'Willie', N'Frisbie', 11, CAST(N'2014-09-16' AS Date), CAST(N'2017-02-27' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15386, N'Tuan', N'Motta', 42, CAST(N'2020-12-06' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15387, N'Duke', N'Sigala', 34, CAST(N'2021-09-23' AS Date), CAST(N'2021-09-27' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15388, N'Miya', N'Essex', 63, CAST(N'2019-05-26' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15389, N'Reid', N'Lahr', 37, CAST(N'2016-08-31' AS Date), CAST(N'2020-08-21' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15390, N'Nakia', N'Giannini', 59, CAST(N'2018-04-09' AS Date), CAST(N'2022-01-17' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15391, N'Kaleb', N'Bos', 34, CAST(N'2020-10-02' AS Date), CAST(N'2021-03-04' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15392, N'Bruce', N'Swinson', 30, CAST(N'2021-02-03' AS Date), CAST(N'2022-07-05' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15393, N'Terry', N'Brigman', 19, CAST(N'2020-08-13' AS Date), CAST(N'2021-07-03' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15394, N'Bennett', N'Pitzer', 11, CAST(N'2020-05-10' AS Date), CAST(N'2020-12-22' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15395, N'Rosetta', N'Salguero', 7, CAST(N'2014-04-26' AS Date), CAST(N'2016-03-28' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15396, N'Jami', N'Faught', 50, CAST(N'2017-10-18' AS Date), CAST(N'2020-01-27' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15397, N'Gracie', N'Hepburn', 40, CAST(N'2016-12-30' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15398, N'Clarence', N'Hendon', 16, CAST(N'2015-01-29' AS Date), CAST(N'2022-01-02' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15399, N'Johnnie', N'Chapple', 22, CAST(N'2015-10-10' AS Date), CAST(N'2021-08-23' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15400, N'Tracy', N'Arzate', 12, CAST(N'2022-07-18' AS Date), CAST(N'2022-08-18' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15401, N'Angelita', N'Birnbaum', 47, CAST(N'2021-02-06' AS Date), CAST(N'2021-12-04' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15402, N'Erick', N'Biggerstaff', 20, CAST(N'2020-07-24' AS Date), CAST(N'2021-06-14' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15403, N'Margarite', N'Rainer', 31, CAST(N'2020-07-30' AS Date), CAST(N'2022-05-04' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15404, N'Chadwick', N'Stough', 7, CAST(N'2016-03-28' AS Date), CAST(N'2020-03-02' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15405, N'Izora', N'Kenworthy', 16, CAST(N'2022-01-11' AS Date), NULL);
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15406, N'Susan', N'Buster', 30, CAST(N'2016-01-30' AS Date), CAST(N'2017-05-19' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15407, N'Harrison', N'Socha', 1, CAST(N'2013-11-25' AS Date), CAST(N'2015-05-09' AS Date));
insert into dbo.Agents (Id, FirstName, LastName, ExtensionId, StartDate, EndDate) VALUES (15408, N'Elise', N'Dewalt', 33, CAST(N'2016-04-28' AS Date), CAST(N'2020-07-19' AS Date));





