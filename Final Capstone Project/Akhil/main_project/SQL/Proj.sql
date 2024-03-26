use project_3;

#1
select distinct(item.ItemPurchased), shipping.ShippingType, avg(shopping.Age) as avg_age from item
join shopping on item.Item_index = shopping.Item_index
join shipping on shopping.Shipping_index = shipping.Shipping_index
group by ItemPurchased, ShippingType
order by avg_age;

#2
select payment.PaymentMethod, category.Category, count(category.Category) as numbers from payment
join shopping on payment.Payment_index=shopping.Payment_index
join category on shopping.Category_index = category.Category_index
where category.Category = "Accessories" or category.Category = "Outerwear"
group by PaymentMethod,Category
order by numbers;

#3
select location.Location, shopping.Color, count(shopping.Color) as count_of_purchases from location
join shopping on location.Location_index = shopping.Location_index
join gender on shopping.Gender_index = gender.Gender_index
where gender.Gender = "Female"
group by Location, Color
order by count_of_purchases desc;


#4
select location.Location, item.ItemPurchased, avg(shopping.Review_Rating)as review from location
join shopping on location.Location_index = shopping.Location_index
join item on item.Item_index = shopping.Category_index
join category on shopping.Category_index = category.Category_index
where category.Category = "Clothing" or category.Category= "Outerwear"
group by Location, ItemPurchased
order by review desc;

#5
select shipping.ShippingType, avg(shopping.Purchase_Amount) as avg_purchase from shipping
join shopping on shipping.Shipping_index = shopping.Shipping_index
group by ShippingType
order by avg_purchase desc;

#6
select shipping.ShippingType, payment.PaymentMethod, category.Category, avg(shopping.Purchase_Amount) as avg_purchase from shipping
join shopping on shipping.Shipping_index = shopping.Shipping_index
join payment on payment.Payment_index = shopping.Payment_index
join category on shopping.Category_index = category.Category_index
group by ShippingType,PaymentMethod,Category
order by avg_purchase desc;

#7
select shopping.Color, gender.Gender, count(gender.Gender) as no_of_purchases from shopping
join gender on shopping.Gender_index = gender.Gender_index
group by Color, Gender
order by no_of_purchases desc;

#8
select item.ItemPurchased, shopping.Color, count(shopping.Color) as no_of_purchases from item
join shopping on item.Item_index = shopping.Item_index
group by ItemPurchased,Color
order by no_of_purchases;

#9
select location.Location,  count(shopping.Discount_Applied) as num_of_disc from location
join shopping on location.Location_index = shopping.Location_index
where Discount_Applied = "yes"
group by Location
order by num_of_disc desc;

#10
select payment.PaymentMethod, gender.Gender, count(gender.Gender) as no_of_users from payment
join shopping on payment.Payment_index = shopping.Payment_index
join gender on gender.Gender_index = shopping.Gender_index
group by PaymentMethod, Gender;

#11
select location.Location, count(shopping.Promo_Code_Used) as no_of_codes_used from location
join shopping on location.Location_index = shopping.Location_index
group by Location
order by no_of_codes_used desc;

#12
select shopping.Customer_ID, sum(shopping.Purchase_Amount) as sum_amount, category.Category, location.Location from shopping
join category on shopping.Category_index = category.Category_index
join location on shopping.Location_index = location.Location_index
where shopping.Age between 30 and 60
group by Customer_ID,Category,Location
order by sum_amount desc
limit 20;

#13
select season.Season, category.Category, sum(shopping.Purchase_Amount) as total_amount from season
join shopping on season.Season_index = shopping.Season_index
join category on category.Category_index = shopping.Category_index
where shopping.Subscription_Status = "yes" and shopping.Promo_Code_Used ="yes"
group by Season, Category
having total_amount>1000
order by total_amount desc;

#14
select shipping.ShippingType, shopping.Size, count(shopping.Size) as no_of_items from shipping
join shopping on shipping.Shipping_index = shopping.Shipping_index
group by ShippingType, Size
having no_of_items >100
order by no_of_items desc;

#15
select location.Location, category.Category, avg(shopping.Review_Rating)as review from location
join shopping on location.Location_index = shopping.Location_index
join category on category.Category_index = shopping.Category_index
group by Location, Category
order by review desc;