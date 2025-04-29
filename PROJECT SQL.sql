CREATE DATABASE MARKET;
USE MARKET;

CREATE TABLE USER(
User_id INT NOT NULL UNIQUE,
Fname VARCHAR(250) NOT NULL,
Lname VARCHAR(250) NOT NULL,
Password VARCHAR(8) NOT NULL,
Email VARCHAR(50) NOT NULL UNIQUE,
Phone_no CHAR(10),
PRIMARY KEY(User_id));

CREATE TABLE CATEGORY(
Category_id INT NOT NULL UNIQUE,
Name VARCHAR(100) NOT NULL,
PRIMARY KEY (Category_id));

CREATE TABLE ITEM(
Item_id INT NOT NULL UNIQUE,
Seller_id INT NOT NULL,
Category_id INT NOT NULL,
Name VARCHAR(150) NOT NULL,
Description VARCHAR(300),
Status ENUM('Available','sold','NA') NOT NULL,
Posted_date DATE NOT NULL,
Price REAL NOT NULL,
PRIMARY KEY (Item_id),
FOREIGN KEY (Seller_id) REFERENCES USER(User_id),
FOREIGN KEY (Category_id) REFERENCES CATEGORY(Category_id));

CREATE TABLE TRANSACTION(
Trans_id INT NOT NULL UNIQUE,
Item_id INT NOT NULL,
Buyer_id INT NOT NULL,
Trans_date DATE NOT NULL,
Total_price REAL NOT NULL,
PRIMARY KEY(Trans_id),
FOREIGN KEY (Item_id) REFERENCES ITEM(Item_id),
FOREIGN KEY (Buyer_id) REFERENCES USER(User_id));

CREATE TABLE PAYMENT(
Payment_id INT NOT NULL UNIQUE,
Trans_id INT NOT NULL,
Method ENUM('credit card/debit card','cash','paypal' ) NOT NULL,
Status ENUM('completed','pending','failed','cancelled') NOT NULL,
PRIMARY KEY(Payment_id),
FOREIGN KEY(Trans_id) REFERENCES TRANSACTION(Trans_id));

CREATE TABLE MEETUP(
Transaction_id INT NOT NULL,
Location VARCHAR(100) NOT NULL,
Time DATETIME NOT NULL,
Status ENUM('Scheduled','completed','cancelled') NOT NULL,
PRIMARY KEY(Transaction_id,Location,Time),
FOREIGN KEY(Transaction_id) REFERENCES TRANSACTION(Trans_id));

CREATE TABLE MESSAGE(
Msg_id INT NOT NULL UNIQUE,
Seller_id INT NOT NULL,
Buyer_id INT NOT NULL,
Time DATETIME NOT NULL,
PRIMARY KEY(Msg_id),
FOREIGN KEY (Seller_id) REFERENCES USER(User_id),
FOREIGN KEY(Buyer_id) REFERENCES USER(User_id));

CREATE TABLE TEXT(
Msg_id INT NOT NULL,
Text VARCHAR(250),
PRIMARY KEY(Msg_id,Text),
FOREIGN KEY (Msg_id) REFERENCES MESSAGE(Msg_id));

CREATE TABLE TAGS(
Item_id INT NOT NULL,
Tag VARCHAR(50),
PRIMARY KEY(Item_id,Tag),
FOREIGN KEY (Item_id) REFERENCES ITEM (Item_id));

