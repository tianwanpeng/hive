CREATE TABLE table1 (a STRING, b STRING, PRIMARY KEY (a) DISABLE);
CREATE TABLE table2 (a STRING, b STRING, CONSTRAINT pk1 PRIMARY KEY (a) DISABLE);
CREATE TABLE table3 (x string NOT NULL DISABLE, PRIMARY KEY (x) DISABLE, CONSTRAINT fk1 FOREIGN KEY (x) REFERENCES table2(a) DISABLE); 
CREATE TABLE table4 (x string CONSTRAINT nn4_1 NOT NULL DISABLE, y string CONSTRAINT nn4_2 NOT NULL DISABLE, UNIQUE (x) DISABLE, CONSTRAINT fk2 FOREIGN KEY (x) REFERENCES table2(a) DISABLE, 
CONSTRAINT fk3 FOREIGN KEY (y) REFERENCES table2(a) DISABLE);
CREATE TABLE table5 (x string, PRIMARY KEY (x) DISABLE, FOREIGN KEY (x) REFERENCES table2(a) DISABLE);
CREATE TABLE table6 (x string, y string, PRIMARY KEY (x) DISABLE, FOREIGN KEY (x) REFERENCES table2(a) DISABLE,
CONSTRAINT fk4 FOREIGN KEY (y) REFERENCES table1(a) DISABLE);
CREATE TABLE table7 (a STRING, b STRING, PRIMARY KEY (a) DISABLE RELY);
CREATE TABLE table8 (a STRING, b STRING, CONSTRAINT pk8 PRIMARY KEY (a) DISABLE NORELY);
CREATE TABLE table9 (a STRING, b STRING, PRIMARY KEY (a, b) DISABLE RELY);
CREATE TABLE table10 (a STRING, b STRING, CONSTRAINT pk10 PRIMARY KEY (a) DISABLE NORELY, FOREIGN KEY (a, b) REFERENCES table9(a, b) DISABLE);
CREATE TABLE table11 (a STRING, b STRING, c STRING, CONSTRAINT pk11 PRIMARY KEY (a) DISABLE RELY, CONSTRAINT fk11_1 FOREIGN KEY (a, b) REFERENCES table9(a, b) DISABLE,
CONSTRAINT fk11_2 FOREIGN KEY (c) REFERENCES table4(x) DISABLE);
CREATE TABLE table12 (a STRING CONSTRAINT nn12_1 NOT NULL DISABLE NORELY, b STRING);
CREATE TABLE table13 (a STRING NOT NULL DISABLE RELY, b STRING);
CREATE TABLE table14 (a STRING CONSTRAINT nn14_1 NOT NULL DISABLE RELY, b STRING);
CREATE TABLE table15 (a STRING REFERENCES table4(x) DISABLE, b STRING);
CREATE TABLE table16 (a STRING CONSTRAINT nn16_1 REFERENCES table4(x) DISABLE RELY, b STRING);
CREATE TABLE table17 (a STRING CONSTRAINT uk17_1 UNIQUE DISABLE RELY, b STRING);
CREATE TABLE table18 (a STRING, b STRING, CONSTRAINT uk18_1 UNIQUE (b) DISABLE RELY);

DESCRIBE EXTENDED table1;
DESCRIBE EXTENDED table2;
DESCRIBE EXTENDED table3;
DESCRIBE EXTENDED table4;
DESCRIBE EXTENDED table5;
DESCRIBE EXTENDED table6;
DESCRIBE EXTENDED table7;
DESCRIBE EXTENDED table8;
DESCRIBE EXTENDED table9;
DESCRIBE EXTENDED table10;
DESCRIBE EXTENDED table11;
DESCRIBE EXTENDED table12;
DESCRIBE EXTENDED table13;
DESCRIBE EXTENDED table14;
DESCRIBE EXTENDED table15;
DESCRIBE EXTENDED table16;
DESCRIBE EXTENDED table17;
DESCRIBE EXTENDED table18;

