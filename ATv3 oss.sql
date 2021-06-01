CREATE DATABASE aulas;
USE aulas;

CREATE TABLE Curso ( 
	cod_curso INTEGER PRIMARY KEY AUTO_INCREMENT,
    tot_cred INTEGER,
    nome_curso VARCHAR (60) NOT NULL,
    cod_coord INTEGER NOT NULL
)AUTO_INCREMENT = 0;

DESC Curso;

CREATE TABLE Aluno ( 
	mat_aluno INTEGER PRIMARY KEY AUTO_INCREMENT,
    cod_curso INTEGER,
    dat_nasc DATE NOT NULL, 
    tot_cred INTEGER NOT NULL,
    mgp DOUBLE NOT NULL,
    nom_alun VARCHAR (60) NOT NULL, 
    email VARCHAR (30),
    
    CONSTRAINT fk_cod_curso FOREIGN KEY (cod_curso) REFERENCES Curso (cod_curso)
);
DESC Aluno;

INSERT INTO Curso (tot_cred, nome_curso, cod_coord) 
VALUES
(200, "Egenharia da Computacao", 1),
(320, "Engenharia Eletrica", 1),
(300, "Ciencia da Computacao", 1),
(150, "Sistema de Informacao", 2),
(140, "Egenharia Civil", 3);


INSERT INTO Aluno (cod_curso, dat_nasc, tot_cred, mgp, nom_alun, email) 
VALUES
(2, '2000-10-5', 60, 8.75, 'Diogo Rodrigues', 'diogo@gmail.com'),
(3, '2001-10-5', 60, 8.75, 'Andrea', 'andrea@gmail.com'),
(Null, '2001-10-5', 60, 8.75, 'Pedro', 'Pedro@gmail.com'),
(Null, '2001-10-5', 60, 8.75, 'Alexandre', 'alexandre@gmail.com')
;
Select * from Curso;
/*1  Construa um SELECT que mostre todos os alunos e o respectivo nome do curso no  qual ele está matriculado.
*/
SELECT nom_alun, nome_curso FROM Aluno LEFT JOIN Curso
 ON (Aluno.cod_curso = Curso.cod_curso);	
 
 
 
 /* 1º QUESTAO */
 DELIMITER $$
drop procedure if exists Registra_Aluno$$
create procedure Registra_Aluno (mat_aluno INT, cod_curso INT, dat_nasc DATE,
	tot_cred INT, mgp DOUBLE,nom_alun VARCHAR (30),email VARCHAR(30) )
deterministic
BEGIN
    INSERT INTO Aluno VALUES (mat_aluno, cod_curso, dat_nasc, tot_cred, mgp,nom_alun, email);
    SELECT nom_alun AS nome FROM Aluno ORDER BY mat_aluno DESC limit 1;
END $$

drop procedure Registra_Aluno;
call Registra_Aluno("",1 , 1998-05-4, 30 ,9.3, "Fabio Castro", "Fabin@gmail.com");
Select * from Aluno;

DELETE from Aluno Where mat_aluno > 6
Call Registra_Aluno("",4, "1995-04-3", 40 ,3.2, "Junior Vasconcelos", "Vascon@gmail.com");



/* 2ª QUESTÃO */

DELIMITER //
CREATE PROCEDURE cont_while(limite TINYINT UNSIGNED)
BEGIN
DECLARE contador INT;
DECLARE resultado varchar(60);
	SET contador = 1;
    SET resultado = '';
    While cont <= 5 DO
		SET resultado = concat(resultado, contador,',');
        SET cont = cont + 1;
	END WHILE;
SELECT resultado;
END //
Drop procedure cont_while;
CALL cont_while(1);


/* 3ª QUESTAO */
DELIMITER $$ 
CREATE PROCEDURE cont_repeat(limite TINYINT unsigned)
BEGIN
	DECLARE contador INT;
    DECLARE resultado VARCHAR(50);
		SET contador = 1;
			SET resultado = '';
		REPEAT
			SET resultado = concat(resultado, contador, ', ');
            SET contador = contador + 1;
            UNTIL contador = 10
		END REPEAT;
	SELECT resultado;
END $$ 

DROP PROCEDURE cont_repeat;

call cont_repeat(1);

            