INSERT INTO USER(User_id,Fname,Lname,Password,Email,Phone_no) VALUES
(1,'John','Smith','js1998up','js@gmail.com','5734789867'),
(2, 'Emma', 'Johnson', 'ej2000dn', 'emma.j@gmail.com', '5734891234'),
(3, 'Michael', 'Brown', 'mb2001xy', 'michael.b@gmail.com', '5734567890'),
(4, 'Olivia', 'Jones', 'oj1999ab', 'olivia.j@gmail.com', '5734123456'),
(5, 'William', 'Taylor', 'wt2002cd', 'william.t@gmail.com', '5734987654'),
(6, 'Sophia', 'Miller', 'sm2003ef', 'sophia.m@gmail.com', '5734786543'),
(7, 'James', 'Davis', 'jd2000gh', 'james.d@gmail.com', '5734561234'),
(8, 'Isabella', 'Garcia', 'ig1997ij', 'isabella.g@gmail.com', '5734345678'),
(9, 'Benjamin', 'Martinez', 'bm2004kl', 'benjamin.m@gmail.com', '5734789012'),
(10, 'Mia', 'Hernandez', 'mh2002mn', 'mia.h@gmail.com', '5734567891'),
(11, 'Lucas', 'Lopez', 'll2001op', 'lucas.l@gmail.com', '5734234567'),
(12, 'Amelia', 'Gonzalez', 'ag2000qr', 'amelia.g@gmail.com', '5734890123'),
(13, 'Alexander', 'Wilson', 'aw1999st', 'alexander.w@gmail.com', '5734782345'),
(14, 'Charlotte', 'Anderson', 'ca1998uv', 'charlotte.a@gmail.com', '5734568901'),
(15, 'Ethan', 'Thomas', 'et1997wx', 'ethan.t@gmail.com', '5734237890'),
(16, 'Ava', 'Moore', 'am2003yz', 'ava.m@gmail.com', '5734981234'),
(17, 'Daniel', 'Jackson', 'dj2002ac', 'daniel.j@gmail.com', '5734348901'),
(18, 'Harper', 'Martin', 'hm2004bd', 'harper.m@gmail.com', '5734783456'),
(19, 'Logan', 'Lee', 'll1996ce', 'logan.l@gmail.com', '5734234569'),
(20, 'Ella', 'Perez', 'ep2001fg', 'ella.p@gmail.com', '5734561238');

INSERT INTO USER(User_id,Fname,Lname,Password,Email,Phone_no) VALUES
(21, 'Liam', 'King', 'lk1999xy', 'liam.k@gmail.com', '5734321987'),
(22, 'Noah', 'Scott', 'ns2000ab', 'noah.s@gmail.com', '5734456789'),
(23, 'Emma', 'Walker', 'ew2001cd', 'emma.w@gmail.com', '5734234567'),
(24, 'Olivia', 'Hall', 'oh2002ef', 'olivia.h@gmail.com', '5734567893'),
(25, 'Ava', 'Green', 'ag2003gh', 'ava.g@gmail.com', '5734345671'),
(26, 'Sophia', 'Carter', 'sc2004ij', 'sophia.c@gmail.com', '5734781234'),
(27, 'Charlotte', 'Mitchell', 'cm1997kl', 'charlotte.m@gmail.com', '5734123458'),
(28, 'Mia', 'Turner', 'mt1998mn', 'mia.t@gmail.com', '5734567899'),
(29, 'Amelia', 'Parker', 'ap1999op', 'amelia.p@gmail.com', '5734890127'),
(30, 'Isabella', 'Adams', 'ia2000qr', 'isabella.a@gmail.com', '5734782341'),
(31, 'Evelyn', 'Clark', 'ec2001st', 'evelyn.c@gmail.com', '5734234561'),
(32, 'Harper', 'Nelson', 'hn2002uv', 'harper.n@gmail.com', '5734456781'),
(33, 'Luna', 'Baker', 'lb2003wx', 'luna.b@gmail.com', '5734987658'),
(34, 'Ella', 'Harris', 'eh2004yz', 'ella.h@gmail.com', '5734345679'),
(35, 'Elijah', 'Roberts', 'er1996ac', 'elijah.r@gmail.com', '5734123459'),
(36, 'James', 'Phillips', 'jp1997bd', 'james.p@gmail.com', '5734567892'),
(37, 'Benjamin', 'Evans', 'be1998ce', 'benjamin.e@gmail.com', '5734782349'),
(38, 'Lucas', 'Young', 'ly1999df', 'lucas.y@gmail.com', '5734890124'),
(39, 'Henry', 'Rogers', 'hr2000eg', 'henry.r@gmail.com', '5734234562'),
(40, 'Alexander', 'Sanders', 'as2001fh', 'alexander.s@gmail.com', '5734987653');

