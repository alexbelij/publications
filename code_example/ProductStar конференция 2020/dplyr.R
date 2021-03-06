library(RSQLite)
library(DBI)
library(sqldf)
library(dplyr)

# ������������ � ����
con <- dbConnect(SQLite(), 'D:/Google ����/����������/Netpeak/�����������/ProductStar ����������� 2020/product.db')

# ��������� ������
products <- dbReadTable(con, 'products')
sales    <- dbReadTable(con, 'sales')

# ###########################################
# ���������� SQL ������� ������ R
# ###########################################
sqldf('SELECT date, country 
       FROM sales')

# ###########################################
# ����������� ������� � R
# ###########################################

# ������� ������� 
select(sales, date, country)

# ����������� ������
result <- left_join(sales, products, by = 'product_id')

# ���������� �������
left_join(sales, products, by = 'product_id') %>%
  mutate(sale_sum     = price * count,
         discount_sum = sale_sum * discount,
         final_sum    = sale_sum - discount_sum)

# ����������� � ���������
left_join(sales, products, by = 'product_id') %>%
  mutate(sale_sum     = price * count,
         discount_sum = sale_sum * discount,
         final_sum    = sale_sum - discount_sum) %>%
  group_by(product_name) %>%
  summarise(final_sum = sum(final_sum))

# ����������
left_join(sales, products, by = 'product_id') %>%
  mutate(sale_sum     = price * count,
         discount_sum = sale_sum * discount,
         final_sum    = sale_sum - discount_sum) %>%
  group_by(product_name) %>%
  summarise(final_sum = sum(final_sum)) %>%
  arrange(desc(final_sum))
  
# ����������
left_join(sales, products, by = 'product_id') %>%
  filter(between(as.Date(date), as.Date('2020-06-01'), as.Date('2020-08-31'))) %>%
  mutate(sale_sum     = price * count,
         discount_sum = sale_sum * discount,
         final_sum    = sale_sum - discount_sum) %>%
  group_by(product_name) %>%
  summarise(final_sum = sum(final_sum)) %>%
  arrange(desc(final_sum))
