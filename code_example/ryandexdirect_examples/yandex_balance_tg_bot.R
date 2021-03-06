library(ryandexdirect)
library(telegram.bot)
library(stringr)

# ��������� ��������
yadirSetLogin('irina.netpeak')

# ������ �������
balance <- yadirGetBalance()

# ����������� ����� �� ��������� 7 ����
spent <- yadirGetReport(DateRangeType = 'LAST_7_DAYS',
                        FieldNames    = 'Cost')

# ����������� �� ������� ���� ������ �������
days <- floor(as.numeric(balance$Amount) / (spent$Cost / 7))

# ���������� ��������� � ��������, ���� ������� ������ ����� ��� �� 3 ���
if { days <= 3 } {
  
  bot <- Bot()
  
  msg <- str_glue('������� ������� �� ����� ����� � ������.������ {spent$Cost}, 
                  ��� ������� ������ ������ ����� ������������ ����� {days} ��.')
  
  bot$sendMessage(, msg, 'HTML')
  
}