INSERT INTO CATEGORY(Category_id,Name) VALUES
(1,'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home Appliances'),
(5, 'Furniture'),
(6, 'Sports Equipment'),
(7, 'Beauty & Personal Care'),
(8, 'Groceries'),
(9, 'Automotive'),
(10, 'Health & Wellness'),
(11, 'Jewelry'),
(12, 'Stationery & office supplies'),
(13, 'Pet Supplies'),
(14, 'Music Instruments'),
(15, 'Gaming'),
(16,'Dorm essentials'),
(17, 'Arts & Crafts'),
(18, 'Garden & Outdoor'),
(19, 'Travel Accessories'),
(20, 'Mobile Accessories'),
(21, 'Hobby & party Supplies'),
(22, 'Bags & Backpacks'),
(23, 'Decor & Posters'),
(24, 'Event Tickets');

INSERT INTO ITEM(Item_id,Seller_id,Category_id,Name,Description,Status,Posted_date,Price) VALUES
(1, 14, 20, 'iPhone 14 Case', 'Silicone case for iPhone 14, lightly used', 'sold', '2024-07-11', 15),
(2, 22, 1, 'Laptop - Dell Inspiron', 'Used Dell Inspiron 15, 256GB SSD', 'sold', '2024-07-15', 350),
(3, 18, 2, 'Winter Jacket', 'Men’s XL winter jacket, barely used', 'sold', '2024-07-21', 45),
(4, 11, 3, 'Textbook: Calculus', 'Calculus textbook for MATH 1500', 'sold', '2024-08-01', 60),
(5, 19, 4, 'Microwave', 'Compact microwave oven, perfect for dorms', 'Available', '2024-08-22', 50),
(6, 13, 5, 'Study Desk', 'Wooden study desk, 4ft by 2ft', 'sold', '2024-08-03', 80),
(7, 16, 6, 'Yoga Mat', 'Non-slip yoga mat, lightly used', 'sold', '2024-08-12', 10),
(8, 20, 7, 'Hair Dryer', 'Compact hair dryer, like new', 'sold', '2024-09-05', 20),
(9, 17, 8, 'Organic Honey', '500g jar of organic honey', 'Available', '2024-09-08', 12),
(10, 23, 9, 'Car Cover', 'Universal car cover for sedans', 'sold', '2024-09-10', 30),
(11, 15, 10, 'Dumbbells Set', '5kg pair of dumbbells', 'Available', '2024-09-15', 25),
(12, 12, 11, 'Silver Necklace', 'Elegant silver necklace with pendant', 'Available', '2024-09-25', 40),
(13, 18, 12, 'Notebook Set', 'Pack of 3 spiral notebooks, 120 pages each', 'Available', '2024-10-05', 8),
(14, 21, 13, 'Cat Food', '5lb bag of dry cat food', 'Available', '2024-10-09', 18),
(15, 19, 14, 'Guitar', 'Acoustic guitar, perfect for beginners', 'sold', '2024-10-12', 120),
(16, 11, 15, 'Gaming Chair', 'Ergonomic gaming chair, black and red', 'Available', '2024-10-18', 200),
(17, 14, 16, 'Bedside Lamp', 'Compact bedside lamp with USB port', 'sold', '2024-09-13', 25),
(18, 13, 17, 'Painting Supplies', 'Brush set and 12-color acrylic paints', 'Available', '2024-10-18', 15),
(19, 22, 18, 'Garden Hose', '25ft garden hose, lightweight and durable', 'sold', '2024-09-19', 10),
(20, 21, 19, 'Travel Pillow', 'Memory foam travel pillow', 'Available', '2024-10-05', 12),
(21, 20, 22, 'Laptop Backpack', 'Waterproof laptop backpack, fits 15.6” laptops', 'Available', '2024-10-11', 30),
(22, 17, 23, 'Wall Poster', 'Vintage movie poster, 24x36 inches', 'Available', '2024-11-01', 12),
(23, 18, 24, 'Concert Ticket', 'Ticket for summer music festival', 'sold', '2024-07-20', 75),
(24, 14, 16, 'Mini Fridge', 'Compact mini fridge, works perfectly', 'sold', '2024-08-06', 100),
(25, 13, 3, 'Novel: To Kill a Mockingbird', 'Classic novel, paperback edition', 'Available', '2024-11-11', 10);

