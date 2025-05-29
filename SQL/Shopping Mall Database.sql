DROP DATABASE IF EXISTS project;
CREATE DATABASE IF NOT EXISTS project;
USE project;

CREATE TABLE supplier (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(60) NOT NULL,
    phone_number BIGINT NOT NULL UNIQUE,
    email VARCHAR(60) NOT NULL UNIQUE,
    address VARCHAR(60) NOT NULL
)  AUTO_INCREMENT=100000;

CREATE TABLE Product (
    product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(60) NOT NULL,
    brand VARCHAR(60)NOT NULL,
    price NUMERIC(9 , 2 )NOT NULL,
    supplier_id BIGINT NOT NULL,
    CONSTRAINT supplied_by_whom FOREIGN KEY (supplier_id)
		REFERENCES supplier(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
)AUTO_INCREMENT=20001;

CREATE TABLE owners (
    owner_name VARCHAR(60) PRIMARY KEY,
    age SMALLINT NOT NULL,
    phone_number BIGINT NOT NULL UNIQUE,
    email VARCHAR(60) NOT NULL,
    address VARCHAR(60) NOT NULL,
    CONSTRAINT check_age CHECK (age between 18 and 80)
);
CREATE TABLE store (
    store_name VARCHAR(60) PRIMARY KEY,
    location VARCHAR(60) NOT NULL,
    ph_number BIGINT NOT NULL UNIQUE,
    owner_name VARCHAR(60) NOT NULL,
    category VARCHAR(60) NOT NULL,
    CONSTRAINT store_owned_by FOREIGN KEY (owner_name)
        REFERENCES owners (owner_name)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE food (
    food_name VARCHAR(60) PRIMARY KEY,
    price NUMERIC(9 , 2 ) NOT NULL
);
CREATE TABLE food_count (
    foodcount_name VARCHAR(60) PRIMARY KEY,
    location VARCHAR(60) NOT NULL,
    ph_number BIGINT NOT NULL UNIQUE,
    owner_name VARCHAR(60)NOT NULL,
    CONSTRAINT foodcount_owned_by FOREIGN KEY (owner_name)
        REFERENCES owners (owner_name)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE employee (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(60) NOT NULL,
    store_name VARCHAR(60) DEFAULT NULL,
    foodcount_name VARCHAR(60) DEFAULT NULL,
    position VARCHAR(60) NOT NULL,
    salary NUMERIC(9 , 2 ) NOT NULL DEFAULT 0.0,
    phone_number BIGINT NOT NULL UNIQUE,
    CONSTRAINT works_in_store FOREIGN KEY (store_name)
        REFERENCES store (store_name),
    CONSTRAINT works_in_foodcount FOREIGN KEY (foodcount_name)
        REFERENCES food_count (foodcount_name)
)  AUTO_INCREMENT=300000;
CREATE TABLE customer (
    customer_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    membership_id BIGINT DEFAULT NULL,
    customer_name VARCHAR(60),
    phone_number BIGINT,
    email VARCHAR(60),
    address VARCHAR(60),
    point SMALLINT DEFAULT 0,
    mbship_start_date DATE DEFAULT '2024-1-1',
    mbship_end_date DATE DEFAULT '2024-3-31',
    CONSTRAINT check_point CHECK (point<=999),
    CONSTRAINT mbship_period_check CHECK (DATEDIFF(mbship_start_date, mbship_end_date) <= 3)
)  AUTO_INCREMENT=400000;

CREATE TABLE sale (
    sale_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id BIGINT NOT NULL,
    store_name varchar(60) NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT bought_by FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
		ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT bought_from_store FOREIGN KEY (store_name)
        REFERENCES store (store_name)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT sold_item FOREIGN KEY (product_id)
        REFERENCES product (product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT check_countOfProduct CHECK (quantity>=1)
)AUTO_INCREMENT=100000;

CREATE TABLE food_sale (
    food_sale_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id BIGINT NOT NULL,
    foodcount_name VARCHAR(60) NOT NULL,
    food_name VARCHAR(60) NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT ate_by FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT cooked_in FOREIGN KEY (foodcount_name)
        REFERENCES food_count (foodcount_name)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT sold_food FOREIGN KEY (food_name)
        REFERENCES food (food_name)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT check_countOfFood CHECK(quantity>=1)
)AUTO_INCREMENT=200000;

CREATE TABLE store_supplement (
    store_supplement_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    supplier_id BIGINT NOT NULL,
    store VARCHAR(60) DEFAULT NULL,
    supplement_date DATE NOT NULL,
    total_amount NUMERIC(10 , 2 ) NOT NULL,
    CONSTRAINT product_supplement_by FOREIGN KEY (supplier_id)
        REFERENCES supplier (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT supplement_to_store FOREIGN KEY (store)
        REFERENCES store (store_name)
        ON DELETE CASCADE ON UPDATE CASCADE
)AUTO_INCREMENT=10000;

CREATE TABLE foodcount_supplement (
    supplement_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    supplier_id BIGINT NOT NULL,
    food_count VARCHAR(60) DEFAULT NULL,
    supplement_date DATE NOT NULL,
    total_amount NUMERIC(10 , 2 ) NOT NULL,
    CONSTRAINT food_supplement_by FOREIGN KEY (supplier_id)
        REFERENCES supplier (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
	 CONSTRAINT supplement_to_foodcount FOREIGN KEY (food_count)
		REFERENCES food_count (foodcount_name)
        ON DELETE CASCADE ON UPDATE CASCADE
)AUTO_INCREMENT=90000;

CREATE TABLE product_feedback (
    product_id BIGINT NOT NULL,
    rating SMALLINT NOT NULL,
    feedback_date DATE NOT NULL,
    CONSTRAINT feedback_to_product FOREIGN KEY (product_id)
        REFERENCES Product (product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT check_product_rating CHECK (rating BETWEEN 0 AND 10)
);

CREATE TABLE food_feedback (
    food_name VARCHAR(60) NOT NULL,
    rating SMALLINT NOT NULL,
    feedback_date DATE NOT NULL,
    CONSTRAINT feedback_to_food FOREIGN KEY (food_name)
        REFERENCES food (food_name)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT check_food_rating CHECK (rating BETWEEN 0 AND 10)
);


INSERT INTO supplier (supplier_name ,phone_number , email , address) VALUES 
("Khin Thet Mon",098888888888, "ktm@gmail.com", "Shwe Pyi Thar, Yangon"),
("Nov Nov Myat Noe",093333333333,"nnmn@gmail.com", "Hledan, Yangon"),
("Paing Linn Htite",098787878787,"plh@gmail.com", "Shwe Pyi Thar, Yangon"),
("Nyein Minn Tun",099393939393,"nmt@gmail.com","Hmaw Bi, Yangon"),
("Shun Lett Htay",094343434343,"slh@gmail.com", "Mingalardon, Yangon"),
("Ye Man Aung",095555555555,"yma@gmail.com", "North Dagon, Yangon"),
("Kaung Myat Htet",092222222222,"kmh@gmail.com","Pazundaung, Yangon"),
("Kyaw Linn Zan",099999999999,"klz@gmail.com","Shwe Pyi Thar, Yangon"),
("Thein Htet San",096666666666,"ths@gmail.com","Mingalardon, Yangon"),
("Hein Htet Soe",097777777777,"hhs@gmail.com", "Hledan, Yangon"),
("Ei Nanda Hlaing",094444444444,"endl@gmail.com","Hlaing, Yangon"),
("May Meloni",092323232323,"maloni@gmail.com","Myaynigone, Yangon"),
("Pyae Phyo Kyaw",094545454545,"ppk&gmail.com","Hledan, Yangon");

INSERT INTO product (product_name, brand, price, supplier_id) VALUES
("Pencil", "Pilot", 500.00, 100000),
("Pen", "Pilot", 500.00, 100000),
("T-Shirt", "Nike", 45000.00, 100011),
("Jeans", "Levi's", 64000.00, 100011),
("Smartphone", "Samsung", 1135000.00, 100012),
("Laptop", "Dell", 2345000.00, 100012),
("Sofa", "IKEA", 1497000.00, 100002),
("Coffee Table", "AShley", 597000.00, 100002),
("Shampoo", "Pantene", 7600.00, 100010),
("ToothpASte", "Colgate", 3200.00, 100010),
("Bread", "Wonder", 2000.00, 100003),
("Milk", "Nestle", 2700.00, 100003),
("BASketball", "Spalding", 47000.00, 100004),
("Tennis Racket", "Wilson", 52000.00, 100004),
("Chess Set", "HASbro", 47500.00, 100005),
("LEGO Set", "LEGO", 25000.00, 100005),
("Yoga Mat", "Gucci", 60000.00, 100009),
("Vitamins", "Nature Made", 5000.00, 100009),
("Movie DVD", "Warner Bros.", 6000.00, 100008),
("Video Game", "Sony", 65400.00, 100008),
("Lipstick", "Maybelline", 15400.00, 100010),
("Sunscreen", "KoKo's", 17000.00, 100010),
("Notebook", "Moleskine", 7600.00, 100006),
("Backpack", "AdidAS", 60000.00, 100006),
("Running Shoes", "AdidAS", 94000.00, 100011),
("Dress Shirt", "Calvin Klein", 65400.00, 100011),
("Bluetooth Speaker", "LG", 500000.00, 100012),
("Wireless Headphones", "Sony", 45000.00, 100012),
("Curtains", "Pottery Barn", 190000.00, 100002),
("Throw Pillows", "Sweety Home", 25000.00, 100002),
("Conditioner", "Herbal Essences", 34000.00, 100010),
("Face WASh", "Navia", 11000.00, 100010),
("Energy Drink", "Speed", 700.00, 100003),
("Biscuit", "Oreo", 1200.00, 100003),
("Soccer Ball", "Nike", 40000.00, 100004),
("Golf Clubs Set", "Callaway", 500000.00, 100004),
("Board Game", "Monopoly", 54500.00, 100005),
("Barbie Toy", "Disney", 30000.00, 100005),
("Nutrition Powder", "Ovaltine", 14000.00, 100009),
("Yoga Mat", "Sweety Home", 43600.00, 100009),
("Energy Drink", "Shark", 1300.00, 100003);

INSERT INTO food VALUES
('Pizza',3500),
('Burger',3000),
('Salad',1800),
('PASta',4000),
('Steak',5500),
('Sushi',2500),
('Chicken Wings',4500),
('Tacos',1800),
('Fried Rice',2000),
('Sandwich',3000),
('Burrito',2500),
('Soup',1500),
('Fish and Chips',5000),
('LASagna',5500),
('Sushi Roll',2000),
('Hot Dog',1500),
('FajitAS',3500),
('Ramen',1200),
('Chicken Caesar Salad',1800),
('Mushroom Risotto',6000),
('BBQ Ribs',6500),
('Pad Thai',5500),
('Grilled Salmon',8000),
('Vegetable Stir Fry',2500),
('Quinoa Salad',3000),
('Beef Stroganoff',5500),
('Shrimp Scampi',5500),
('Eggplant Parmesan',4500),
('Cobb Salad',4000),
('Chili',2000),
('Lobster Roll',4500),
('Cesar Salad',3000),
('Gyros',2500),
('CarnitAS',4000),
('Nachos',1200),
('Hamburger',2000),
('Vegetable Soup',3000),
('Pho',3000),
('Calamri',3550),
('Egg Rolls',1500),
('Ceviche',3000),
('Falafel',1200),
('Pulled Pork Sandwich',1800),
('Philly Cheesesteak',3500),
('Crab Cakes',6500),
('Miso Soup',1500),
('SAShimi',8600),
('Meatloaf',6800),
('Stuffed Bell Peppers',4500),
('Fish Tacos',4000);

INSERT INTO owners (owner_name, age, phone_number, email, address) VALUES
('Moe Thiha', 35, 959876543210, 'moethiha@gmail.com', 'Shwe Pyi Thar, Yangon'),
('Kyaw Kyaw Win', 40, 959876543211, 'kyawkyawwin@gmail.com', 'Hledan, Yangon'),
('Nanda Oo', 38, 959876543212, 'nandaoo@gmail.com', 'Pazundaung, Yangon'),
('Thiri Nanda Aung', 42, 959876543213, 'thirinandaaung@gmail.com', 'Hlaing, Yangon'),
('Htet Htet Yin', 37, 959876543214, 'htethtetyin@gmail.com', 'Mingalardon, Yangon'),
('Eae Mon Thaw', 39, 959876543215, 'eaemonthaw@gmail.com', 'Bo Ta Htaung, Yangon'),
('Yoon Pyae Eain', 36, 959876543216, 'yoonpyaeeain@gmail.com', 'Myaynigone, Yangon'),
('Thin Yanant Phyo', 41, 959876543217, 'maungnaw@gmail.com', 'Shwe Pyi Thar, Yangon'),
('Aye Myat Noe', 45, 959876543218, 'maungkaw@gmail.com', 'Hledan, Yangon'),
('Aung Chan Myae', 33, 959876543219, 'maungnawmu@gmail.com', 'Haling Tharyar, Yangon'),
('Mg Naing', 34, 959876543220, 'maungshwenaw@gmail.com', 'Insein, Yangon'),
('Shwe La Thar', 43, 959876543221, 'shwelathar@gmail.com', 'Mingalardon, Yangon'),
('Nyan Linn Htet', 44, 959876543222, 'nyanlinnhtet@gmail.com', 'Pazundaung, Yangon'),
('Wai Linn Tun', 46, 959876543223, 'wailinntun@gmail.com', 'Bo Ta Htaung, Yangon'),
('Kyaw Thura', 47, 959876543224, 'kyawthura@gmail.com', 'Shwe Pyi Thar, Yangon'),
('Moe Yan Myint Lwin', 48, 959876543225, 'moeyanmyintlwin@gmail.com', 'Haling, Yangon'),
('Yi Yi Win', 49, 959876543226, 'yiyiwin@gmail.com', 'Hlaing Tharyar, Yangon'),
('Phyu Phyu Win', 50, 959876543227, 'phyuphyuwin@gmail.com', 'Shwe Pyi Thar, Yangon'),
('Khin Khin', 51, 959876543228, 'khinkhin@gmail.com', 'Myaynigone, Yangon'),
('Hein Minn Latt', 52, 959876543229, 'heinminnlatt@gmail.com', 'Pazundaung, Yangon'),
('Zwe Tayza', 53, 959876543230, 'zwetayza@gmail.com', 'Insein, Yangon'),
('May Waddy', 54, 959876543231, 'maywaddy@gmail.com', 'Insein, Yangon'),
('Sai Sai Zarni', 55, 959876543232, 'saisaizarni@gmail.com', 'Bo Ta Htaung, Yangon'),
('Arkar Tun', 56, 959876543233, 'arkartun@gmail.com', 'San Chaung, Yangon'),
('La Yeit Aye', 57, 959876543234, 'layeitaye@gmail.com', 'Myaynigone, Yangon'),
('Yu War', 58, 959876543235, 'yuwar@gmail.com', 'Shwe Pyi Thar, Yangon'),
('Yin Aye', 59, 959876543236, 'yinaye@gmail.com', 'Shwe Pyi Thar, Yangon'),
('Su Myat', 60, 959876543237, 'sumyat@gmail.com', 'Hlaing, Yangon');

INSERT INTO store (store_name, location, ph_number, owner_name) VALUES
('High-Style Deco', 'ground floor', 09123123123, 'Mg Naing', 'Home and Décor'), 
("Eldora`s Collections", '2nd floor', 092342342, 'Aye Myat Noe', 'Apparel and FAShion'), 
('BeatBoxz', '2nd floor', 093453453, 'Su Myat', 'Entertainment'), 
('PerformActive', 'ground floor', 09987256432, 'Nanda Oo', 'Sports and Outdoor Equipments'), 
('Pure-life Wellness', '1st floor', 097623157, 'Moe Yan Myint Lwin', 'Health and Wellness'), 
('Techeon', 'ground floor', 09456456456, 'Kyaw Thura', 'Electronics and Technology'), 
('Marvel Toys', '2nd floor', '09567567567', 'Yoon Pyae Eain', 'Toys and Games'), 
('The Bookshelf', 'ground floor', 09678678678, 'Yin Aye', 'Books and Stationery'), 
('Blissful Skin', '1st floor', 09789789789, 'Thiri Nanda Aung', 'Beauty and Personal Care'), 
('Heavenly House', '1st floor', 09890890890, 'Zwe Tayza', 'Home and Décor'), 
('Glamour Evolution', '2nd floor', 093123123, 'Arkar Tun', 'Beauty and Personal Care'), 
('Bluelight Stationary', '2nd floor', 09432432432, 'Eae Mon Thaw', 'Books and Stationery'), 
('Local Color Liquor', 'ground floor',  09543543543, 'Phyu Phyu Win', 'Food and Beverage'), 
('Chic & SASsy', '1st floor', 096546546, 'Shwe La Thar', 'Apparel and FAShion'), 
('GoPlay', '1st floor', 097657657, 'Sai Sai Zarni', 'Toys and Games'), 
('Urban Elegance', 'ground floor', 09876876876, 'Htet Htet Yin', 'Apparel and FAShion'), 
('Eccentric Electronics', '2nd floor', 099879879, 'Nyan Linn Htet', 'Electronics and Technology'), 
('Health Fit', 'ground floor', 09098098098, 'Yu War', 'Health and Wellness'),
('Youthful Elixir', 'ground floor', 09231231231, 'Yi Yi Win', 'Beauty and Personal Care'),
('Bookstore Novelties', '2nd floor', 093423423, 'Moe Thiha', 'Books and Stationery'),
('Family Mart', '1st floor', 094534534, 'Thin Yanant Phyo', 'Food and Beverage'),
('FAShion Fizz', '1st floor', 09564564564, 'Khin Khin', 'Apparel and FAShion'),
('VIAAL Active Wear', 'ground floor', 09675675675, 'Hein Minn Latt', 'Sports and Outdoor Equipments'),
('Skin Artistry', '2nd floor', 097867867, 'La Yeit Aye', 'Beauty and Personal Care'),
('PlayKid', '1st floor', 098978970, 'Aung Chan Myae', 'Toys and Games'),
('ClASsy Cottage', 'ground floor', 09908908908, 'Wai Linn Tun', 'Home and Décor'),
('StyleStanza', '2nd floor', 09132132132, 'May Waddy', 'Apparel and FAShion'),
('JukeBox Junction', '1st floor', 092432432, 'Kyaw Kyaw Win', 'Entertainment');

INSERT INTO food_count (foodcount_name, ph_number, owner_name, location) VALUES
('Lai Lai kitchen', 959876543217, 'Thin Yanant Phyo', '2nd floor'),
('Potato Corner', 959876545217, 'Thin Yanant Phyo', '2nd floor'),
("D'PENYETZ", 959876543214, 'Thin Yanant Phyo', '2nd floor'),
('Big Bowl', 959876543215, 'Thin Yanant Phyo', '2nd floor'),
('Du Du Mao Cia', 959877543217, 'Thin Yanant Phyo', '2nd floor'),
('Fresh Orange Chef', 959376543217, 'Thin Yanant Phyo', '2nd floor'),
('Iksan Korean food', 959776543217, 'Thin Yanant Phyo', '2nd floor'),
('Myeik Style', 959876543317, 'Thin Yanant Phyo', '2nd floor'),
('Seinn Seinn Burmese food', 959446543217, 'Thin Yanant Phyo', '2nd floor'),
('T.G.I', 959876555217, 'Thin Yanant Phyo', '2nd floor'),
('Thai Ser', 959866543227, 'Phyu Phyu Win', '2nd floor'),
('Pork & Sweet', 957776543227, 'Phyu Phyu Win', '2nd floor'),
('Food Cottage', 9595776543227, 'Phyu Phyu Win', '2nd floor'),
('Arr Mei', 959876543527, 'Phyu Phyu Win', '2nd floor'),
('Thar Li Swa', 959875543227, 'Phyu Phyu Win', '2nd floor'),
('The Spicy House', 958576543227, 'Phyu Phyu Win', '2nd floor'),
('V-Hangout', 959876592227, 'Phyu Phyu Win', '2nd floor'),
('Potato King', 959876544727, 'Phyu Phyu Win', '2nd floor'),
('The Tree Thai', 959895543227, 'Phyu Phyu Win', '2nd floor'),
('Juice', 959883543227, 'Phyu Phyu Win', '2nd floor');


INSERT INTO employee(ID, employee_name, store_name, position, salary, phone_number) VALUES
(11000, 'Aung Aung', 'High-Style Deco', 'Customer Service Representative', 350000, 09123456789),
(11001, 'Ei Thae Wai', "Eldora`s Collections", 'ASsistant Store Manager', 400000, 09132546987),
(11002, 'Hnin Thuzar Khaing', 'BeatBoxz', 'ASsistant Store Manager', 400000, 09123645987),
(11003, 'Min Khant Si Thu', 'PerformActive', 'Store Manager', 400000, 09123789456),
(11004, 'Khaing Thazin Htet', 'Pure-life Wellness', 'Personal Trainer', 350000, 09123765984),
(11005, 'Thiha Maung Maung', 'Techeon', 'Tech Consultant', 400000, 09154236789),
(11006, 'Tin Than Moe', 'Marvel Toys', 'Toy Specialist', 400000, 09142678456),
(11007, 'San San Tin', 'The Bookshelf', 'Book Seller', 250000, 09142666456),
(11008, 'Thin Thin Cho', 'Blissful Skin', 'Marketing Manager', 450000, 09123456788),
(11009, 'Ye Htet Paing', 'Heavenly House', 'Furniture Sales ASsociate', 500000, 09123456978),
(11010, 'Htet Shwe Zin', 'Glamour Evolution', 'Sales Representative', 350000, 09123456977),
(11011, 'Khin Cho Win', 'Bluelight Stationary', 'CAShier', 250000, 09123456987),
(11012, 'Thu Htoo Aung', 'Local Color Liquor', 'Manager', 450000, 09123456986),
(11013, 'Chaw Yadanar Oo', 'GoPlay', 'Retail Store Manager', 400000, 09123456998),
(11014, 'A Nadi Phyo', 'Chic & SASsy', 'Brand Manager', 450000, 09123456999),
(11015, 'Ei Mon Zin', 'Urban Elegance', 'Sales Manager', 400000, 09123456677),
(11016, 'Htet Wai Aung', 'Eccentric Electronics', 'Electronic Sales ASsociate', 350000, 09123456678),
(11017, 'Htun Yadanar Oo', 'Health Fit', 'Sales Manager', 300000, 09123456679),
(11018, 'Thu Thu', 'Youthful Elixir', 'Retail Store Manager', 450000, 09123456699),
(11019, 'Thin Thin Myat', 'Bookstore Novelties', 'Store Manager', 450000, 09123456698),
(11020, 'Thant Zin Aung', 'Family Mart', 'Kitchen Manager', 500000, 09123456798),
(11021, 'Khin Pyae Sone Hnin', 'FAShion Fizz', 'Customer Service Manager', 350000, 09123454878),
(11022, 'Htet Wai Yan Soe', 'VIAAL Active Wear', 'Sports and Equipment Manager', 450000, 09123457578),
(11023, 'Eaint Hmue Thwel', 'Skin Artistry', 'Facial Specialist', 350000, 09123456777),
(11024, 'Si Thu', 'PlayKid', 'Account Manager', 400000, 09123456787),
(11025, 'Zaw Ye Htet', 'ClASsy Cottage', 'CAShier', 250000, 09123458787),
(11026, 'Hsu Pyae Yati', 'StyleStanza', 'Store Manager', 450000, 09123458788),
(11027, 'Phone Min Khant', 'JukeBox Junction', 'Manager', 400000, 09123458778),
(11028, 'Thu Thu Wint Aung', 'BeatBoxz', 'CAShier', 250000, 09123456778),
(11029, 'Toe Naing', 'Family Mart', 'Food and Beverage Manager', 300000, 09123453459),
(11030, 'Thin Phyo', 'FAShion Fizz', 'FAShion Designer', 400000, 09123456689),
(11031, 'Hsu Yadanar', 'Skin Artistry', 'Makeup Artist', 350000, 09123456688),
(11032, 'Kaung Kaung', 'Techeon', 'Technology ASsistant', 350000, 09123456338),
(11033, 'Kaung Myat Pyae Sone', 'High-Style Deco', 'Marketing Director', 500000, 091236478695),
(11034, 'Po Po', 'BeatBoxz', 'CAShier', 250000, 09123678495),
(11035, 'Kyawt Kyawt', 'The Bookshelf', 'Book Seller', 250000, 09123678478),
(11036, 'Thu Rain', 'Eccentric Electronics', 'CAShier', 300000, 093845786594),
(11037, 'Ko Pyae', 'PlayKid', 'Inventory Specialist', 400000, 09148654987),
(11038, 'Chit Po', 'Health Fit', 'CAShier', 250000, 09123957984),
(11039, 'Ko Latt', 'VIAAL Active Wear', 'Manager', 450000, 09123739569),
(11040, 'Ko Thu', 'ClASsy Cottage', 'CAShier', 250000, 09126557498);
INSERT INTO employee (ID, employee_name, foodcount_name, position, salary, phone_number) VALUES
(11041, 'Moe Satt Maung Maung', 'Arr Mei', 'Chef', 500000, 09123654987),
(11042, 'May Thu', 'Big Bowl', 'Chef', 500000, 09123876945),
(11043, 'Maung Maung', "D'PENYETZ", 'Chef', 500000, 09123765849),
(11044, 'Myat Mon Theint', 'Du Du Mao Cia', 'Chef', 500000, 09123768594),
(11045, 'La Pyae', 'Potato King', 'CAShier', 250000, 09123675894),
(11046, 'La Pyae Maung Maung', 'Potato Corner', 'Waiter', 250000, 09123897645),
(11047, 'May Myat Thu', 'Pork & Sweet', 'Waitress', 250000, 09123985467),
(11048, 'Chit Min Thu', 'Food Cottage', 'Waiter', 250000, 09123786594),
(11049, 'Saung Hnin Phyu', 'Juice', 'Waitress', 250000, 09123897548);

INSERT INTO customer(customer_name, phone_number, email, address) VALUES
('Swan',09765349821,'swam@gmail.com','Mayangone,Yangon'),
('Dar Dar',09798543230,'dardar@gmail.com','Mayangone,Yangon'),
('Yu Ri',0977890334,'yuri@gmail.com','Yan Kin,Yangon'),
('Eaint Chue',0970967541,'eaint@gmail.com','Lan Ma Thaw,Yangon'),
('Win Mar',0970988776,'winmar@gmail.com','Kamayut,Yangon'),
('Hlan',0978877669,'hlan@gmail.com','Kamayut,Yangon'),
('Htun Sa',0977799887,'htunsa@gmail.com','Insein,Yangon'),
('Kai',0972388754,'kai@gmail.com','Bo Ta Htaung,Yangon'),
('Myo Win',0973458765,'myowin@gmail.com','Pazuntaung,Yangon'),
('Aung Phone',0927809764,'aungphone@gmail.com','Su Lay,Yangon'),
('Juu',0970987890,'juu@gmail.com','Su Lay,Yangon'),
('Ei Phue',0974902092,'eiphue@gmail.com','Shwe Pyi Thar,Yangon'),
('Lamin',0977656890,'lamin@gmail.com','Hledan,Yangon'),
('Bell',0976789657,'bell@gmail.com','Tarmwe,Yangon'),
('Yamin',0976589062,'yamin@gmail.com','Tamine,Yangon'),
('Soe Myint',0970956712,'soemyint@gmail.com','Kamayut,Yangon'),
('Htal',0972896473,'htal@gmail.com','Kamayut,Yangon');
INSERT INTO customer(membership_id, customer_name, phone_number, email, address, point) VALUES
(2000100,'Yu Ji',0987234545,'yuji55@gmail.com','Insein,Yangon',100),
(2000101,'Aye Mya',0956784323,'ayemya@gmail.com','Mayangone,Yangon',200),
(2000102,'Lu Min',0979075344,'lumin@gmail.com','Yankin,Yangon',300),
(2000103,'Aung Paing',0998756754,'aungpaing@gmail.com','Tarmwe,Yangon',67),
(2000105,'Akari',0912908675,'akari@gmail.com','Bahan,Yangon',76),
(2000106,'Tarry',0978965432,'tarry@gmail.com','Shwe Pyi Thar,Yangon',90),
(2000107,'Almond',0979054328,'almond@gmail.com','Mawlamyine,Mon',34),
(2000110,'Wutt Hmone',0928098768,'wuthmone@gmail.com','Hlaing Tharyar,Yangon',80),
(2000111,'Cho Zin',0956478934,'chozin@gmail.com','Hlaing,Yangon',35),
(2000112,'Edward',0998786754,'edward@gmail.com','Shwe Pyi Thar,Yangon',47),
(2000113,'Nwe Nwe',0976589043,'nwenwe@gmail.com','San Chaung,Yangon',234),
(2000114,'Lay Pyay',0976585843,'laypyay@gmail.com','Bo Ta Htaung,Yangon',123),
(2000115,'Yuya',096585844,'yuya@gmail.com','Hledan,Yangon',345),
(2000118,'Su Lae',0976585849,'sulae@gmail.com','Pazundaung,Yangon',76),
(2000119,'Zuu Pyae',0975648963,'zuupyae@gmail.com','Tamine,Yangon',102),
(2000120,'Mya Thet',0970425367,'myathet@gmail.com','Mingalardon,Yangon',98),
(2000121,'Shwe Pyae',0976539487,'shwepyae@gmail.com','Hmaw Bi,Yangon',106),
(2000122,'Kaung Khant',0976589025,'kaungkhant@gmail.com','Dagon,Yangon',287),
(2000126,'Ei Sandar',0979304758,'eisander@gmail.com','Insein,Yangon',174),
(2000127,'Sumin',0920845749,'sumin@gmail.com','Mayangone,Yangon',65),
(2000128,'Lu Maw',0928936876,'lumaw@gmail.com','Tarmwe,Yangon',281),
(2000129,'Eaint Hmue',0998765430,'eainthmue@gmail.com','Hlaing,Yangon',36),
(2000133,'Thin Zaw',0923364758,'thinzaw@gmail.com','Hledan,Yangon',32),
(2000134,'Yoe Shin',0998768053,'yoeshin@gmail.com','Bo Ta Htaung,Yangon',34),
(2000135,'Su Myat',0970367421,'sumyat@gmail.com','Migalardon,Yangon',54),
(2000136,'May Thin',0973907581,'maythin@gmail.com','Shwe PyiThar,Yangon',35),
(2000138,'Kaung Nyan',0918790575,'kyaungnyan@gmail.com','Bahan,Yangon',38),
(2000140,'Tan Sin',0927655890,'tansin@gmail.com','San Chaung,Yangon',30),
(2000142,'Ngwe Sin',0997530756,'ngwesin@gmail.com','Pazundaung,Yangon',30),
(2000143,'Phyu Sin',0920956834,'phyusin@gmail.com','Insein,Yangon',39),
(2000144,'Thain Hlwar',0908547240,'thainhlwar@gmail.com','Tamine,Yangon',45),
(2000148,'Nadi',0908765432,'nadi@gmail.com','Shwe Pyi Thar,Yangon',54),
(2000149,'Ei Phyu',0923456987,'eiphyu@gmail.com','Yankin,Yangon',46);

INSERT INTO sale (sale_date, customer_id, store_name, product_id, quantity) VALUES 
('2024-01-01' , 400001, "Eldora`s Collections",20003,2),
('2024-01-01' , 400002 ,"Chic & SASsy"  , 20004  ,3  ),
('2024-01-02' , 400003 ,"Urban Elegance"  , 20025 ,2 ),
('2024-01-02' , 400004 ,"FAShion Fizz"  , 20026  ,1 ),
('2024-01-03' , 400005 , "Eldora`s Collections", 20003 ,3  ),
('2024-01-03' , 400006 , "Blissful Skin", 20009  ,2 ),
('2024-01-04' , 400007 ,"Glamour Evolution"  , 20010  ,1 ),
('2024-01-04' , 400000 ,"Youthful Elixir" , 20021  , 3),
('2024-01-05' , 400008 , "Skin Artistry" , 20022  ,2  ),
('2024-01-05' , 400009 ,"Blissful Skin" , 20031 ,3  ),
('2024-01-06' , 400010 ,"Glamour Evolution"  , 20032  , 2 ),
('2024-01-06' , 400011 , "The Bookshelf" , 20001 ,10 ),
('2024-01-07' , 400012 ,"Bluelight Stationary"  , 20002  ,10 ),
('2024-01-07' , 400013 , "Bookstore Novelties" , 20023  ,5 ),
('2024-01-08' , 400014,"The Bookshelf" , 20024  ,2  ),
('2024-01-08' , 400015 ,"Techeon" ,20005 ,1 ),
('2024-01-09' , 400016 ,"Techeon", 20006  ,1 ),
('2024-01-09' , 400017 ,"Eccentric Electronics" , 20027  ,3  ),
('2024-01-10' , 400018 ,"Eccentric Electronics", 20028  ,3 ),
('2024-01-10' , 400019 ,"BeatBoxz" ,20019  ,3 ),
('2024-01-11' , 400020 , "JukeBox Junction", 20020  ,2  ),
('2024-01-11' , 400021 ,"Local Color Liquor"  , 20011,3 ),
('2024-01-12' , 400022 ,"Family Mart" , 20012  , 3),
('2024-01-12' , 400023 , "Local Color Liquor" ,20033,5  ),
('2024-01-13' , 400024 , "Local Color Liquor" , 20034  ,4  ),
('2024-01-13' , 400025 ,"Family Mart" , 20041 ,3 ),
('2024-01-14' , 400026 ,"Pure-life Wellness"  , 20017  ,2 ),
('2024-01-14' , 400027 ,"Health Fit" , 20018,5  ),
('2024-01-15' , 400028 ,"Pure-life Wellness" , 20039  ,3 ),
('2024-01-15' , 400029, "Health Fit" , 20040  ,5  ),
('2024-01-16' , 400030 ,"High-Style Deco" , 20007,2 ),
('2024-01-16' , 400031 ,"Heavenly House", 20008 ,3 ),
('2024-01-17' , 400032 ,"ClASsy Cottage" , 20029 ,6 ),
('2024-01-17' , 400033 ,"High-Style Deco"  , 20030  ,5 ),
('2024-01-18' , 400034, "PerformActive"  , 20013  ,2 ),
('2024-01-18' , 400035 ,"VIAAL Active Wear"  , 20014  ,3 ),
('2024-01-19' , 400036 , "PerformActive" , 20035 ,2 ),
('2024-01-19' , 400037 ,"VIAAL Active Wear" , 20036  , 4 ),
('2024-01-20' , 400038 , "Marvel Toys" , 20015 ,1 ),
('2024-01-20' , 400039 , "GoPlay", 20016 ,3 ),
('2024-01-21' , 400040 , "PlayKid" , 20037  , 3 ),
('2024-01-21' , 400041 ,"Marvel Toys", 20038  ,2  ),
('2024-01-22' , 400042 ,"Blissful Skin" , 20031 ,3  ),
('2024-01-22' , 400043 , "Skin Artistry", 20022 ,2  ),
('2024-01-23' , 400044 , "Eldora`s Collections" , 20003 ,2 ),
('2024-01-23' , 400045 ,"Chic & SASsy" , 20004,3  ),
('2024-01-24' , 400046 ,"Urban Elegance" , 20025 ,2  ),
('2024-01-24' , 400047 ,"FAShion Fizz"  , 20026  ,1 ),
('2024-01-25' , 400048 ,"Eldora`s Collections" , 20003  ,3  ),
('2024-01-25' , 400049 , "Blissful Skin" , 20009 ,2  ),
('2024-01-26' , 400000 , "Glamour Evolution", 20010  ,1 ),
('2024-01-26' , 400001 ,"Youthful Elixir"  , 20021 ,3),
('2024-01-27' , 400002,"Skin Artistry"  , 20022  ,2  ),
('2024-01-27' , 400003 ,"Blissful Skin" , 20031 ,3  ),
('2024-01-28' , 400001 ,"Glamour Evolution" , 20032 , 2),
('2024-01-28' , 400007 ,"The Bookshelf" , 20001 ,10 ),
('2024-01-29' , 400005 , "Bluelight Stationary" , 20002  ,10 ),
('2024-01-29' , 400007 , "Bookstore Novelties" , 20023 ,5 ),
('2024-01-30' , 400049 ,"The Bookshelf", 20024 ,2  ),
('2024-01-30' , 400000 , "Techeon" ,20005,1 ),
('2024-01-31' , 400023, "Techeon", 20006  ,1 ),
('2024-01-31' , 400022 ,"Eccentric Electronics" , 20027 ,3  ),
('2024-02-01' , 400033 ,"Eccentric Electronics", 20028  ,3 ),
('2024-02-01' , 400045 ,"BeatBoxz" ,20019  ,3  ),
('2024-02-02' , 400040 ,"JukeBox Junction" , 20020,2  ),
('2024-02-02' , 400008 ,"Local Color Liquor" , 20011,3 ),
('2024-02-03' , 400007 ,"Family Mart" , 20012 , 3),
('2024-02-03' , 400033 ,"Local Color Liquor" ,20033,5  ),
('2024-02-04' , 400026,"Local Color Liquor"  , 20034 ,4  ),
('2024-02-04' , 400012 ,"Family Mart" , 20041 ,3 ),
('2024-02-05' , 400032 , "Pure-life Wellness", 20017 ,2 ),
('2024-02-05' , 400046 ,"Health Fit"  , 20018 ,5 ),
('2024-02-06' , 400042 ,"Pure-life Wellness"  , 20039  ,3 ),
('2024-02-06' , 400044 , "Health Fit", 20040  ,5  ),
('2024-02-07' , 400045 ,"Pure-life Wellness" , 20039  ,3 ),
('2024-02-07' , 400034 ,"Health Fit" , 20040  ,5  ),
('2024-02-08' , 400031 ,"Heavenly House"  , 20008 ,3),
('2024-02-08' , 400033 ,"ClASsy Cottage", 20029 ,6 ),
('2024-02-09' , 400039 ,"High-Style Deco"  , 20030 ,5 ),
('2024-02-09' , 400036 ,"PerformActive"  , 20013 ,2 ),
('2024-02-10' , 400034 ,"VIAAL Active Wear"  , 20014 ,3 ),
('2024-02-10' , 400045 ,"PerformActive" , 20035,2 ),
('2024-02-11' , 400036 , "VIAAL Active Wear" , 20036 , 4),
('2024-02-11' , 400024 ,"Marvel Toys"  , 20015  ,1 ),
('2024-02-12' , 400027 ,"GoPlay"  , 20016 ,3  ),
('2024-02-12' , 400029 , "PlayKid" , 20037  , 3 ),
('2024-02-13' , 400021 ,"Marvel Toys", 20038  ,2  ),
('2024-02-13' , 400023 ,"Eldora`s Collections"  , 20003,2 ),
('2024-02-14' , 400026 ,"Chic & SASsy"  , 20004,3  ),
('2024-02-14' , 400022 ,"Urban Elegance"  , 20025,2 ),
('2024-02-15' , 400021 ,"FAShion Fizz"  , 20026 ,1),
('2024-02-15' , 400021 ,"Eldora`s Collections" , 20003  ,3  ),
('2024-02-16' , 400030, "Blissful Skin" , 20009 ,2 ),
('2024-02-16' , 400043 , "Glamour Evolution" , 20010 ,1 ),
('2024-02-17' , 400049 , "Youthful Elixir" , 20021  , 3),
('2024-02-17' , 400044 ,"Glamour Evolution"  , 20032  , 2 ),
('2024-02-18' , 400046 ,"The Bookshelf", 20001,10 ),
('2024-01-18' , 400047, "Bluelight Stationary" , 20002 ,10 ),
('2024-01-19' , 400044,"Bookstore Novelties", 20023  ,5 ),
('2024-01-19' , 400037 , "Eldora`s Collections" , 20003 ,2 );

INSERT INTO store_supplement (supplier_id, store, supplement_date, total_amount) VALUES
(100000, 'High-Style Deco', '2024-02-13', 150000.00),
(100001, "Eldora`s Collections", '2024-02-14', 160000.00),
(100002, 'BeatBoxz', '2024-02-15', 170000.00),
(100003, 'PerformActive', '2024-02-16', 180000.00),
(100004, 'Pure-life Wellness', '2024-02-17', 190000.00),
(100005, 'Techeon', '2024-02-18', 200000.00),
(100006, 'Marvel Toys', '2024-02-19', 210000.00),
(100007, 'The Bookshelf', '2024-02-20', 220000.00),
(100008, 'Blissful Skin', '2024-02-21', 230000.00),
(100009, 'Heavenly House', '2024-02-22', 240000.00),
(100010, 'Glamour Evolution', '2024-02-23', 250000.00),
(100011, 'Bluelight Stationary', '2024-02-24', 260000.00),
(100012, 'Local Color Liquor', '2024-02-25', 270000.00),
(100012, 'Chic & SASsy', '2024-02-26', 280000.00),
(100011, 'GoPlay', '2024-02-27', 290000.00),
(100010, 'Urban Elegance', '2024-02-28', 300000.00),
(100009, 'Eccentric Electronics', '2024-02-29', 310000.00),
(100008, 'Health Fit', '2024-01-01', 320000.00),
(100007, 'Youthful Elixir', '2024-01-02', 330000.00),
(100006, 'Bookstore Novelties', '2024-01-03', 340000.00),
(100005, 'Family Mart', '2024-01-04', 350000.00),
(100004, 'FAShion Fizz', '2024-01-05', 360000.00),
(100003, 'VIAAL Active Wear', '2024-01-06', 370000.00),
(100002, 'Skin Artistry', '2024-01-07', 380000.00),
(100001, 'PlayKid', '2024-01-08', 390000.00),
(100000, 'ClASsy Cottage', '2024-01-09', 400000.00),
(100001, 'StyleStanza', '2024-01-10', 410000.00),
(100002, 'JukeBox Junction', '2024-01-11', 420000.00);

INSERT INTO foodcount_supplement (supplier_id, food_count, supplement_date, total_amount) VALUES
(100003, 'Arr Mei', '2024-01-05', 360000.00),
(100004, 'Big Bowl', '2024-01-06', 370000.00),
(100005, "D'PENYETZ", '2024-01-07', 380000.00),
(100006, 'Du Du Mao Cia', '2024-01-08', 390000.00),
(100007, 'Food Cottage', '2024-01-09', 400000.00),
(100008, 'Fresh Orange Chef', '2024-01-10', 410000.00),
(100009, 'Iksan Korean food', '2024-01-11', 420000.00),
(100010, 'Lai Lai kitchen', '2024-01-12', 430000.00),
(100011, 'Myeik Style', '2024-01-13', 440000.00),
(100012, 'Pork & Sweet', '2024-01-14', 450000.00),
(100011, 'Potato Corner', '2024-01-15', 460000.00),
(100010, 'Potato King', '2024-01-16', 470000.00),
(100009, 'Seinn Seinn Burmese food', '2024-01-17', 480000.00),
(100008, 'T.G.I', '2024-01-18', 490000.00),
(100007, 'Thai Ser', '2024-01-19', 500000.00),
(100006, 'Thar Li Swa', '2024-01-20', 510000.00),
(100005, 'The Spicy House', '2024-01-21', 520000.00),
(100004, 'The Tree Thai', '2024-01-22', 530000.00),
(100003, 'V-Hangout', '2024-01-23', 540000.00),
(100002, 'The Tree Thai', '2024-01-24', 230000.00);


INSERT INTO product_feedback(product_id,rating, feedback_date)VALUES
(20001,4,'2024-1-23'),
(20002,3,'2024-1-13'),
(20003,4,'2024-2-21'),
(20004,5,'2024-1-10'),
(20005,5,'2024-1-23'),
(20006,3,'2024-1-19'),
(20007,4,'2024-1-17'),
(20008,4,'2024-1-14'),
(20009,4,'2024-1-13'),
(20010,4,'2024-1-1'),
(20011,4,'2024-1-3'),
(20012,5,'2024-1-3'),
(20013,4,'2024-1-5'),
(20014,3,'2024-1-7'),
(20015,4,'2024-1-4'),
(20016,4,'2024-1-29'),
(20017,5,'2024-1-22'),
(20018,4,'2024-1-26'),
(20019,3,'2024-1-24'),
(20020,5,'2024-1-27'),
(20021,4,'2024-1-21'),
(20022,3,'2024-1-14'),
(20023,3,'2024-1-11'),
(20024,4,'2024-1-30'),
(20025,5,'2024-1-9'),
(20026,5,'2024-1-8'),
(20027,3,'2024-1-5'),
(20028,4,'2024-1-1'),
(20029,5,'2024-2-3'),
(20030,4,'2024-1-4'),
(20031,3,'2024-1-20'),
(20032,5,'2024-2-26'),
(20033,4,'2024-1-24'),
(20034,5,'2024-1-27'),
(20025,5,'2024-1-13'),
(20026,3,'2024-2-29'),
(20027,4,'2024-1-23'),
(20028,4,'2024-1-13'),
(20029,4,'2024-2-22'),
(20030,3,'2024-1-20'),
(20031,4,'2024-1-16'),
(20032,5,'2024-2-18'),
(20033,4,'2024-1-12'),
(20034,3,'2024-1-15'),
(20035,5,'2024-1-18'),
(20036,4,'2024-2-11'),
(20037,4,'2024-1-10'),
(20038,5,'2024-1-1'),
(20039,3,'2024-2-16'),
(20040,3,'2024-1-31'),
(20041,5,'2024-2-12');

INSERT INTO food_feedback(food_name,rating, feedback_date)VALUES
('BBQ Ribs',4,'2024-1-23'),
('Beef Stroganoff',3,'2024-1-13'),
('Burger',4,'2024-2-21'),
('Burrito',5,'2024-1-10'),
('Calamri',5,'2024-1-23'),
('CarnitAS',3,'2024-1-19'),
('Cesar Salad',4,'2024-1-17'),
('Cesar Salad',4,'2024-1-14'),
('Ceviche',4,'2024-1-13'),
('Chicken Caesar Salad',4,'2024-1-1'),
('Chicken Wings',4,'2024-1-3'),
('Chili',5,'2024-1-3'),
('Cobb Salad',4,'2024-1-5'),
('Crab Cakes',3,'2024-1-7'),
('Egg Rolls',4,'2024-1-4'),
('Eggplant Parmesan',4,'2024-1-29'),
('FajitAS',5,'2024-1-22'),
('Falafel',4,'2024-1-26'),
('Fish and Chips',3,'2024-1-24'),
('Fish Tacos',5,'2024-1-27'),
('Fried Rice',4,'2024-1-21'),
('Grilled Salmon',3,'2024-1-14'),
('Gyros',3,'2024-1-11'),
('Hamburger',4,'2024-1-30'),
('Hot Dog',5,'2024-1-9'),
('Nachos',5,'2024-1-8');

INSERT INTO food_sale (sale_date ,customer_id,food_name,foodcount_name,quantity) VALUES
('2024-03-01', 400000, 'Pizza', 'Potato Corner', 5),
('2024-03-02', 400001, 'Burger', 'Potato Corner', 6),
('2024-03-02', 400002, 'Salad', 'Lai Lai kitchen', 10),
('2024-03-04', 400003, 'PASta', 'Lai Lai kitchen', 5),
('2024-03-05', 400004, 'Steak', 'Big Bowl', 3),
('2024-03-06', 400005, 'Sushi', 'Fresh Orange Chef', 8),
('2024-03-06', 400006, 'Chicken Wings', 'Big Bowl', 10),
('2024-03-10', 400007, 'Tacos', "D'PENYETZ", 10), 
('2024-03-10', 400008, 'Fried Rice', 'Fresh Orange Chef',5),
('2024-03-10', 400009, 'Sandwich', "D'PENYETZ", 5),
('2024-03-11', 400010, 'Burrito', 'Du Du Mao Cia', 4),
('2024-03-12', 400011, 'Soup', 'Du Du Mao Cia',9),
('2024-03-15', 400012, 'Fish and Chips', 'Fresh Orange Chef', 8), 
('2024-03-15', 400013, 'LASagna', 'Iksan Korean food', 6),
('2024-03-16', 400014, 'Sushi Roll', 'Iksan Korean food', 10),
('2024-03-16', 400015, 'Hot Dog', 'Myeik Style', 10),
('2024-03-17', 400016, 'FajitAS', 'Myeik Style',  6),
('2024-03-19', 400017, 'Ramen', 'Seinn Seinn Burmese Food' , 20),
('2024-03-20', 400018, 'Chicken Caesar Salad', 'Seinn Seinn Burmese Food', 10), 
('2024-03-20', 400019, 'Mushroom Risotto', 'T.G.I', 15),
('2024-03-21', 400020, 'BBQ Ribs', 'T.G.I', 9),
('2024-03-22', 400021, 'Pad Thai', 'T.G.I',12),
('2024-03-25', 400022, 'Grilled Salmon', 'Thai Ser', 8),
('2024-03-27', 400023, 'Vegetable Stir Fry', 'Thai Ser', 5),
('2024-03-27', 400024, 'Quinoa Salad', 'Pork & Sweet', 25),
('2024-03-29', 400025, 'Beef Stroganoff', 'Pork & Sweet', 7),
('2024-03-30', 400026, 'Shrimp Scampi', 'Food Cottage', 30),
('2024-03-31', 400027, 'Eggplant Parmesan', 'Food Cottage', 21),
('2024-04-01', 400028, 'Cobb Salad', 'Arr Mei', 19),
('2024-04-01', 400029, 'Chili', 'Thar Li Swa', 8),
('2024-04-02', 400030, 'Lobster Roll', 'Thar Li Swa', 4),
('2024-04-04', 400031, 'Cesar Salad', 'The Spicy House', 33),
('2024-04-05', 400032, 'Gyros', 'The Spicy House', 12),
('2024-04-06', 400038, 'CarnitAS', 'V-Hangout', 6),
('2024-04-07', 400033, 'Nachos', 'V-Hangout', 10),
('2024-04-07', 400034, 'Hamburger', 'Potato King', 22),
('2024-04-07', 400035, 'Vegetable Soup', 'Potato King', 3),
('2024-04-09', 400036, 'Pho', 'Potato King', 15),
('2024-04-10', 400037, 'Calamri', 'V-Hangout', 10), 
('2024-04-11', 400038, 'Egg Rolls', 'Thar Li Swa', 9),
('2024-04-12', 400039, 'Ceviche', 'Arr Mei', 14),
('2024-04-15', 400040, 'Falafel', 'Pork & Sweet', 25),
('2024-04-16', 400041, 'Pulled Pork Sandwich', 'Potato King', 5),
('2024-04-17', 400042, 'Philly Cheesesteak', 'The Spicy House', 7),
('2024-04-17', 400043, 'Crab Cakes', 'Thar Li Swa', 19),
('2024-04-18', 400044, 'Miso Soup', 'The Tree Thai', 6),
('2024-04-19', 400045, 'SAShimi', 'The Tree Thai', 16),
('2024-04-20', 400044, 'Meatloaf', 'Juice', 23),
('2024-04-21', 400033, 'Stuffed Bell Peppers', 'Juice', 7),
('2024-04-22', 400032, 'Fish Tacos', 'Juice', 14);

-- SELECT store_name FROM store WHERE category="Beauty and Personal Care";


SELECT food_name, SUM(quantity) AS Quantity 						 
 FROM food_sale_description WHERE MONTH(sale_date) BETWEEN 1 AND 4 GROUP BY food_name ORDER BY Quantity DESC LIMIT 3;


SELECT product_id, product_name, brand FROM product JOIN supplier ON supplier.ID=product.supplier_id WHERE supplier_name="Thein Htet San";


UPDATE customer AS c
INNER JOIN sale AS s USING(customer_id)
LEFT JOIN product AS p USING(product_id)
SET c.point = CASE
        WHEN p.price * s.quantity > 500000 AND c.point<250 THEN 250
        WHEN p.price * s.quantity > 1000000 AND c.point<500 THEN 500
        WHEN p.price * s.quantity > 2000000 AND c.point<750 THEN 750
        WHEN p.price * s.quantity > 5000000 AND c.point<999 THEN 999
        ELSE c.point
	END,
    c.mbship_start_date = s.sale_date,
    c.mbship_end_date = DATE_ADD(s.sale_date, INTERVAL 3 MONTH)
WHERE c.customer_id IS NOT NULL;



UPDATE customer SET point=0, mbship_end_date=NULL WHERE customer.mbship_end_date<CURRENT_DATE;


CREATE VIEW sale_description AS
(
	SELECT s.*, p.price, (s.quantity*p.price) AS total, c.point/100 AS discount,
		   (s.quantity*p.price-s.quantity*p.price*c.point/10000) AS cost
	FROM sale AS s JOIN product AS p USING(product_id) JOIN customer AS c USING(customer_id) ORDER BY cost DESC
);
CREATE VIEW food_sale_description AS 
(

	SELECT food_sale.*, price, (price*quantity) AS total,(point/100) AS discount, (price*quantity-price*quantity*point/10000) AS cost 
    FROM food_sale JOIN food USING (food_name) JOIN customer USING(customer_id) ORDER BY cost
);




SELECT store_name, SUM(cost) AS total_sales FROM sale_description 
	WHERE sale_date BETWEEN '2023-1-1' AND '2024-2-1' 
GROUP BY store_name ORDER BY total_sales DESC LIMIT 3;
SELECT foodcount_name, SUM(cost) AS total_sales 
FROM food_sale_description 
WHERE sale_date BETWEEN '2023-1-1' AND '2024-7-1' 
GROUP BY foodcount_name ORDER BY total_sales DESC LIMIT 3;



SELECT sale_description.product_id, product.product_name, 
    SUM(quantity) AS Quantity
FROM sale_description JOIN product using (product_id)
WHERE MONTH(sale_date) BETWEEN 1 AND 4 GROUP BY product_id ORDER BY Quantity DESC LIMIT 3;




SELECT sale_date, SUM(cost) AS total_sales 
FROM sale_description
WHERE MONTH(sale_date)=1 AND YEAR(sale_date)=2024 
GROUP BY sale_date ORDER BY total_sales DESC LIMIT 3;




SELECT 
sale_description.store_name, 
SUM(sale_description.cost) AS total_sales, 
SUM(store_supplement.total_amount) AS total_store_supplement, 
SUM(sale_description.cost) - SUM(store_supplement.total_amount) AS profit
FROM sale_description JOIN store_supplement 
ON sale_description.store_name = store_supplement.store
WHERE (MONTH(store_supplement.supplement_date) BETWEEN 1 AND 3)  AND (MONTH(sale_description.sale_date) BETWEEN 1 AND 3) 
	GROUP BY store_name
	ORDER BY profit DESC;
    
    drop view sale_description;
    drop view food_sale_description;




