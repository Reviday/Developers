-- 날짜 포맷형식을 다음으로 바꾼다. ex) 2019.01.01 13:00:00
alter session set nls_date_format = 'YYYY.MM.DD HH24:MI:SS'; 


/*해당 정보는 멤버 테이블에 필요한 정보들 */
create table ta_member ( -- 회원정보 테이블(비고: 必은 첫 회원가입시 반드시 입력받을 정보)
    /*회원 가입 시*/
    mem_no number constraint mem_no_pk primary key, -- 회원넘버(시퀀스넘버로 부여)
    mem_email varchar2(30) not null, -- 회원 이메일
    mem_password varchar2(300), -- 회원 psssword
    mem_level number default 0, -- 회원레벨(0 - 회원가입 미완료, 1 - 일반회원, 3 - 기업회원, 5 - 관리자)
    
    /*회원 가입 완료 단계*/
    mem_name varchar2(50) default null, -- 회원 이름
    mem_phone varchar2(11) default null, -- 회원 전화번호(없을 경우 집전화/ '-' 없이 입력받는다.)
    
    /*회원 인증*/
    mem_point number default 0, -- 회원 포인트
    
    -- 이하는 부가정보
    mem_denied char(1) default 'N' constraint mem_denied_ck check (mem_denied in ('Y','N','P')) not null, -- 해당 회원 차단 여부(기본값 N/ 영구정지 P) 
    mem_email_cert char(1) default 'N' constraint mem_email_cert_ck check (mem_email_cert in ('Y','N')) not null, -- 이메일 인증 여부(기본값 N)
    mem_receive_email char(1) default 'N' constraint mem_receive_email_ck check (mem_receive_email in ('Y','N')) not null, -- 이메일 수신 동의 여부(기본값 N)
    mem_enroll_datetime date default sysdate, -- 회원 가입일(시간 포함)
    mem_enroll_ip varchar2(20) default null, -- 회원 가입 ip
    mem_lastlogin_datetime date default null, -- 마지막 접속일 
    mem_lastlogin_ip varchar2(20) default null, -- 마지막 접속 ip
    mem_profile_content varchar2(300) default null, -- 자기소개(프로필용, 100자)
    mem_adminmemo varchar2(1000) default null,   -- 회원에 대한 관리자용 메모
    mem_icon varchar2(1000) default null, -- 기업 회원 아이콘 경로
    mem_photo varchar2(1000) default null, -- 회원 프로필 사진 경로
    mem_status char(1) default 'Y' constraint mem_status_ck check (mem_status in ('Y','N')) not null, -- 회원 계정 상태
    mem_withdrawal_date date default null, -- 회원 탈퇴 일시
    mem_denied_date date default null, -- 회원 차단 일시
    filter_id number 
);

/* 회원넘버용 시퀀스 */
create sequence mem_seq 
start with 10000
increment by 1;

/* 인증 이메일 키 관리 테이블 */
create table member_auth_email (
    mae_id number primary key, -- pk
    mem_no number references ta_member(mem_no), -- 이메일 인증이 필요한 회원의 No.
    mae_key varchar2(300), -- 이메일 인증키
    mae_type char(1) check (mae_type in ('E','P')) not null, -- 인증 종류 E:Enroll(회원가입), P:Password(비밀번호 찾기) 
    mae_generate_datetime date default sysdate, -- 인증키 생성일자
    mae_use_datetime date default null, -- 인증키 사용일자
    mae_expired char(1) default 'N' check (mae_expired in ('Y','N')) not null -- 인증키 파기 여부
);

create sequence mae_seq;



