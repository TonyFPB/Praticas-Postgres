insert into alunos (name,email,cpf) values ('ana','ana@gamil.com','12345678941');
insert into alunos (name,email,cpf) values ('carlos','carlos@gamil.com','11111222236');
insert into alunos (name,email,cpf) values ('gabriel','gabriel@gamil.com','65498732125');
insert into alunos (name,email,cpf) values ('ravi','ravi@gamil.com','11223344556');

insert into turmas (name) values ('t1');
insert into turmas (name) values ('t2');
insert into turmas (name) values ('t3');
insert into turmas (name) values ('t4');


insert into classes ("alunoId","turmaId") values(1,2);
insert into classes ("alunoId","turmaId") values(2,3);
insert into classes ("alunoId","turmaId") values(3,1);
insert into classes ("alunoId","turmaId") values(4,1);


insert into modulos (name) values ('modulo 1');
insert into modulos (name) values ('modulo 2');
insert into modulos (name) values ('modulo 3');
insert into modulos (name) values ('modulo 4');

insert into projetos (name, "moduloId") values ('Parrot Game', 1);
insert into projetos (name, "moduloId") values ('Forca', 2);
insert into projetos (name, "moduloId") values ('My Wallet', 3);
insert into projetos (name, "moduloId") values ('Globo', 1);
insert into projetos (name, "moduloId") values ('BoardGame', 4);


insert into entrega_dos_alunos ("projetoId", "classeId", nota, "dataDeEntrega") values (1,1,'Abaixo das expectativas','22-12-2022');
insert into entrega_dos_alunos ("projetoId", "classeId") values (3,2);

select e.id,a.name,t.name as turma,p.name as projeto ,m.name as modulo,e.nota,e."dataDeEntrega"
    from entrega_dos_alunos e 
    join projetos p on p.id=e."projetoId" 
    join classes c on c.id =e."classeId"
    join aluno a on c."alunoId" = a.id
    join turmas t on c."turmaId"=t.id
    join modulos m on m.id=p."moduloId";