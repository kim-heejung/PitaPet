-- 상품테이블
CREATE TABLE shop(
   num NUMBER PRIMARY KEY, --상품번호
   name VARCHAR2(30), --상품이름
   category VARCHAR2(100),
   price NUMBER, --상품가격
   remainCount NUMBER CHECK(remainCount >= 0), --재고갯수 
	imgPath VARCHAR2(100) --상품 이미지 경로
);
-- 상품 테이블에 사용할 시퀀스 
CREATE SEQUENCE shop_seq;

-- 주문 테이블
CREATE TABLE client_order(
   num NUMBER PRIMARY KEY, -- 주문번호
   id VARCHAR2(30), -- 주문 고객의 아이디
   code NUMBER, -- 주문한 상품의 번호 
   addr VARCHAR2(50) -- 배송 주소
);

-- 주문 테이블에 사용할 시퀀스 
CREATE SEQUENCE client_order_seq;

CREATE TABLE petusers(
   id VARCHAR2(100) PRIMARY KEY,
   pwd VARCHAR2(100),
	 groupNum NUMBER DEFAULT 0, --0 일반회원 /1 보호소 /2 관리자
	 name VARCHAR2(100),
   phoneNumber VARCHAR2(100),
   birth VARCHAR2(100),
   email VARCHAR2(100),
   address VARCHAR2(100),
   household VARCHAR2(100),
   profile VARCHAR2(100),
	donation NUMBER,
   regdate DATE
);

CREATE TABLE shelter(
	num NUMBER 
	serialNum VARCHAR2(100) PRIMARY KEY, --고유번호
   id VARCHAR2(100), --usersid
	name VARCHAR2(100), --보호소이름
   phoneNumber VARCHAR2(100),--연락처
   email VARCHAR2(100),
   address VARCHAR2(100),
   regdate DATE,
   longitude VARCHAR2(100), --위도 경도
	latitude VARCHAR2(100)
);
create sequence shelter_seq


CREATE TABLE board_adopt(
   num NUMBER PRIMARY KEY, --seq! 
   writer VARCHAR2(100), --id
	 petName VARCHAR2(100), --동물 이름
	 petAge NUMBER, --추정 나이
	 petGender VARCHAR2(100),
	 breed VARCHAR2(100), --품종
   vaccination VARCHAR2(100), --예방접종
   Neutralization VARCHAR2(100), --중성화
	 findDate VARCHAR2(100), --발견한 날짜
   caption VARCHAR2(100), --설명
   imagePath VARCHAR2(100), --업로드된 이미지의 경로 ex) /upload/xxx.jpg
   regdate DATE
);

CREATE SEQUENCE board_adopt_seq;

CREATE TABLE reserve(
	num NUMBER, --adoptPet의 num과 같게
	id VARCHAR2(100), --예약자 id
	reservedDate DATE, --날짜
	reservedTime VARCHAR2(100)--시간
);

CREATE TABLE bookmark(
    num NUMBER,
    id VARCHAR2(100),
    bookmark CHAR(3) DEFAULT 'no'
);

CREATE TABLE board_review(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL, 
	img VARCHAR2(100),
	content CLOB,
	viewCount NUMBER,
	regdate DATE
);

CREATE SEQUENCE board_review_seq;

CREATE TABLE board_review_comment(
   num NUMBER PRIMARY KEY, --댓글의 글번호
   id VARCHAR2(100), --댓글 작성자의 아이디
   content VARCHAR2(500), --댓글 내용
   target_nick VARCHAR2(100), --댓글의 대상자 닉네임
   ref_group NUMBER, -- 원글의 글번호
   comment_group NUMBER,
   deleted CHAR(3) DEFAULT 'no',
   regdate DATE
);

CREATE SEQUENCE board_review_comment_seq;