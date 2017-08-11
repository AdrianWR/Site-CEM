CREATE DATABASE cem_system /*!40100 DEFAULT CHARACTER SET utf8*/;

-- Tabela inicial com todos os usuários da CEM
CREATE TABLE users (
  user_id int NOT NULL UNIQUE AUTO_INCREMENT,
  name varchar(90) NOT NULL UNIQUE,
  email varchar(45) NOT NULL,
  phone varchar(20) NOT NULL,
  branch_line varchar(4),
  signup_time timestamp DEFAULT(CURRENT_TIMESTAMP),
  status_id int,
  linkage_id int,
  PRIMARY KEY (user_id),
  FOREIGN KEY (status_id) REFERENCES status(status_id),
  FOREIGN KEY (linkage_id) REFERENCES linkages(linkage_id)
);

-- Status do usuário com a CEM
CREATE TABLE status (
  status_id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
  status varchar(20) NOT NULL UNIQUE,
);
INSERT INTO status(description) VALUES ('Inativo'),
                                       ('Ativo');

-- Relacionamento do usuário com a UFABC
CREATE TABLE linkages (
  linkage_id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
  bond varchar(40) NOT NULL UNIQUE,
);
INSERT INTO linkages(bond) VALUES ('Coordenação Geral das CEMs'),
                                  ('Coordenação Local da CEM'),
                                  ('Técnico-Administrativo'),
                                  ('Docente'),
                                  ('Graduação'),
                                  ('Pós-Graduação - Mestrado'),
                                  ('Pós-Graduação - Doutorado');

-- Projetos de pesquisa vinculados à CEM
CREATE TABLE projects (
  project_id int NOT NULL UNIQUE AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  supervisor varchar(90) NOT NULL,
  description varchar(1024),
  PRIMARY KEY (project_id)
);



-- Tabela de equipamentos pertencentes à CEM
CREATE TABLE equipments (
  equipment_id int NOT NULL UNIQUE AUTO_INCREMENT,
  name varchar(70) NOT NULL,
  patrimony int(6) UNIQUE,
  division_id int,
  require_training boolean,
  PRIMARY KEY (equipment_id),
  FOREIGN KEY (division_id) REFERENCES division(division_id)
);
