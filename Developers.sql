-- ��¥ ���������� �������� �ٲ۴�. ex) 2019.01.01 13:00:00
alter session set nls_date_format = 'YYYY.MM.DD HH24:MI:SS'; 


/*�ش� ������ ��� ���̺� �ʿ��� ������ */
create table ta_member ( -- ȸ������ ���̺�(���: ���� ù ȸ�����Խ� �ݵ�� �Է¹��� ����)
    /*ȸ�� ���� ��*/
    mem_no number constraint mem_no_pk primary key, -- ȸ���ѹ�(�������ѹ��� �ο�)
    mem_email varchar2(30) not null, -- ȸ�� �̸���
    mem_password varchar2(300), -- ȸ�� psssword
    mem_level number default 0, -- ȸ������(0 - ȸ������ �̿Ϸ�, 1 - �Ϲ�ȸ��, 3 - ���ȸ��, 5 - ������)
    
    /*ȸ�� ���� �Ϸ� �ܰ�*/
    mem_name varchar2(50) default null, -- ȸ�� �̸�
    mem_phone varchar2(11) default null, -- ȸ�� ��ȭ��ȣ(���� ��� ����ȭ/ '-' ���� �Է¹޴´�.)
    
    /*ȸ�� ����*/
    mem_point number default 0, -- ȸ�� ����Ʈ
    
    -- ���ϴ� �ΰ�����
    mem_denied char(1) default 'N' constraint mem_denied_ck check (mem_denied in ('Y','N','P')) not null, -- �ش� ȸ�� ���� ����(�⺻�� N/ �������� P) 
    mem_email_cert char(1) default 'N' constraint mem_email_cert_ck check (mem_email_cert in ('Y','N')) not null, -- �̸��� ���� ����(�⺻�� N)
    mem_receive_email char(1) default 'N' constraint mem_receive_email_ck check (mem_receive_email in ('Y','N')) not null, -- �̸��� ���� ���� ����(�⺻�� N)
    mem_enroll_datetime date default sysdate, -- ȸ�� ������(�ð� ����)
    mem_enroll_ip varchar2(20) default null, -- ȸ�� ���� ip
    mem_lastlogin_datetime date default null, -- ������ ������ 
    mem_lastlogin_ip varchar2(20) default null, -- ������ ���� ip
    mem_profile_content varchar2(300) default null, -- �ڱ�Ұ�(�����ʿ�, 100��)
    mem_adminmemo varchar2(1000) default null,   -- ȸ���� ���� �����ڿ� �޸�
    mem_icon varchar2(1000) default null, -- ��� ȸ�� ������ ���
    mem_photo varchar2(1000) default null, -- ȸ�� ������ ���� ���
    mem_status char(1) default 'Y' constraint mem_status_ck check (mem_status in ('Y','N')) not null, -- ȸ�� ���� ����
    mem_withdrawal_date date default null, -- ȸ�� Ż�� �Ͻ�
    mem_denied_date date default null, -- ȸ�� ���� �Ͻ�
    filter_id number 
);

/* ȸ���ѹ��� ������ */
create sequence mem_seq 
start with 10000
increment by 1;

/* ���� �̸��� Ű ���� ���̺� */
create table member_auth_email (
    mae_id number primary key, -- pk
    mem_no number references ta_member(mem_no), -- �̸��� ������ �ʿ��� ȸ���� No.
    mae_key varchar2(300), -- �̸��� ����Ű
    mae_type char(1) check (mae_type in ('E','P')) not null, -- ���� ���� E:Enroll(ȸ������), P:Password(��й�ȣ ã��) 
    mae_generate_datetime date default sysdate, -- ����Ű ��������
    mae_use_datetime date default null, -- ����Ű �������
    mae_expired char(1) default 'N' check (mae_expired in ('Y','N')) not null -- ����Ű �ı� ����
);

create sequence mae_seq;



