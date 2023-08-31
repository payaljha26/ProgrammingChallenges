
# Question 1
    
SELECT DATE(date) AS Date, SUM(impressions) AS total_impressions
FROM marketing_data
GROUP BY Date
ORDER BY Date;

# Question 2

Select state as Top3States, SUM(revenue) as Sum_of_Revenue from website_revenue 
group by Top3States
order by Sum_of_Revenue desc
limit 3;
/* OHIO was the third best state with revenue of $37577 */

#Question 3

Select c.name as Campaign_Name , sum(a.cost) as Total_Cost, sum(a.impressions) as Total_Impressions, sum(a.clicks) as Total_Clicks, sum(b.revenue) as Total_Revenue
from campaign_info c
join marketing_data a
on c.id= a.campaign_id
join website_revenue b
on  c.id= b.campaign_id 
group by Campaign_Name
order by Campaign_Name; 

#Question 4

# The highest sum of conversions for Campaign 5 was in 'GA' state.

select b.state as State, sum(a.conversions) as Sum_of_Conversions
from marketing_data a
join website_revenue b
on a.campaign_id = b.campaign_id
join campaign_info c
on a.campaign_id = c.id
where c.name= 'Campaign5'
group by b.state
order by Sum_of_Conversions desc;


# Question 5

/* To answer this question I have considered Return on Investment(ROI) to measure the most efficient campaign, and the most effective campaign as
 per the ROI is Campaign 4 as it has the highest ROI 
 
 ROI Formula = (Total Revenue - Total cost) / Total cost 
 
 NOTE : Used LIMIT function to find the topmost efficient campaign in MYSQL, TOP 1 can be used in SQL Server*/

Select c.name as Campaign_Name, (sum(w.revenue)-sum(m.cost))/sum(m.cost)  as ROI
from campaign_info c
join website_revenue w
on c.id = w.campaign_id
join marketing_data m
on c.id = m.campaign_id
group by Campaign_Name
order by ROI desc
limit 1;

#Bonus question

/* Here I have considered Click to conversion rate as the parameter to decide the best day for running ads, 
As Sunday's click to conversion rate is the highest, it is the best day for running ads 
The output gives an overview of the average rates for impressions , clicks and conversions, and also Click to conversion rate*/

Select Dayname(a.date) as Day , avg(a.impressions) , avg(a.clicks) , avg(a.conversions) , avg(a.clicks)/avg(a.conversions) as Click_to_conversion_rate
from marketing_data a
join website_revenue b
on a.campaign_id = b.campaign_id
group by Day
order by Click_to_conversion_rate desc;