DESCRIBE FORMATTED table1;
DESCRIBE FORMATTED table2;
DESCRIBE FORMATTED table3;
DESCRIBE FORMATTED table4;
DESCRIBE FORMATTED table5;
DESCRIBE FORMATTED table6;
DESCRIBE FORMATTED table7;
DESCRIBE FORMATTED table8;
DESCRIBE FORMATTED table9;
DESCRIBE FORMATTED table10;
DESCRIBE FORMATTED table11;
DESCRIBE FORMATTED table12;
DESCRIBE FORMATTED table13;
DESCRIBE FORMATTED table14;
DESCRIBE FORMATTED table15;
DESCRIBE FORMATTED table16;
DESCRIBE FORMATTED table17;
DESCRIBE FORMATTED table18;

ALTER TABLE table2 DROP CONSTRAINT pk1;
ALTER TABLE table3 DROP CONSTRAINT fk1;
ALTER TABLE table4 DROP CONSTRAINT nn4_1;
ALTER TABLE table6 DROP CONSTRAINT fk4;
ALTER TABLE table16 DROP CONSTRAINT nn16_1;
ALTER TABLE table18 DROP CONSTRAINT uk18_1;

DESCRIBE EXTENDED table2;
DESCRIBE EXTENDED table3;
DESCRIBE EXTENDED table4;
DESCRIBE EXTENDED table6;
DESCRIBE EXTENDED table16;
DESCRIBE EXTENDED table18;

DESCRIBE FORMATTED table2;
DESCRIBE FORMATTED table3;
DESCRIBE FORMATTED table4;
DESCRIBE FORMATTED table6;
DESCRIBE FORMATTED table16;
DESCRIBE FORMATTED table18;

ALTER TABLE table2 ADD CONSTRAINT pkt2 PRIMARY KEY (a) DISABLE NOVALIDATE;
ALTER TABLE table3 ADD CONSTRAINT fk1 FOREIGN KEY (x) REFERENCES table2(a) DISABLE NOVALIDATE RELY;
ALTER TABLE table6 ADD CONSTRAINT fk4 FOREIGN KEY (y) REFERENCES table1(a) DISABLE NOVALIDATE;
ALTER TABLE table16 CHANGE a a STRING REFERENCES table4(x) DISABLE NOVALIDATE;
ALTER TABLE table18 ADD CONSTRAINT uk18_2 UNIQUE (a, b) DISABLE NOVALIDATE;

DESCRIBE FORMATTED table2;
DESCRIBE FORMATTED table3;
DESCRIBE FORMATTED table6;
DESCRIBE FORMATTED table16;
DESCRIBE FORMATTED table18;

ALTER TABLE table12 CHANGE COLUMN b b STRING CONSTRAINT nn12_2 NOT NULL DISABLE NOVALIDATE;
ALTER TABLE table13 CHANGE b b STRING NOT NULL DISABLE NOVALIDATE;

DESCRIBE FORMATTED table12;
DESCRIBE FORMATTED table13;

ALTER TABLE table12 DROP CONSTRAINT nn12_2;

DESCRIBE FORMATTED table12;

CREATE DATABASE DbConstraint;
USE DbConstraint;
CREATE TABLE Table2 (a STRING, b STRING NOT NULL DISABLE, CONSTRAINT Pk1 PRIMARY KEY (a) DISABLE);
USE default;

DESCRIBE EXTENDED DbConstraint.Table2;
DESCRIBE FORMATTED DbConstraint.Table2;

ALTER TABLE DbConstraint.Table2 DROP CONSTRAINT Pk1;

DESCRIBE EXTENDED DbConstraint.Table2;
DESCRIBE FORMATTED DbConstraint.Table2;

ALTER TABLE DbConstraint.Table2 ADD CONSTRAINT Pk1 PRIMARY KEY (a) DISABLE NOVALIDATE;
DESCRIBE FORMATTED DbConstraint.Table2;
ALTER TABLE DbConstraint.Table2 ADD CONSTRAINT fkx FOREIGN KEY (b) REFERENCES table1(a) DISABLE NOVALIDATE;
DESCRIBE FORMATTED DbConstraint.Table2;
