library(rfacebookstat)

# �������� ������ ��������� ������ ����������
bm <- fbGetBusinessManagers()

# ��������� �����
options(rfacebookstat.business_id = bm$id)

# �������� ������ ������������� ������ ���������
bm_users <- fbGetBusinessManagersUsers()

# �������� ������ �������� ��������� ��� ������������
user_accounts <- fbGetBusinessUserAdAccounts(
                      business_users_id = "133486951426870"
                      )
