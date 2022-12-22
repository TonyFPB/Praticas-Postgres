insert into agency (name, acronym) VALUES ('Gol Linhas Aereas', 'GLO');
insert into agency (name, acronym) VALUES ('LATAM Airlines Chile', 'LATAM');
insert into agency (name, acronym) VALUES ('Brasil Aereo', 'BRAA');
insert into agency (name, acronym) VALUES ('Atlatico Aereo', 'AA');
insert into agency (name, acronym) VALUES ('Pacifico Aereo', 'PA');

select * from agency;

insert into airports (name,acronym) values ('Rio aero','RJA');
insert into airports (name, acronym) values ('SaoPorto', 'SPP');
insert into airports (name,acronym) values ('BahiaPorto','BHA');
insert into airports (name, acronym) values ('ManausPorto', 'MP');

select * from airports;

insert into flights (name, "agencyId","departureId","destinationId","leavingDate","arriveDate") values('JDSA123645', 5,2,4,'25-04-2023','01-05-2023');
insert into flights (name, "agencyId","departureId","destinationId","leavingDate","arriveDate") values('ASDF215', 5,1,4,'09-01-2022','12-01-2023');
insert into flights (name, "agencyId","departureId","destinationId","leavingDate","arriveDate") values('FA12354', 1,1,2,'20-12-2022','23-12-2022');
insert into flights (name, "agencyId","departureId","destinationId","leavingDate","arriveDate") values('BA54', 2,3,4,'13-12-2022','12-12-2022');

select f.id, a.name AS agency, a1.name AS departure, a2.name AS destination,f.name,f."leavingDate",f."arriveDate" from flights f JOIN agency a ON a.id=f."agencyId" JOIN airports a1 ON a1.id=f."departureId" JOIN airports a2 ON a2.id=f."destinationId";