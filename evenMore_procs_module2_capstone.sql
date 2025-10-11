-- ====================================================================================================
-- Task 1: Create a new procedure called AddBooking to add a new table booking record.
-- This is the same as the last procedure in the previous lesson, except here they don't ask for the validation check. 
-- I pasted the previous procedure here since it would be superior to what is being asked for here.
-- I don't have table number in this table in my schema design, but I do include num_guests, which I deemed more important. 
-- ====================================================================================================

DROP PROCEDURE IF EXISTS add_valid_booking;
DELIMITER //
CREATE PROCEDURE add_valid_booking(IN customerID_input INT, IN date_input DATETIME, IN num_guests_input INT)
	BEGIN
		DECLARE conflict_count INT;
        START TRANSACTION;
        
        SELECT COUNT(booking_id) into conflict_count
        FROM bookings
        WHERE customer_id = customerID_input
        AND ABS(TIMESTAMPDIFF(SECOND, date_input, booking_time)) < 10800; -- ABS() deals with neg or pos (before or after)
        
        IF conflict_count > 0 THEN
        SELECT CONCAT("Customer with id ", customerID_input, " already has a booking within 3 hours of proposed time.") AS "Report:";
        ROLLBACK;
        ELSE 
        INSERT INTO bookings(customer_id, booking_time, num_guests)
        VALUES(customerID_input, date_input, num_guests_input);
        COMMIT;
        SELECT CONCAT("A booking has been made for customer with id ", customerID_input, " at ", TIME(date_input), " on ", DATE(date_input)) AS "Report:";
        END IF;
	END//
DELIMITER ;

-- ====================================================================================================
-- Task 2: Create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.
-- ====================================================================================================

DELIMITER //
CREATE PROCEDURE update_booking(IN bookingID_input INT, IN datetime_input DATETIME, IN numGuests_input INT)
	BEGIN
		DECLARE update_confirmation VARCHAR(255);
        UPDATE bookings
        SET booking_time = datetime_input, num_guests = numGuests_input
        WHERE booking_id = bookingID_input;        
        SET update_confirmation = CONCAT("Booking #", bookingID_input, " now has ", numGuests_input, " at ", datetime_input, ".");
        SELECT update_confirmation as "Update Status:";
	END//
DELIMITER ;

CALL update_booking(5, "2025-10-07 20:00:00", 8);
SELECT * FROM bookings
WHERE booking_id = 5;

-- ====================================================================================================
-- Task 3: Create a new procedure called CancelBooking that they can use to cancel or remove a booking.
-- ====================================================================================================
DROP PROCEDURE IF EXISTS cancel_booking;
DELIMITER //
CREATE PROCEDURE cancel_booking(IN bookingID_input INT)
	BEGIN
		DECLARE booking_exists INT;
        SELECT COUNT(booking_id) INTO booking_exists
        FROM bookings
        WHERE booking_id = bookingID_input;
		IF booking_exists > 0 THEN
			START TRANSACTION;
			DELETE FROM bookings
			WHERE booking_id = bookingID_input;
            SELECT CONCAT("Booking #", bookingID_input, " was deleted.") AS "Deletion success:";
			COMMIT;
        ELSE
			SELECT CONCAT("Booking #", bookingID_input, " not found.") AS "Deletion Failure:";
		END IF;
	END//
DELIMITER ;

CALL cancel_booking(35);
SELECT COUNT(booking_id) FROM bookings;
