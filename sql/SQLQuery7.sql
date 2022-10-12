select * from production.products

---ເພີ່ມຂໍ້ມູນຮ້ານ
select * from sales.stores

insert into sales.stores values('PALITA','02054433.21','timpalita335@gmail.com','13','Xaisettha','TT','001')
insert into sales.stores values('TIM','02099999999','TTTIM457@gmail.com','13','Xaisettha','T','002')
insert into sales.stores values('TIM PALITA','02097825567','tim457@gmail.com','13','Xaithany','TT','003')

update sales.stores set zip_code = '001' where store_id=1

---ເພີ່ມຂໍ້ມູນແບນ
select * from production.brands

insert into production.brands values('YAMAHA')
insert into production.brands values('TOYOTA')
insert into production.brands values('SUZUKI')

---ເພີ່ມປະເພດສິນຄ້າ
select * from production.categories

insert into production.categories values('CAR')
insert into production.categories values('MOTOBIKE')
insert into production.categories values('TRUCK')

---ເພີ່ມສິນຄ້າ
select * from production.products

insert into production.products values('VIGO',2,3,2025,1000000)
insert into production.products values('Klic',1,2,2022,100000)
insert into production.products values('Suzuki new',3,2,2022,500000)

select product_id N'ລະຫັດ',product_name N'ຊື່ສິນຄ້າ',production.brands.brand_name N'ຊື່ຢີ້ຫໍ່',production.categories.category_name N'ຊື່ປະເພດສິນຄ້າ' ,
production.products.model_year N'ປີຜະລິດ',production.products.list_price N'ລາຄາ' FROM production.products,production.brands,production.categories
where production.products.brand_id = production.brands.brand_id and production.products.category_id = production.categories.category_id
select * from production.products

update production.products set product_name='' where product_id=4

delete from production.products where product_id=4
delete from production.products where product_id=5
delete from production.products where product_id=6

---ເພີ່ມຂໍ້ມູນstaffs
select * from sales.staffs

insert into sales.staffs values('TIM','ABC','newqwe457@gmail.com','02097825767','1',1,1)
insert into sales.staffs values('TAIY ','HHH','newqe457@gmail.com','02097825767','0',2,2)
insert into sales.staffs values('KYY','VBV','nam11@gamil.com','02097825864','1',2,3)

---ສະແດງສະເພາະຂໍ້ມູນຂອງສະstaffs
SELECT staff_id as N'ລຳດັບ',first_name as N'ຊື່', last_name N'ນາມສະກຸນ',sales.staffs.email 'ຈີເມວ',sales.staffs.phone 'ເບີໂທ',
active N'ສະຖານະ',sales.stores.store_name N'ຊື່ຮ້ານ'
FROM sales.staffs,sales.stores WHERE sales.staffs.store_id = sales.stores.store_id
SELECT * FROM sales.staffs

update sales.staffs set first_name = 'Hackter',last_name= 'SSV',email='newqwe457@gmail.com',phone=02097825767 where staff_id=1

---ເພີ່ມພະນັກງານ

select * from sales.customers

insert into sales.customers values('HOUNA','BBB','02097825767','ter457@gmail.com','10','Xaisettha','','')
insert into sales.customers values('NAMFON','KKK','02088888888','sai4@gmail.com','1','Xaisettha','sa','002')
insert into sales.customers values('KINOY','JJJ','02099999999','Mack7@gmail.com','Thaduet','Xaisettha','pp','003')

select customer_id N'ລະຫັດ',first_name  N'ຊື່',last_name N'ນາມສະກຸນ',phone N'ເບີ',email N'ເມວ',street N'ຖະໜົນ',city N'ເມືອງ' , states N'ລັດ',zip_code N'ລະຫັດ'
from sales.customers where sales.customers.customer_id = sales.customers.customer_id

---ເພີ່ມສະຕັອກ
select * from production.stocks

insert into production.stocks values(1,1,1)
insert into production.stocks values(2,2,2)
insert into production.stocks values(3,3,3)

select sales.stores.store_name N'ຊື່ຮ້ານ',production.products.product_name N'ຊື່ສິນຄ້າ'
from sales.stores,production.products,production.stocks where production.stocks.store_id = sales.stores.store_id

---ເພີ່ມ Order
select * from sales.orders
insert into sales.orders values (1,1,'2022-10-9','2022-10-9','2022-10-9',1,1)
insert into sales.orders values (2,0,'2022-10-07','2022-10-09','2022-10-09',2,3)
insert into sales.orders values (3,0,'2022-10-07','2022-10-09','2022-10-09',3,2)

select order_id N'ລຳດັບ', sales.customers.first_name N'ຊື່ພະນັກງານ',order_status N'ສະຖານະ',order_date N'ວັນທີ່ສັ່ງ',required_date N'ວັນທີ່ຕ້ອງການ',shipped_date N'ວັນທີ່ຈັດສົ່ງ',sales.stores.store_name N'ຊື່ຮ້ານ',sales.staffs.first_name N'ຊື່ຜູ້ສົ່ງ'
from sales.orders,sales.customers,sales.stores,sales.staffs 
where sales.orders.customer_id = sales.customers.customer_id and sales.orders.store_id = sales.stores.store_id and sales.orders.staff_id = sales.staffs.staff_id

---ເພີ່ມ order item
select * from sales.order_items

insert into sales.order_items values (1,1,1,10,50000,10)
insert into sales.order_items values (2,2,2,100,500000,99)
insert into sales.order_items values (3,3,3,50,25000,11)

select sales.orders.order_id N'ລະຫັດ',item_id N'ລະຫັດ',production.products.product_name N'ຊື່ສິນຄ້າ',quantity N'ຈຳນວນ',production.products.list_price N'ລາຄາ',discount N'ສ່ວນຫຼຸດ'
from production.products,sales.order_items,sales.orders 
where sales.order_items.order_id = sales.orders.order_id and sales.order_items.product_id = production.products.product_id