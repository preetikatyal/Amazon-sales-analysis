create database project;
use project;
select * from amazon_salesdata;

# Check the datatypes
describe amazon_salesdata;

# Amazon wants to understand the performance of its sales. 
# They aim to identify key drivers of sales and profit, pinpoint top-performing products and categories, and uncover geographical strengths and weaknesses.

# Question 1: What is the overall sales and profit trend over time?
select month(str_to_date(`order date`,'%d-%m-%Y')) sales_month, round(sum(sales),2) monthy_sales, round(sum(profit),2) monthly_profit from amazon_salesdata
group by sales_month order by sales_month;

# Question 2: Which product categories are generating the most sales and profit?
select category, round(sum(sales),2) total_sales, round(sum(profit),2) total_profit, round((sum(profit)/sum(sales))*100,2) profit_margin_percentage 
from amazon_salesdata group by category order by total_sales desc;

# Question 3: What are the top 10 best-selling products by sales value and quantity?
select `Product name`, round(sum(sales),2) total_sales, sum(quantity) total_quantity from amazon_salesdata
group by `product name` order by total_sales desc limit 10;
select `Product name`, round(sum(sales),2) total_sales, sum(quantity) total_quantity from amazon_salesdata
group by `product name` order by total_quantity desc limit 10;

# Question 4: Which geographies (countries/regions) are performing best/worst in terms of sales and profit?
select right(Geography,length(geography)-14) city, round(sum(sales),2) total_sales, round(sum(profit),2) total_profit, 
round((sum(profit)/sum(sales))*100,2) profit_margin_percentage 
from amazon_salesdata group by geography order by profit_margin_percentage desc;
 
 # Question 5: What is the average profit per order?
 select round(avg(profit),2) avg_profit from amazon_salesdata;