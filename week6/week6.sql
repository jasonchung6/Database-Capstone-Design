-- week5 inha DB

-- Building 테이블 생성: 건물 정보를 저장
CREATE TABLE Building (
  B_Id INT PRIMARY KEY,             -- 건물ID PRIMARY KEY로 설정
  B_Name VARCHAR(45) NOT NULL,      -- 건물명
  UNIQUE (B_Name)                   -- 건물 이름이 중복되는 경우는 없으므로 유니크 키로 설정
);

-- Room 테이블 생성: 강의실 정보를 저장
CREATE TABLE Room (
  R_Id VARCHAR(45) NOT NULL,        -- 강의실 ID
  R_Name VARCHAR(45) NOT NULL,      -- 강의실의 이름
  Capacity VARCHAR(45),             -- 강의실의 수용 인원
  B_Id INT,                         -- 건물의 ID (외래 키)
  D_Id VARCHAR(5),                  -- 학과의 아이디 (외래 키)
  PRIMARY KEY (R_Id, B_Id),
  FOREIGN KEY (B_Id) REFERENCES Building (B_Id),  -- 건물 ID에 대한 외래 키 제약 조건
  FOREIGN KEY (D_Id) REFERENCES Department (D_Id)  -- 학과 ID에 대한 외래 키 제약 조건
);

-- Department 테이블 생성: 학과 정보를 저장
CREATE TABLE Department (
  D_Id VARCHAR(5) PRIMARY KEY,      -- 학과ID PRIMARY KEY로 설정
  D_Name VARCHAR(100) NOT NULL,     -- 학과명
  D_Email VARCHAR(45),              -- 학과의 이메일
  D_PhoneNumber VARCHAR(45),        -- 학과의 전화번호
  UNIQUE (D_Name)                   -- 학과 이름 중복은 없으므로 유니크 키로 설정
);

-- Student 테이블 생성: 학생 정보를 저장
CREATE TABLE Student (
  S_Id INT PRIMARY KEY,             -- 학생의 ID
  S_Name VARCHAR(45) NOT NULL,      -- 학생의 이름
  S_Email VARCHAR(45),              -- 학생의 이메일
  S_PhoneNumber VARCHAR(45),        -- 학생의 전화번호
  Major VARCHAR(5),                 -- 학과의 아이디 (외래 키)
  FOREIGN KEY (Major) REFERENCES Department (D_Id)
);

CREATE TABLE Employee(
  E_Id INT PRIMARY KEY,
  E_Name VARCHAR(45),
  Position VARCHAR(45)
);

CREATE TABLE Class (
  Cla_Id VARCHAR(10) PRIMARY KEY,
  Cla_Name VARCHAR(45) NOT NULL,
  Professor_Id INT,
  Participants INT,
  FOREIGN KEY (Professor_Id) REFERENCES Employee (E_Id)
);

CREATE TABLE Class_Stu(
  Cla_Id VARCHAR(10),
  S_Id INT,
  PRIMARY KEY (Cla_Id, S_Id),
  FOREIGN KEY (Cla_Id) REFERENCES Class (Cla_Id),
  FOREIGN KEY (S_Id) REFERENCES Student (S_Id)
);

CREATE TABLE Club(
  Clu_Id INT PRIMARY KEY,
  Clu_Name VARCHAR(45)
);

CREATE TABLE Club_Stu(
  CS_Id INT PRIMARY KEY,
  Clu_Id INT,
  S_Id INT,
  FOREIGN KEY (Clu_Id) REFERENCES Club (Clu_Id),
  FOREIGN KEY (S_Id) REFERENCES Student (S_Id)
);

-- Building
INSERT INTO Building (B_Id, B_Name)
VALUES (10, 'HighTech'),
(2, '2th'),
(5, '5th'),
(6, '6th'),
(60,'60th_Anniv');
-- Room
INSERT INTO Room (R_Id, R_Name, Capacity, B_Id, D_Id)
VALUES ('H-232', '232', 60, 10, 'ICE'),
('2-101', '101', 50, 2, 'MECH'),
('5-301', '301', 55, 5, 'EE'),
('6-601', '601', 60, 6, 'ELE'),
('60-101', '101', 120, 60, 'ELE');
-- Department
INSERT INTO Department (D_Id, D_Name, D_Email, D_PhoneNumber)
VALUES  ('ICE', 'Department of Information and Communication Engineering','ice@inha.ac.kr','032-860-7430'),
('CSE', 'Department of Computer Science and Engineering','cse@inha.ac.kr','032-860-7440'),
('EE', 'Department of Electronic Engineering', 'ee@inha.ac.kr', '032-860-7410'), 
('ELE', 'Department of Electrical Engineering', 'ele@inha.ac.kr', '032-860-7390'),
('MECH', 'Department of Mechanical Engineering', 'mech@inha.ac.kr', '032-860-7300');
-- Student
INSERT INTO Student (S_Id, S_Name, S_Email, S_PhoneNumber, Major)
VALUES (12191821,'Chung','12191821@inha.edu', '010-3149-9994', 'ICE'),
(12201234,'Kim','12201234@inha.edu', '010-1111-1111', 'CSE'),
(12211221,'Lee','12211221@inha.edu', '010-2222-2222','EE'),
(12223456,'Park','12223456@inha.edu', '010-3333-3333','ELE'),
(12191822,'Chung','12191822@inha.edu', '010-4444-4444','MECH');
-- Emplyee
INSERT INTO Employee (E_Id, E_Name, Position)
VALUES (11111111, 'Choi', 'Professor'),
(22222222, 'Kim', 'Professor'),
(33333333, 'Byun', 'Professor'),
(55555555, 'Lee', 'Professor'),
(66666666, 'Yoo', 'Professor');
-- Class
INSERT INTO Class (Cla_Id, Cla_Name, Professor_Id, Participants)
VALUES ('ICE4016001', 'Database Capstone Design', 11111111, 100 ),
('ICE3014001', 'Operating System', 22222222, 50 ),
('ICE2005001', 'Electronic Circuits 1', 33333333, 55 ),
('ICE4020001', 'Information Security', 55555555, 60 ),
('ICE4008001', 'Computer Network', 66666666, 50 );
-- Club
INSERT INTO Club (Clu_Id, Clu_Name)
VALUES (1, 'INCOM'),
(2, 'Bluetooth'),
(3, 'int i'),
(4, 'Bodongbodong'),
(5, 'Manong');
-- Clu_Stu
INSERT INTO Club_Stu (CS_Id, Clu_Id, S_Id)
VALUES (1, 1, 12191821),
(2, 1, 12191822),
(3, 2, 12201234),
(4, 3, 12211221),
(5, 4, 12223456),
(6, 5, 12191821);
