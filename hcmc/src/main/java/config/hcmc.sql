
/* Drop Triggers */

DROP TRIGGER TRI_f_board_bnum;
DROP TRIGGER TRI_f_board_board_num;
DROP TRIGGER TRI_f_city_city_num;
DROP TRIGGER TRI_f_festival_festival_num;
DROP TRIGGER TRI_f_festival_fnum;
DROP TRIGGER TRI_f_map_mapnum;
DROP TRIGGER TRI_f_map_map_num;
DROP TRIGGER TRI_f_member_mem_num;
DROP TRIGGER TRI_f_member_mnum;
DROP TRIGGER TRI_f_rep_rep_num;
DROP TRIGGER TRI_f_rep__board_num;



/* Drop Tables */

DROP TABLE f_rep CASCADE CONSTRAINTS;
DROP TABLE f_board CASCADE CONSTRAINTS;
DROP TABLE f_favor CASCADE CONSTRAINTS;
DROP TABLE f_festival CASCADE CONSTRAINTS;
DROP TABLE f_map CASCADE CONSTRAINTS;
DROP TABLE f_city CASCADE CONSTRAINTS;
DROP TABLE f_member CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_f_board_bnum;
DROP SEQUENCE SEQ_f_board_board_num;
DROP SEQUENCE SEQ_f_city_city_num;
DROP SEQUENCE SEQ_f_festival_festival_num;
DROP SEQUENCE SEQ_f_festival_fnum;
DROP SEQUENCE SEQ_f_map_mapnum;
DROP SEQUENCE SEQ_f_map_map_num;
DROP SEQUENCE SEQ_f_member_mem_num;
DROP SEQUENCE SEQ_f_member_mnum;
DROP SEQUENCE SEQ_f_rep_rep_num;
DROP SEQUENCE SEQ_f_rep__board_num;




/* Create Sequences */

CREATE SEQUENCE SEQ_f_board_board_num INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_f_city_city_num INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_f_festival_festival_num INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_f_map_map_num INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_f_member_mem_num INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_f_rep_rep_num INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;



/* Create Tables */

CREATE TABLE f_board
(
	board_num number NOT NULL,
	board_head varchar2(20) NOT NULL,
	board_upload varchar2(300),
	board_content varchar2(1000),
	board_date date,
	mem_num number NOT NULL,
	festival_num number,
	PRIMARY KEY (board_num)
);


CREATE TABLE f_city
(
	city_num number NOT NULL,
	city_name varchar2(10) NOT NULL,
	city_address varchar2(150) NOT NULL,
	city_lati number NOT NULL,
	city_long number NOT NULL,
	PRIMARY KEY (city_num)
);


CREATE TABLE f_favor
(
	mem_num number NOT NULL,
	festival_num number NOT NULL,
	favor_star number
);


CREATE TABLE f_festival
(
	festival_num number NOT NULL,
	festival_name varchar2(100) NOT NULL,
	festival_start date NOT NULL,
	festival_end date,
	festival_pic varchar2(300),
	festival_hpage varchar2(150),
	festival_theme varchar2(20) NOT NULL,
	festival_time varchar2(50),
	festival_count number,
	festival_content varchar2(1000),
	city_num number NOT NULL,
	PRIMARY KEY (festival_num)
);


CREATE TABLE f_map
(
	map_num number NOT NULL,
	map_phone number,
	map_name varchar2(50),
	map_category varchar2(10),
	city_num number NOT NULL,
	PRIMARY KEY (map_num)
);


CREATE TABLE f_member
(
	mem_num number NOT NULL,
	mem_id varchar2(50) NOT NULL UNIQUE,
	mem_pass varchar2(50) NOT NULL,
	mem_nickname varchar2(50) UNIQUE,
	mem_admin char NOT NULL,
	PRIMARY KEY (mem_num)
);


CREATE TABLE f_rep
(
	rep_num number NOT NULL,
	rep_date date,
	rep_content varchar2(1000),
	board_num number NOT NULL,
	mem_num number NOT NULL,
	PRIMARY KEY (rep_num)
);



/* Create Foreign Keys */

ALTER TABLE f_rep
	ADD FOREIGN KEY (board_num)
	REFERENCES f_board (board_num)
;


ALTER TABLE f_festival
	ADD FOREIGN KEY (city_num)
	REFERENCES f_city (city_num)
;


ALTER TABLE f_map
	ADD FOREIGN KEY (city_num)
	REFERENCES f_city (city_num)
;


ALTER TABLE f_board
	ADD FOREIGN KEY (festival_num)
	REFERENCES f_festival (festival_num)
;


ALTER TABLE f_favor
	ADD FOREIGN KEY (festival_num)
	REFERENCES f_festival (festival_num)
;


ALTER TABLE f_board
	ADD FOREIGN KEY (mem_num)
	REFERENCES f_member (mem_num)
;


ALTER TABLE f_favor
	ADD FOREIGN KEY (mem_num)
	REFERENCES f_member (mem_num)
;


ALTER TABLE f_rep
	ADD FOREIGN KEY (mem_num)
	REFERENCES f_member (mem_num)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_f_board_bnum BEFORE INSERT ON f_board
FOR EACH ROW
BEGIN
	SELECT SEQ_f_board_bnum.nextval
	INTO :new.bnum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_board_board_num BEFORE INSERT ON f_board
FOR EACH ROW
BEGIN
	SELECT SEQ_f_board_board_num.nextval
	INTO :new.board_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_city_city_num BEFORE INSERT ON f_city
FOR EACH ROW
BEGIN
	SELECT SEQ_f_city_city_num.nextval
	INTO :new.city_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_festival_festival_num BEFORE INSERT ON f_festival
FOR EACH ROW
BEGIN
	SELECT SEQ_f_festival_festival_num.nextval
	INTO :new.festival_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_festival_fnum BEFORE INSERT ON f_festival
FOR EACH ROW
BEGIN
	SELECT SEQ_f_festival_fnum.nextval
	INTO :new.fnum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_map_mapnum BEFORE INSERT ON f_map
FOR EACH ROW
BEGIN
	SELECT SEQ_f_map_mapnum.nextval
	INTO :new.mapnum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_map_map_num BEFORE INSERT ON f_map
FOR EACH ROW
BEGIN
	SELECT SEQ_f_map_map_num.nextval
	INTO :new.map_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_member_mem_num BEFORE INSERT ON f_member
FOR EACH ROW
BEGIN
	SELECT SEQ_f_member_mem_num.nextval
	INTO :new.mem_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_member_mnum BEFORE INSERT ON f_member
FOR EACH ROW
BEGIN
	SELECT SEQ_f_member_mnum.nextval
	INTO :new.mnum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_rep_rep_num BEFORE INSERT ON f_rep
FOR EACH ROW
BEGIN
	SELECT SEQ_f_rep_rep_num.nextval
	INTO :new.rep_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_f_rep__board_num BEFORE INSERT ON f_rep_
FOR EACH ROW
BEGIN
	SELECT SEQ_f_rep__board_num.nextval
	INTO :new.board_num
	FROM dual;
END;

/




