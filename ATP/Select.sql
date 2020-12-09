



DELIMITER $$
USE `atp`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aumentar_salario`(IN porcentagem INT)
BEGIN
	START TRANSACTION;
	UPDATE pessoa SET salario = (salario + (salario / 100 * porcentagem)) where tipo_pessoa in (1, 2, 3, 4, 5);
	COMMIT;
END$$

DELIMITER ;



call aumentar_salario(10);



CREATE VIEW empregados_dependentes AS
    SELECT 
         funcionario.nome funcionario,
   dependente.nome dependente
     FROM
         pessoa funcionario
  JOIN dependentes dependentes on dependentes.id_funcionario = funcionario.id
  JOIN pessoa dependente on dependentes.id_dependente = dependente.id
     ORDER BY funcionario.nome ASC;
     

SELECT nome issoEUmAlias FROM pessoa, (SELECT id, nome nome1, salario FROM pessoa WHERE id_tipo_pessoa <> 3 HAVING MAX(salario) = salario) AS maiorSalario WHERE pessoa.id = maiorSalario.id;

SELECT nome, salario FROM pessoa WHERE id_tipo_pessoa <> 3 ORDER BY salario DESC;

SELECT nome, salario FROM pessoa WHERE id_tipo_pessoa <> 3 HAVING MAX(salario) = salario;

SELECT ROUND(AVG(salario),2) FROM pessoa WHERE sexo = 'M';


SELECT ROUND(AVG(salario),2) FROM pessoa WHERE sexo = 'f'; 

SELECT nome FROM pessoa WHERE id_tipo_pessoa = 1;

SELECT nome FROM pessoa p
JOIN projeto_pessoa pp ON pp.id_pessoa = p.id
HAVING COUNT(1) >= 1;