INSERT INTO ITEM(Item_id, Seller_id, Category_id, Name, Description, Status, Posted_date, Price) VALUES
(26, 15, 1, 'Wireless Headphones', 'Brand new, over-ear wireless headphones', 'Available', '2024-11-01', 45),
(27, 18, 5, 'Office Chair', 'Ergonomic office chair, lightly used', 'Available', '2024-11-02', 150),
(28, 20, 18, 'Camping Lantern', 'Portable camping lantern, battery-operated', 'Available', '2024-11-03', 20);
DELETE FROM ITEM WHERE Item_id IN (26, 27, 28);
INSERT INTO TRANSACTION(Trans_id,Item_id,Buyer_id, Trans_date,Total_price) VALUES 
(1, 1, 25, '2024-07-15', 15), 
(2, 2, 28, '2024-07-20', 350),
(3, 3, 21, '2024-07-25', 45),  
(4, 4, 22, '2024-08-05', 60),  
(5, 6, 23, '2024-08-08', 80),  
(6, 7, 26, '2024-08-15', 10), 
(7, 8, 29, '2024-09-07', 20),  
(8, 10, 27, '2024-09-12', 30), 
(9, 15, 24, '2024-10-15', 120),
(10, 17, 30, '2024-09-15', 25),
(11, 19, 31, '2024-09-22', 10),
(12, 23, 35, '2024-07-25', 75),
(13, 24, 32, '2024-08-10', 100);

INSERT INTO TRANSACTION(Trans_id, Item_id, Buyer_id, Trans_date, Total_price) VALUES
(14, 25, 33, '2024-11-20', 45),  
(15, 26, 34, '2024-11-19', 150), 
(16, 27, 36, '2024-11-15', 20); 

DELETE FROM TRANSACTION WHERE Item_id IN (25); 

INSERT INTO PAYMENT(Payment_id,Trans_id,Method,Status) VALUES 
(1, 1, 'credit card/debit card', 'completed'), 
(2, 2, 'paypal', 'completed'),                
(3, 3, 'cash', 'completed'),                  
(4, 4, 'credit card/debit card', 'completed'),
(5, 5, 'paypal', 'completed'),                
(6, 6, 'cash', 'completed'),                  
(7, 7, 'credit card/debit card', 'completed'),
(8, 8, 'paypal', 'completed'),                  
(9, 9, 'credit card/debit card', 'completed'),   
(10, 10, 'cash', 'completed'),                
(11, 11, 'paypal', 'completed'),              
(12, 12, 'credit card/debit card', 'completed'), 
(13, 13, 'cash', 'completed');   

INSERT INTO MEETUP(Transaction_id, Location,Time,Status) VALUES 
(1, 'Mizzou Library', '2024-07-16 14:30:00', 'completed'), 
(2, 'Student Union Hall', '2024-07-21 10:00:00', 'completed'), 
(3, 'Dormitory A Common Room', '2024-07-26 17:00:00', 'completed'), 
(4, 'South Pavilion', '2024-08-06 15:00:00', 'completed'), 
(5, 'Campus Cafeteria', '2024-08-09 12:00:00', 'completed'), 
(6, 'Main Quad Area', '2024-08-16 09:00:00', 'completed'), 
(7, 'North Parking Lot', '2024-09-08 18:00:00', 'completed'), 
(8, 'Engineering Building Lobby', '2024-09-13 11:00:00', 'completed'), 
(9, 'Recreation Center', '2024-10-16 16:00:00', 'completed'), 
(10, 'Sports Arena Entrance', '2024-09-16 13:00:00', 'completed'), 
(11, 'Arts Building Lounge', '2024-09-23 14:30:00', 'completed'), 
(12, 'Bookstore Entrance', '2024-07-26 11:00:00', 'completed'), 
(13, 'Tech Hub Conference Room', '2024-08-11 10:00:00', 'completed');

