CREATE TABLE `brand` (
  `brand_id` int PRIMARY KEY AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL
);

CREATE TABLE `product_category` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `parent_category_id` int
);

CREATE TABLE `product` (
  `product_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `brand_id` int,
  `base_price` decimal(10,2) NOT NULL,
  `description` text,
  `category_id` int
);

CREATE TABLE `product_image` (
  `image_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(100)
);

CREATE TABLE `product_item` (
  `item_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `sku` varchar(50) UNIQUE NOT NULL,
  `stock_quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL
);

CREATE TABLE `color` (
  `color_id` int PRIMARY KEY AUTO_INCREMENT,
  `color_name` varchar(50) NOT NULL,
  `hex_code` varchar(7) NOT NULL
);

CREATE TABLE `size_category` (
  `size_category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL
);

CREATE TABLE `size_option` (
  `size_option_id` int PRIMARY KEY AUTO_INCREMENT,
  `size_name` varchar(50) NOT NULL,
  `size_category_id` int NOT NULL
);

CREATE TABLE `product_variation` (
  `variation_id` int PRIMARY KEY AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `color_id` int NOT NULL,
  `size_option_id` int NOT NULL
);

CREATE TABLE `attribute_category` (
  `attribute_category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL
);

CREATE TABLE `attribute_type` (
  `attribute_type_id` int PRIMARY KEY AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `attribute_category_id` int
);

CREATE TABLE `product_attribute` (
  `attribute_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `attribute_type_id` int NOT NULL,
  `value` varchar(255)
);

ALTER TABLE `product_category` ADD FOREIGN KEY (`parent_category_id`) REFERENCES `product_category` (`category_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`);

ALTER TABLE `product_image` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `product_item` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `size_option` ADD FOREIGN KEY (`size_category_id`) REFERENCES `size_category` (`size_category_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`item_id`) REFERENCES `product_item` (`item_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`size_option_id`) REFERENCES `size_option` (`size_option_id`);

ALTER TABLE `attribute_type` ADD FOREIGN KEY (`attribute_category_id`) REFERENCES `attribute_category` (`attribute_category_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`attribute_type_id`);
