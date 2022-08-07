
CREATE Table users(
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(25) UNIQUE NOT NULL,
    phone VARCHAR(12) UNIQUE NOT NULL
 );

CREATE TABLE PROFILE(
    user_name VARCHAR(20),
    DOB DATE,
    bio varchar(256),
    profile_id INTEGER UNIQUE,
    CONSTRAINT fk_user_id FOREIGN KEY (profile_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE post(
    post_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    post_type ENUM("img","video"),
    visibility ENUM("public","private"),
    postedBy_id INTEGER ,
    posted_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_uid FOREIGN KEY (postedBy_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE report(
    post_id INTEGER ,
    reportedBy INTEGER,
    report_type ENUM("harassment","bullying","violence","Spam","misleading"),
    disciption VARCHAR(255),
    CONSTRAINT FOREIGN KEY (post_id) REFERENCES post(post_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (reportedBy) REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE teams(
    Gid INTEGER AUTO_INCREMENT  PRIMARY KEY ,
    Gname VARCHAR(12),
    GAdmin INTEGER
);



CREATE TABLE members(
    mem_id INTEGER,
    Gid INTEGER,
    Unique my_uniq_key (mem_id, Gid),
     CONSTRAINT fk_gid FOREIGN KEY (Gid) REFERENCES teams(Gid)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_user_ids FOREIGN KEY (mem_id) REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);
   




INSERT INTO users ( email,phone ) VALUES("a@mail.com",917707909733);
INSERT INTO users ( email,phone ) VALUES("b@mail.com",917707903397);
INSERT INTO users ( email,phone ) VALUES("c@mail.com",91707909707);
INSERT INTO users ( email,phone ) VALUES("d@mail.com",917707902333);
INSERT INTO users ( email,phone ) VALUES("e@mail.com",917707901333);
INSERT INTO users ( email,phone ) VALUES("h@mail.com",917707901233);
INSERT INTO users ( email,phone ) VALUES("i@mail.com",917707909721);
INSERT INTO users ( email,phone ) VALUES("j@mail.com",917707909234);
INSERT INTO users ( email,phone ) VALUES("k@mail.com",917707909235);


INSERT INTO PROFILE ( user_name,DOB,bio,profile_id ) VALUES(
    "a",str_to_date('12-07-2012','%d-%m-%Y'),"abcd",1
);
INSERT INTO PROFILE ( user_name,DOB,bio,profile_id ) VALUES(
    "b",str_to_date('22-2-2001','%d-%m-%Y'),"efg",2
);
INSERT INTO PROFILE ( user_name,DOB,bio,profile_id ) VALUES(
    "c",str_to_date('03-03-2001','%d-%m-%Y'),"hij",3
);
INSERT INTO PROFILE ( user_name,DOB,bio,profile_id ) VALUES(
    "d",str_to_date('04-04-2001','%d-%m-%Y'),"lmn",4
);
INSERT INTO PROFILE ( user_name,DOB,bio,profile_id ) VALUES(
    "e",str_to_date("05-02-2001",'%d-%m-%Y'),"opq",5
);
SELECT * FROM profile;




INSERT INTO post ( post_type,visibility,postedBy_id ) VALUES(
     "img","public",1
);
INSERT INTO post ( post_type,visibility,postedBy_id ) VALUES(
     "img","public",2
);
INSERT INTO post ( post_type,visibility,postedBy_id ) VALUES(
     "video","public",3
);
INSERT INTO post ( post_type,visibility,postedBy_id ) VALUES(
     "img","private",3
);
INSERT INTO post ( post_type,visibility,postedBy_id ) VALUES(
     "img","private",1
);
INSERT INTO post ( post_type,visibility,postedBy_id ) VALUES(
     "img","public",5
);
INSERT INTO post ( post_type,visibility,postedBy_id ) VALUES(
     "img","public",1
);
SELECT * FROM post;


INSERT INTO  teams ( Gname,Gadmin ) VALUES(
    "IT-24",1
);

INSERT INTO  teams ( Gname,Gadmin ) VALUES(
    "IT-25",2
);
INSERT INTO  teams ( Gname,Gadmin ) VALUES(
    "IT-26",3
);
INSERT INTO  teams ( Gname,Gadmin ) VALUES(
    "CS-24",4
);
INSERT INTO  teams ( Gname,Gadmin ) VALUES(
    "CS-25",5
);
INSERT INTO  teams ( Gname,Gadmin ) VALUES(
    "CS-26",6
);



INSERT INTO members ( mem_id , Gid ) VALUES(
    1,1
);
INSERT INTO members ( mem_id , Gid ) VALUES(
    2,2
);
INSERT INTO members ( mem_id , Gid ) VALUES(
    5,3
);
INSERT INTO members ( mem_id , Gid ) VALUES(
    4,4
);
INSERT INTO members ( mem_id , Gid ) VALUES(
    3,4
);
INSERT INTO members ( mem_id , Gid ) VALUES(
    2,3
);

INSERT INTO members ( mem_id , Gid ) VALUES(
    5,1
);
INSERT INTO members ( mem_id , Gid ) VALUES(
    4,2
);
INSERT INTO members ( mem_id , Gid ) VALUES(
    6,4
);

SELECT * FROM members;


INSERT INTO  report ( post_id, reportedBy, report_type, disciption ) VALUES(
     2,1,"harassment","asdfghjklhgftdsdrftghcfggfgfxg"
);
INSERT INTO  report ( post_id, reportedBy, report_type, disciption ) VALUES(
     1,2,"Spam","asdfghjklhgftdsdrftghcfggfgfxg"
);

SELECT * FROM report;
