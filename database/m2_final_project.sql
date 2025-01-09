-- database m2_final_project
BEGIN TRANSACTION;
-- *************************************************************************************************
-- Drop all db objects in the proper order
-- *************************************************************************************************
DROP TABLE IF EXISTS item_order, users, orders, item CASCADE;
-- ********************************************************************
-- Create the tables and constraints
-- *************************************************************************************************

--users (name is pluralized because 'user' is a SQL keyword)
CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

--orders

CREATE TABLE orders(
    id SERIAL,
    date_ordered date NULL,
    user_id SERIAL NOT NULL,
    isCompleted boolean NOT NULL DEFAULT false,
    CONSTRAINT PK_order PRIMARY KEY(id),
    CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES users(user_id)
    );



CREATE TABLE item(
    id SERIAL UNIQUE,
    name varchar(100) NOT NULL,
    description varchar(10000) NULL,
    price decimal(8,2)NOT NULL,
    image_url varchar(500) NULL
);

--item_order

CREATE TABLE item_order (
    item_id SERIAL NOT NULL,
    order_id SERIAL NOT NULL,
    quantity integer NULL,
    CONSTRAINT PK_item_order PRIMARY KEY(item_id, order_id),
    CONSTRAINT FK_item_order_order FOREIGN KEY(order_id) REFERENCES orders(id),
    CONSTRAINT FK_item_order_item FOREIGN KEY(item_id) REFERENCES item(id)
);

-- *************************************************************************************************
-- Insert some sample starting data
-- *************************************************************************************************

-- Users
-- Password for all users is password
INSERT INTO
    users (username, password_hash, role)
VALUES
    ('user', '$2a$10$tmxuYYg1f5T0eXsTPlq/V.DJUKmRHyFbJ.o.liI1T35TFbjs2xiem','ROLE_USER'),
    ('zach', '$2a$10$tmxuYYg1f5T0eXsTPlq/V.DJUKmRHyFbJ.o.liI1T35TFbjs2xiem','ROLE_USER'),
    ('admin','$2a$10$tmxuYYg1f5T0eXsTPlq/V.DJUKmRHyFbJ.o.liI1T35TFbjs2xiem','ROLE_ADMIN');

INSERT INTO
    orders (date_ordered, user_id, isCompleted)
VALUES
    ('2024-07-24', '1', true),
    ('2024-07-24', '1', true),
    ('2024-07-24', '1', true),
    ('2024-07-24', '1', true),
    ('2024-07-24', '2', true),
    ('2024-07-24', '2', true);
INSERT INTO
    item (name, description, price, image_url)
VALUES
    ('Hat', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 2.99, 'src\assets\img\pexels-photo-1878821.jpg'),
    ('Shoes', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 7.99, 'src\assets\img\pexels-melvin-buezo-1253763-2529148.jpg'),
    ('Watch', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 30.99, 'src\assets\img\pexels-jatin-anand-33853-125779.jpg'),
    ('Big Stick', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 9999.99, 'src\assets\img\pexels-souvenirpixels-1578751.jpg'),
    ('Jar of Dirt', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 0.01, 'src\assets\img\pexels-hson-9128878.jpg'),
    ('A Book', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 49.99, 'src\assets\img\pexels-nitin-arya-386173-1029141.jpg'),
    ('Used Car', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 4999.99, 'src\assets\img\pexels-rachel-claire-4993067.jpg'),
    ('A Banana', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 2.99, 'src\assets\img\pexels-andreea-ch-371539-1166648.jpg'),
	('Hat', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 2.99, 'src\assets\img\pexels-photo-1878821.jpg'),
    ('Shoes', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 7.99, 'src\assets\img\pexels-melvin-buezo-1253763-2529148.jpg'),
    ('Watch', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 30.99, 'src\assets\img\pexels-jatin-anand-33853-125779.jpg'),
    ('Big Stick', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 9999.99, 'src\assets\img\pexels-souvenirpixels-1578751.jpg'),
    ('Jar of Dirt', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 0.01, 'src\assets\img\pexels-hson-9128878.jpg'),
    ('A Book', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 49.99, 'src\assets\img\pexels-nitin-arya-386173-1029141.jpg'),
    ('Used Car', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 4999.99, 'src\assets\img\pexels-rachel-claire-4993067.jpg'),
    ('A Banana', 'Lorem ipsum dolor sit amet. Non illo unde eos ipsa mollitia ea culpa consectetur. Ut maxime exercitationem sit voluptates dolor a laboriosam molestias ut exercitationem culpa qui suscipit consequatur ut labore alias. Et accusantium provident ab debitis ipsam aut modi odit in velit distinctio.', 2.99, 'src\assets\img\pexels-andreea-ch-371539-1166648.jpg');

INSERT INTO
    item_order(order_id, item_id, quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 1, 4),
    (2, 7, 1),
    (2, 4, 1),
    (3, 1, 99),
    (4, 1, 1),
    (4, 2, 1),
    (4, 3, 1),
    (4, 4, 1),
    (4, 5, 1),
    (4, 6, 1),
    (4, 7, 1),
    (4, 8, 1),
    (5, 7, 15),
    (6, 6, 3000);


COMMIT TRANSACTION;



