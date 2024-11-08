CREATE TABLE users (
  id INTEGER,
  myid INTEGER unique,
  username VARCHAR2(25) NOT NULL,
  enabled char(1)DEFAULT '1',
  last_login DATE DEFAULT SYSDATE,
  PRIMARY KEY (id)
);



CREATE TABLE addresses (
  user_id INTEGER NOT NULL,
  street VARCHAR2(30) NOT NULL,
  city VARCHAR2(30) NOT NULL,
  state VARCHAR2(30) NOT NULL,
  PRIMARY KEY (user_id),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (myid)
);

-----1:다수------------------------------


CREATE TABLE books (
  id int,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(100) NOT NULL,
  published_date timestamp NOT NULL,
  isbn int,
  PRIMARY KEY (id),
  UNIQUE (isbn)
);


CREATE TABLE reviews (
  id int,
  book_id int NOT NULL,
  user_id int NOT NULL,
  review_content VARCHAR2(255),
  rating int,
  published_date timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

--1:1의 관계는 양쪽이 프라이머리키 또는 유니크
--1:다수 관계 한쪽 프라이머리(혹은 유니크)//한쪽은 필드만 있음



-----다:다수---다대다(M:N) 관계---------------------------

CREATE TABLE users_books (
  user_id int NOT NULL,
  book_id int NOT NULL,
  checkout_date timestamp,
  return_date timestamp,
  PRIMARY KEY (user_id, book_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);


---강제로 삭제---
DROP TABLE 부모테이블명 CASCADE CONSTRAINTS;