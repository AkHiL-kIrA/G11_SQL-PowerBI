use project_2;
select channel1.Channelname, count(customer.state_code) as noof from customer
join sales on sales.CustomerIndex = customer.CustomerIndex
join channel1 on channel1.Id = sales.ChanelIndex
group by channel1.Channelname;

select regionlookup_area.Area1, sales.OrderQuantity from regionlookup_area
join region on region.Areaindex = regionlookup_area.Area_Id
join sales on sales.RegionIndex = region.RegionIndex;

select reionlookup_county.county, max(sales.LineTotal) from sales
join region on region.RegionIndex = sales.RegionIndex
join reionlookup_county on reionlookup_county.County_Id = region.Countyindex
group by reionlookup_county.county;


select regionlookup_area.Area1, product.ProductCategory, sales.TotalUnitCost as TotalUnitCost from regionlookup_area
join region on regionlookup_area.Area_Id = region.Areaindex
join sales on region.RegionIndex = sales.regionIndex
join product on sales.ProductIndex = product.iindex
group by regionlookup_area.Area1, product.ProductCategory, TotalUnitCost;

select channel1.Channelname, max(sales.UnitPrice) as unitprice, regionlookup_area.Area1, regionlookup_type.typecdp from channel1
join sales on channel1.Id = sales.ChanelIndex
join region on sales.RegionIndex = region.RegionIndex
join regionlookup_type on region.CDPindex = regionlookup_type.Type_Id
join regionlookup_area on region.Areaindex = regionlookup_area.Area_Id
group by Channelname, Area1, typecdp;

select regionlookup_area.Area1, region.population, customer.households from regionlookup_area
join region on regionlookup_area.Area_Id = region.Areaindex
join sales on region.RegionIndex = sales.RegionIndex
join customer on sales.CustomerIndex = customer.CustomerIndex
group by Area1, population,households;

select reionlookup_county.county, product.ProductCategory, avg(sales.UnitPrice) as unitp from reionlookup_county
join region on reionlookup_county.County_Id = region.Countyindex
join sales on region.RegionIndex = sales.RegionIndex 
join product on sales.ProductIndex = product.iindex
group by county,ProductCategory
having unitp>100 and county like 'B%'
order by unitp desc 
;

select distinct(product.ProductName), max(TotalUnitCost) as TUC from product
join sales on product.iindex = sales.ProductIndex
group by ProductName
order by TUC;

select product.ProductCategory, avg(sales.TotalUnitCost) as avg_TUC, regionlookup_type.typecdp from product
join sales on product.iindex = sales.ProductIndex
join region on sales.RegionIndex = region.RegionIndex
join regionlookup_type on region.CDPindex = regionlookup_type.Type_Id
group by ProductCategory, typecdp
order by avg_TUC desc;

select customer.state_code, sum(sales.OrderQuantity) as odqu from customer
join sales on customer.CustomerIndex = sales.CustomerIndex
group by state_code
order by odqu desc;