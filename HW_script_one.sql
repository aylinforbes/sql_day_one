--Week 5- Monday questions

--Query How many actors are there with the last name 'Wahlgerg'
select last_name
from actor
where last_name like 'Wahlberg';

--Query How many payments were made between $3.99 and $5.99
select count(amount)
from payment
where amount between 3.99 and 5.99;

--Query What film does the store have the most of (search in inventory)
select count(distinct film_id)
from inventory;


--Query How many customers have the last name ‘William’
select last_name
from customer
where last_name like 'William';

--Query What store employee (get the id) sold the most rentals
SELECT staff_id, count(*)rental_id
from rental
group by staff_id
limit 1;

--Query How many different district names are there
select count(distinct name)
from category;

--Query What film has the most actors in it? (use film_actor table and get film_id)
select film_id
from (
  select film_id, count(actor_id) as actor_count
  from film_actor
  group by film_id
) as subquery
order by actor_count desc
limit 1;


--Query From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(last_name)
from customer
where last_name like '%es';

--Query How many payment amounts (4.99, 5.99, etc.) 
--had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
select customer_id, amount, count(amount) as num_payments, count(rental_id) as num_rentals
from payment
where customer_id between 380 and 430
group by customer_id, amount
order by customer_id;

--Query  Within the film table, how many rating categories are there? And what rating has the most movies total
select rating, count(rating)
from film
group by rating 
order by rating desc;

