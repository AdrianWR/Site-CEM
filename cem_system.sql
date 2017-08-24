CREATE DATABASE IF NOT EXISTS cem /*!40100 DEFAULT CHARACTER SET utf8*/;
USE cem;

-- Status do usuário com a CEM
CREATE TABLE status (
  status_id int NOT NULL UNIQUE AUTO_INCREMENT,
  status varchar(20) NOT NULL UNIQUE,
  PRIMARY KEY (status_id)
);

INSERT INTO status(status) VALUES ('Ativo'),
                                  ('Inativo');

-- Relacionamento do usuário com a UFABC
CREATE TABLE linkages (
  linkage_id int NOT NULL UNIQUE AUTO_INCREMENT,
  bond varchar(40) NOT NULL UNIQUE,
  PRIMARY KEY (linkage_id)
);

INSERT INTO linkages(bond) VALUES ('Coordenação Geral das CEMs'),
                                  ('Coordenação Local da CEM'),
                                  ('Técnico-Administrativo'),
                                  ('Docente'),
                                  ('Graduação'),
                                  ('Pós-Graduação - Mestrado'),
                                  ('Pós-Graduação - Doutorado');

-- Tabela inicial com todos os usuários da CEM
CREATE TABLE users (
  user_id int NOT NULL UNIQUE AUTO_INCREMENT,
  name varchar(90) NOT NULL UNIQUE,
  email varchar(45) NOT NULL,
  phone varchar(20) NOT NULL,
  branch_line varchar(4),
  signup_time timestamp DEFAULT CURRENT_TIMESTAMP,
  status_id int,
  linkage_id int,
  PRIMARY KEY (user_id),
  FOREIGN KEY (status_id) REFERENCES status(status_id),
  FOREIGN KEY (linkage_id) REFERENCES linkages(linkage_id)
);

-- Projetos de pesquisa vinculados à CEM
CREATE TABLE projects (
  project_id int NOT NULL UNIQUE AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  supervisor varchar(90) NOT NULL,
  description varchar(1024),
  PRIMARY KEY (project_id)
);

-- Divisões de equipamentos
CREATE TABLE divisions (
  division_id int NOT NULL UNIQUE AUTO_INCREMENT,
  name varchar(60) NOT NULL,
  PRIMARY KEY (division_id)
);

-- Tabela de equipamentos pertencentes à CEM
CREATE TABLE equipments (
  equipment_id int NOT NULL UNIQUE AUTO_INCREMENT,
  name varchar(70) NOT NULL,
  patrimony int(6) UNIQUE,
  division_id int,
  require_training boolean,
  PRIMARY KEY (equipment_id),
  FOREIGN KEY (division_id) REFERENCES divisions(division_id)
);

-- Agendamentos para uso dos equipamentos
CREATE TABLE schedules (
  schedule_id int NOT NULL UNIQUE AUTO_INCREMENT,
  request_time timestamp DEFAULT CURRENT_TIMESTAMP,
  user_id int NOT NULL,
  equipment_id int NOT NULL,
  project_id int,
  sample varchar(2048) NOT NULL,
  begin_time datetime NOT NULL,
  end_time datetime NOT NULL,
  confirmation boolean,
  PRIMARY KEY (schedule_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (equipment_id) REFERENCES equipments(equipment_id),
  FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
