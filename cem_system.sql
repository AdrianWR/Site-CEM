CREATE DATABASE cem_system;

CREATE TABLE users (
  user_id int NOT NULL UNIQUE AUTO_INCREMENT,
  name varchar(90) NOT NULL UNIQUE,
  email varchar(45) NOT NULL,
  phone varchar(20) NOT NULL,
  branch_line varchar(4),
  signup_time timestamp,
  status_id int,
  linkage_id int
  PRIMARY KEY (user_id),
  FOREIGN KEY status_id REFERENCES status(status_id),
  FOREIGN KEY linkage_id REFERENCES linkages(linkage_id)
);

CREATE TABLE status (
  status_id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
  description varchar(20) NOT NULL UNIQUE,
);
INSERT INTO status(description) VALUES ('Inativo');
INSERT INTO status(description) VALUES ('Ativo');

CREATE TABLE linkages (
  attribution_id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
  bond varchar(40) NOT NULL UNIQUE,
);
INSERT INTO linkages(bond) VALUES ('Técnico-Administrativo');
INSERT INTO linkages(bond) VALUES ('Docente');
INSERT INTO linkages(bond) VALUES ('Pós-Graduação - Mestrado');
INSERT INTO linkages(bond) VALUES ('Pós-Graduação - Doutorado');
INSERT INTO linkages(bond) VALUES ('Graduação');