INSERT INTO MESSAGE(Msg_id, Seller_id, Buyer_id, Time) VALUES
(1, 14, 25, '2024-07-15 10:00:00'),
(2, 14, 25, '2024-07-15 12:00:00'),
(3, 14, 25, '2024-07-15 13:30:00'),
(4, 19, 28, '2024-07-20 09:00:00'),
(5, 19, 28, '2024-07-20 11:30:00'),
(6, 19, 28, '2024-07-20 14:00:00'),
(7, 22, 21, '2024-07-25 08:00:00'),
(8, 22, 21, '2024-07-25 11:30:00'),
(9, 22, 21, '2024-07-25 16:00:00'),
(10, 26, 22, '2024-08-05 10:00:00'),
(11, 26, 22, '2024-08-05 12:00:00'),
(12, 26, 22, '2024-08-05 14:30:00'),
(13, 18, 23, '2024-08-08 08:30:00'),
(14, 18, 23, '2024-08-08 12:00:00'),
(15, 18, 23, '2024-08-08 15:30:00'),
(16, 11, 26, '2024-08-15 09:30:00'),
(17, 11, 26, '2024-08-15 11:00:00'),
(18, 11, 26, '2024-08-15 13:00:00'),
(19, 13, 29, '2024-09-07 10:30:00'),
(20, 13, 29, '2024-09-07 13:00:00'),
(21, 13, 29, '2024-09-07 15:00:00'),
(22, 15, 27, '2024-09-12 09:30:00'),
(23, 15, 27, '2024-09-12 11:30:00'),
(24, 15, 27, '2024-09-12 14:00:00');

INSERT INTO TEXT(Msg_id, Text) VALUES
(1, 'Hi, is the item still available?'),
(1, 'Yes, it is. Would you like to pick it up today?'),
(2, 'Sure, where can we meet?'),
(2, 'How about the library at 3 PM?'), 
(3, 'Sounds good. I’ll bring cash.'),
(3, 'Perfect. See you then.'),
(4, 'Is the condition of the item good?'),
(4, 'Yes, it’s barely used.'),
(5, 'Great. When are you available?'),
(5, 'I’m free this evening.'),
(6, 'Let’s meet at the coffee shop.'), 
(6, 'Works for me. Thanks!'),
(7, 'Can we meet tomorrow morning?'),
(7, 'Sure, I’m free after 10 AM.'),
(8, 'Let’s meet near the dorm.'), 
(8, 'Sounds good. I’ll text you when I’m there.'),
(9, 'Thanks for your help!'),
(9, 'No problem. See you soon.'),
(10, 'What’s the best time for you?'),
(10, 'I’m available in the afternoon.'),
(11, 'Let’s do 2 PM at the student union.'), 
(11, 'That works.'),
(12, 'Thanks for confirming!'),
(12, 'See you then.'),
(13, 'Can we meet at the cafeteria?'),
(13, 'Yes, that’s perfect.'), 
(14, 'What time works for you?'),
(14, 'How about 1 PM?'),
(15, 'Great. Looking forward to it.'),
(15, 'Thanks!'),
(16, 'Are you okay with cash payment?'),
(16, 'Yes, cash is fine.'),
(17, 'When can we meet?'),
(17, 'I’m available this morning.'),
(18, 'Let’s meet near the library.'), 
(18, 'See you there.'),
(19, 'Is the price negotiable?'),
(19, 'It’s already discounted, but I can give a small reduction.'),
(20, 'Thank you! I’ll confirm the location soon.'),
(20, 'Okay, take your time.'),
(21, 'Let’s meet at the gym lobby.'), 
(21, 'Sure. See you there.'),
(22, 'Can we finalize the meetup spot?'),
(22, 'Let’s do the parking lot near the cafeteria.'), 
(23, 'Works for me. What time?'),
(23, 'How about 10 AM?'),
(24, 'Perfect. See you there.'),
(24, 'Thanks!');

INSERT INTO TAGS(Item_id, Tag) VALUES
(1, 'Smartphone'),
(1, 'Apple'),
(5, 'Data Science'),
(5, 'Machine Learning'),
(5, 'Textbook'),
(7, 'Winter'),
(7, 'Jacket'),
(7, 'Warm'),
(12, 'Gaming Console'),
(12, 'Sony'),
(12, 'PS5'),
(15, 'Kitchen Appliance'),
(15, 'Coffee Maker'),
(15, 'Electric'),
(19, 'Furniture'),
(19, 'Desk'),
(19, 'Wooden'),
(20, 'Wireless'),
(20, 'Apple'),
(20, 'Bluetooth'),
(23, 'Poster'),
(23, 'Wall Decor'),
(23, 'Art'),
(25, 'Basketball'),
(25, 'Outdoor'),
(25, 'Sport');
USE MARKET;
SELECT*
FROM USER 
WHERE USER.Lname= "King";


