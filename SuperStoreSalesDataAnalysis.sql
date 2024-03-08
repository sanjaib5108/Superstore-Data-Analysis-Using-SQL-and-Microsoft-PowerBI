select
count(order_id) as Total_Orders_Placed,
count(distinct country) as Total_Countries,
count(distinct product_name) as Total_products,
count(distinct category) as Total_Categories,
count(distinct sub_category) as Total_Subcategories,
count(distinct year) as Total_Years,
sum(sales) as Total_Sales,
sum(quantity) as Total_Quantity,
avg(profit) as Average_Profit,
avg(discount) as Average_Discount
from dbo.SuperStoreOrders;

-- Sales Performance Analysis, to find the top 10 products.

select top 10
product_name as ProductName, 
category as Category, 
sum(sales) as TotalSales, 
sum(quantity) as TotalQuantitySold
from dbo.SuperStoreOrders
group by
product_name,
category
order by
sum(sales) desc;

-- Sales Trend over year

select
year as Year,
sum(sales) as TotalSales
from dbo.SuperStoreOrders
group by year
order by sum(sales) desc;

-- Customer Segmentation
select 
segment as Segment,
count(distinct customer_name) as TotalCustomers,
sum(sales) as TotalSales
from dbo.SuperStoreOrders
group by segment
order by sum(sales) desc;

-- Shipping and Order Management Analysis
select 
ship_mode as ShipMode,
avg(shipping_cost) as ShippingCost,
avg(profit) as AverageProfit
from dbo.SuperStoreOrders
group by ship_mode
order by avg(profit);


-- Time Analysis
select
ship_mode as ShipMode,
avg(datediff(day, try_cast(order_date as date), try_cast(ship_date as date))) as AverageTimeGap
from dbo.SuperStoreOrders
group by ship_mode;

-- Profitability and Cost Analysis
select
product_name as ProductName,
category as Category,
avg(profit) as AverageProfit,
avg(discount) as AverageDiscount
from dbo.SuperStoreOrders
group by 
product_name,
category,
sub_category
order by avg(profit) desc;

-- Profitability and Cost Analysis for Top 10 products
select top 10
product_name as ProductName,
category as Category,
avg(profit) as AverageProfit,
(avg(discount)*100) as AverageDiscount
from dbo.SuperStoreOrders
group by 
product_name,
category,
sub_category
order by avg(profit) desc;

-- Global Sale and Quanitity Overview
select
country as Country,
sum(sales) as TotalSales,
sum(quantity) as TotalQuantity
from dbo.SuperStoreOrders
group by country
order by sum(sales) desc;


-- Global Sale and Quanitity Overview for Top 10 Countries
select top 10
country as Country,
sum(sales) as TotalSales,
sum(quantity) as TotalQuantity
from dbo.SuperStoreOrders
group by country
order by sum(sales) desc;

-- State Level Category Exploration
select 
product_name as ProductName,
category as Category,
sum(quantity) as TotalQuantitySold
from dbo.SuperStoreOrders
group by
product_name,
category
order by sum(quantity) desc;

-- State Level Category Exploration Top 10 Categories
select top 10
product_name as ProductName,
category as Category,
sum(quantity) as TotalQuantitySold
from dbo.SuperStoreOrders
group by
product_name,
category
order by sum(quantity) desc;

-- Regional Subcategory Analysis
select 
region as Region,
sub_category as SubCategory,
sum(quantity)as TotalQuantitySold
from dbo.SuperStoreOrders
group by 
region,
sub_category
order by sum(quantity) desc;


-- Regional Subcategory Analysis Top 10 Analysys
select top 10
region as Region,
sub_category as SubCategory,
sum(quantity)as TotalQuantitySold
from dbo.SuperStoreOrders
group by 
region,
sub_category
order by sum(quantity) desc;