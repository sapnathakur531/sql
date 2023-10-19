create database SQL_PROJECT

CREATE TABLE PRODUCT_ID(Product_Id INT,Country varchar(max), Product varchar(max),Units_Sold numeric,  Manufacturing_Price numeric,sale_price float, Gross_Sales money,sales money,
COGS money, Profit money, Dated date,Month_Number int, Month_name varchar(20), Year_ int)

select * from PRODUCT_ID

create table item_Table(Item_Id int,item_description varchar(max),vendor_nos int,vendor_name varchar(max),bottle_size int, bottle_price  float)
select * from item_Table

---1) Find the Total Sale Price  and  Gross Sales 
select sum(Gross_sales) as Total_Grosssales, sum(sales) as Total_sales from PRODUCT_ID

--2) In which year we have got the highest sales
select  year_, sales from PRODUCT_ID where sales = (select max(sales) from PRODUCT_ID)

--3)  Which Product having the sales of $ 37,050.00
select Product, Sales from PRODUCT_ID where sales=37050

--4) Which Countries lies between profit of 4,605 to 22 ,662.00
select country, profit from PRODUCT_ID where Profit between 4605 and 22662


--5) Which Product Id having the COGS of $ 24 , 700.00]
select Product_Id, sales from PRODUCT_ID where COGS=24700
select * from PRODUCT_ID


--task2
--1)Find the item_description having the bottle size of 750

select * from item_Table
select  item_description,bottle_size from item_Table where bottle_size=750

-- 2) Find the vendor Name having the vendor_nos 305 , 380 , 391
select vendor_name, vendor_nos from item_Table where vendor_nos in(305,380,391)

--3) What is total Bottle_price 

select sum(bottle_price) as Total_Bottleprice from item_Table

--4) Make Primary Key to Item_id
alter table item_Table Add constraint PK PRIMARY KEY(Item_id) 
SELECT * FROM item_Table

--5) Which item id having the bottle_price of $ 5.06

select item_id, bottle_price from item_Table where bottle_price=5.06

--Task3
--1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table
--innerjoin
select * from PRODUCT_ID inner join item_Table on PRODUCT_ID.Product_Id=item_Table.Item_Id
--outerjoin
select * from PRODUCT_ID full outer join item_Table on PRODUCT_ID.Product_Id=item_Table.Item_Id
--left join
select * from PRODUCT_ID Left join item_Table on PRODUCT_ID.Product_Id=item_Table.Item_Id

--2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table 
select * from PRODUCT_ID full outer join item_Table on PRODUCT_ID.Product_Id=item_Table.Item_Id
select * from PRODUCT_ID right join item_Table on PRODUCT_ID.Product_Id=item_Table.Item_Id
select * from PRODUCT_ID cross join item_Table 



--3) Find the item_description and Product having the gross sales of 13,320.00
select item_Table.item_description, PRODUCT_ID.Product from PRODUCT_ID join item_Table on PRODUCT_ID.Product_Id=item_Table.Item_Id where Gross_Sales=13320


--4) Combine the  bottle_price and profit Column and show total value of both the columns in a new temporary columns

select sum(item_Table.bottle_price)+ sum(PRODUCT_ID.Profit) as TotalPP from PRODUCT_ID inner join item_Table on PRODUCT_ID.Product_Id=item_Table.Item_Id

--5)[Split the Item_description Column into Columns Item_desc1 and Item_desc2]

SELECT item_description,
LEFT(item_description, CHARINDEX(' ', item_description + ' ') - 1) AS item_description,
RIGHT(item_description, LEN(item_description) - CHARINDEX(' ', item_description + ' ')) 
AS item_description FROM item_Table;




































