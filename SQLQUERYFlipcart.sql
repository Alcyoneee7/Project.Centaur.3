--Inspecting Data

Select *
From PortfolioProject..Flipcart


select distinct upper(brand) as Brand, count(brand) as m
from PortfolioProject..Flipcart
group by brand
order by m desc


--I Already Check And Drop Some Column In Excel Earlier
--Only Duplicate Is Found, No Other Else
--And I Already Clean It

--But To Make Sure, I Will Be Rechecking Again 

select distinct [Product Type] 
From PortfolioProject..Flipcart

select distinct who
From PortfolioProject..Flipcart

select distinct price
From PortfolioProject..Flipcart

select distinct rating 
From PortfolioProject..Flipcart
order by 1

-- It Was Good I Recheck Otherwise ....
-- In For 'Who' Column 
-- 2 Distinct 'kid', 'Kids'
--which basically the same


select distinct who
, case when who = 'kid' then 'kids'
else who 
end
From PortfolioProject..Flipcart

update PortfolioProject..Flipcart
set who = case when who = 'kid' then 'kids'
else who 
end


-- Some Rating Is Only One,
-- Im Really Confused Should I Include It Or Not
-- Researching In Google

Select *
From PortfolioProject..Flipcart
order by [total ratings given] desc


--After 2 Hour Is Spent Finding Solution
-- 30 Minutes Research
-- 90 Minutes Play Game , Online Chess Game , Clash Royale

-- Finally Solution Is Founded 
-- I Think I Just Demonstrated Problem Solving SKill In This

-- SO My SOlution Goes:

--I Will Be Taking Only 660 Data desc from total rating since there are some data 
--for me didn't make sense
--like, total rating given is less than 10 

-- i mean did the product did't get sold/no one buy it       or       no one rate it 
--or many people buy it but didn't rate it
-- i dont think i should include product with few ratings
--if i take all data , there will be inaccuracy and error 


--Making Temp Table With 660 Data

--checkpoint

with abcd as
(
Select *
From PortfolioProject..Flipcart
where [Total Ratings Given] between 100 and 167992
)
Select *
from abcd 
order by [Total Ratings Given] desc



--takeout distinct brand and sum rating
--which brand has most rating and their average rating
--  <> 1 L

with abcd as
(
Select *
From PortfolioProject..Flipcart
where [Total Ratings Given] between 100 and 167992
)
Select distinct upper(brand) as Brand , sum([total ratings given]) as [Total Ratings] , avg(Rating) As [Average Rating]
from abcd
group by brand
order by  [Total Ratings] desc;


-- I Forgot To Mention, Below Command Is Same AS Above
-- Just Want To Demonstrate My SKill Using Temp Table / CTE


 Select distinct upper(Brand)as Brand,sum([total ratings given]) as [Total Ratings], Avg(Rating) as AA
from PortfolioProject..Flipcart
where [Total Ratings Given] between 100 and 167992
group by Brand
order by [Total Ratings] Desc





--For Whom Man/Woman/Children Most Buyed
--Since There Are No Record OF Buyed/Sold
--I Will Consider For Every 1 Total Rating Given, This Product Is Sold
-- Since There Are Some App/Shop That U Need To Buy First Only Can U Rate

--<>2 L

with abcd as
(
Select *
From PortfolioProject..Flipcart
where [Total Ratings Given] between 100 and 167992
)
Select Distinct upper(Who) as Gender,sum([total ratings given]) as [Total Sold]
from abcd
group by who
order by 2 desc


--Count Which Product type Are Sold The Most
--

--<>3 L

with abcd as
(
Select *
From PortfolioProject..Flipcart
where [Total Ratings Given] between 100 and 167992
)
Select distinct upper([Product type])as [Product Type],sum([total ratings given]) as [Total Sold]
from abcd
group by [Product Type]
order by 2 desc

