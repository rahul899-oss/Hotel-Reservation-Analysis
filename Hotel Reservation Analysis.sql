----Q.1. What is the total number of reservations in the dataset?
   
      SELECT COUNT(*) AS Total_Reservations
	  FROM Hotel_Reservation;



-----Q.2. Which meal plan is the most popular among guests?


       SELECT type_of_meal_plan As popular_meal_plan_among_guests,
       COUNT(*) AS meal
       FROM Hotel_Reservation
       GROUP BY type_of_meal_plan
       ORDER BY meal DESC
       LIMIT 1;


------Q.3. What is the average price per room for reservations involving children?


       SELECT 
       AVG(avg_price_per_room) AS avg_price_per_rooms
       FROM Hotel_Reservation
       WHERE no_of_children > 0;


------Q.4.How many reservations were made for the year 20XX (replace XX with the desired year)?
	   
      
	  SELECT COUNT(*) AS total_reservations_for_year_2017
      FROM Hotel_Reservation
      WHERE EXTRACT(YEAR FROM arrival_date) = 2017;



------Q.5. What is the most commonly booked room type?

       SELECT room_type_reserved, COUNT(*) AS total_count
   	   FROM Hotel_Reservation
	   GROUP BY room_type_reserved
  	   ORDER BY total_count DESC
	   LIMIT 1;



------Q.6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?

       SELECT  
	   COUNT(*) AS reservations_fall_on_weekend
       FROM Hotel_Reservation
	   WHERE no_of_weekend_nights > 0;



------Q.7. What is the highest and lowest lead time for reservations?

           SELECT 
	       MAX(lead_time) AS Highest_lead_time,
	       MIN(lead_time) AS lowest_lead_time
           FROM Hotel_Reservation;


-----Q.8. What is the most common market segment type for reservations?

       SELECT 
	   MAX(market_segment_type) AS most_common_segment
	   FROM Hotel_Reservation
	   GROUP BY market_segment_type
	   ORDER BY most_common_segment DESC
	   LIMIT 1;



-----Q.9. How many reservations have a booking status of "Confirmed"?

       SELECT
	   COUNT (*) AS Confirmed_bookings
	   FROM Hotel_Reservation
	   WHERE booking_status = 'Not_Canceled';


----Q.10. What is the total number of adults and children across all reservations?

         SELECT
	     SUM(no_of_adults) AS total_adults,
	     SUM(no_of_children) AS total_children
	     FROM Hotel_Reservation;


----Q.11. What is the average number of weekend nights for reservations involving children?

       SELECT
	   ROUND(AVG(no_of_weekend_nights), 2) AS average_weekend_nights
	   FROM Hotel_Reservation
	   WHERE no_of_children > 0;



----Q.12. How many reservations were made in each month of the year?


          SELECT 
	      EXTRACT (YEAR FROM arrival_date) AS reservation_year,
	      EXTRACT (MONTH FROM arrival_date) AS reservation_month,
	      COUNT(booking_ID) AS reservations_in_each_month
	      FROM Hotel_Reservation
	      GROUP BY reservation_year, reservation_month
	      ORDER BY reservation_year, reservation_month ASC; 
	      




----Q.13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
     
	      SELECT room_type_reserved,
          Round (AVG(no_of_weekend_nights + no_of_week_nights),2) AS avgerage_no_of_nights
     	  FROM Hotel_Reservation
    	  GROUP BY room_type_reserved
    	  ORDER BY room_type_reserved ASC;



----Q.14. For reservations involving children, what is the most common room type,  and what is the average price for that room type?

      SELECT room_type_reserved AS most_common_room_type,
	  ROUND(AVG(avg_price_per_room), 2) AS average_prices
      FROM Hotel_Reservation
      WHERE no_of_children > 0
      GROUP BY room_type_reserved
      ORDER BY room_type_reserved
      LIMIT 1;



----Q.15. Find the market segment type that generates the highest average price per room.

          SELECT
	      market_segment_type AS segment_type,
	      MAX(avg_price_per_room) AS highest_average_price_per_room
	      FROM Hotel_Reservation
	      GROUP BY segment_type
	      ORDER BY highest_average_price_per_room DESC 
	      LIMIT 1;