-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 17, 2025 at 07:43 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `xenzkart`
--

-- --------------------------------------------------------

--
-- Table structure for table `xenzkart_admin`
--

CREATE TABLE IF NOT EXISTS `xenzkart_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `profile_image` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_time` datetime NOT NULL,
  `profile_updated_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('active','block') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1002 ;

--
-- Dumping data for table `xenzkart_admin`
--

INSERT INTO `xenzkart_admin` (`id`, `name`, `profile_image`, `email`, `mobile`, `address`, `password`, `register_time`, `profile_updated_time`, `status`) VALUES
(1001, 'admin', 'Profile pic_20250327_121142.jpg', 'admin@gmail.com', 918123571317, '#123 Main St, New York, NY 10001.', '21232f297a57a5a743894a0e4a801fc3', '2025-03-16 09:54:44', '2025-03-27 12:14:09', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `xenzkart_orders`
--

CREATE TABLE IF NOT EXISTS `xenzkart_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('cart','order placed','order confirmed','delivered','canceled') DEFAULT 'cart',
  `order_date` date DEFAULT '0000-00-00',
  `delivery_date` date DEFAULT '0000-00-00',
  PRIMARY KEY (`order_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `xenzkart_orders`
--

INSERT INTO `xenzkart_orders` (`order_id`, `buyer_id`, `product_id`, `quantity`, `product_price`, `total_price`, `status`, `order_date`, `delivery_date`) VALUES
(3, 1001, 113, 1, '72.80', '72.80', 'order confirmed', '2025-04-04', '2025-04-06'),
(4, 1001, 119, 7, '85.00', '595.00', 'canceled', '2025-04-04', '0000-00-00'),
(5, 1001, 102, 1, '82.99', '82.99', 'delivered', '2025-04-01', '2025-04-05'),
(8, 1001, 111, 3, '280.99', '842.97', 'delivered', '2025-04-04', '2025-04-06'),
(9, 1001, 138, 1, '720.00', '720.00', 'delivered', '2025-04-04', '2025-04-06'),
(10, 1002, 181, 2, '8999.00', '17998.00', 'delivered', '2025-04-04', '2025-04-06'),
(11, 1002, 112, 10, '142.99', '1429.90', 'delivered', '2025-04-04', '2025-04-07'),
(12, 1002, 114, 2, '92.80', '185.60', 'delivered', '2025-04-05', '2025-04-07'),
(13, 1002, 126, 9, '26.00', '234.00', 'order placed', '2025-04-05', '0000-00-00'),
(14, 1001, 170, 1, '20.99', '20.99', 'cart', '2025-04-05', '0000-00-00'),
(15, 1001, 166, 1, '50.00', '50.00', 'delivered', '2025-04-05', '2025-04-07'),
(16, 1001, 103, 3, '55.99', '167.97', 'delivered', '2025-04-05', '2025-04-10'),
(17, 1004, 102, 1, '82.99', '82.99', 'canceled', '2025-04-05', '0000-00-00'),
(18, 1004, 111, 1, '280.99', '280.99', 'cart', '2025-04-05', '0000-00-00'),
(19, 1001, 101, 3, '21.99', '65.97', 'delivered', '2025-04-08', '2025-04-10'),
(20, 1001, 110, 2, '50.00', '100.00', 'order placed', '2025-04-17', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `xenzkart_product`
--

CREATE TABLE IF NOT EXISTS `xenzkart_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `product_rating` decimal(2,1) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `created_at` date DEFAULT '0000-00-00',
  `updated_at` date DEFAULT '0000-00-00',
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=182 ;

--
-- Dumping data for table `xenzkart_product`
--

INSERT INTO `xenzkart_product` (`product_id`, `name`, `product_image`, `description`, `price`, `discount_price`, `product_rating`, `quantity`, `category`, `created_at`, `updated_at`, `status`) VALUES
(101, 'Wireless Mouse', 'Wireless Mouse.jpg', 'Ergonomic wireless mouse with a long battery life.', '25.99', '21.99', '4.3', 147, 'Electronics', '2023-01-15', '2023-01-15', 'active'),
(102, 'Bluetooth Headphones', 'Bluetooth Headphones.jpg', 'Noise-cancelling over-ear headphones.', '89.99', '82.99', '4.1', 75, 'Electronics', '2023-02-20', '2023-02-20', 'active'),
(103, 'Gaming Keyboard', 'Gaming Keyboard.jpg', 'RGB mechanical keyboard with customizable keys.', '59.99', '55.99', '4.1', 117, 'Electronics', '2023-03-05', '2025-04-04', 'active'),
(104, 'USB-C Hub', 'USB-C Hub.jpg', 'Multi-port USB-C hub for laptops.', '39.99', '36.99', '3.7', 200, 'Accessories', '2023-03-22', '2023-03-22', 'active'),
(105, 'Smartphone Stand', 'Smartphone Stand.jpg', 'Adjustable stand for smartphones and tablets.', '15.49', '10.99', '4.5', 180, 'Accessories', '2023-04-10', '2023-04-10', 'active'),
(106, 'Laptop Sleeve', 'Laptop Sleeve.jpg', 'Durable sleeve for 15-inch laptops.', '19.99', '17.99', '4.1', 90, 'Accessories', '2023-04-15', '2025-04-05', 'active'),
(107, 'Portable Charger', 'Portable Charger.jpg', 'Power bank with fast charging capabilities.', '35.00', '32.00', '3.0', 110, 'Electronics', '2023-05-01', '2023-05-01', 'active'),
(108, 'LED Desk Lamp', 'LED Desk Lamp.jpg', 'Adjustable LED lamp with multiple brightness settings.', '45.99', '40.99', '3.7', 80, 'Home & Office', '2023-05-15', '2023-05-15', 'active'),
(109, 'Wireless Charger', 'Wireless Charger.jpg', 'Qi wireless charger compatible with most smartphones.', '29.99', '26.99', '4.0', 140, 'Electronics', '2023-06-01', '2023-06-01', 'active'),
(110, 'Fitness Tracker', 'Fitness Tracker.jpg', 'Smart fitness watch with heart rate monitor.', '65.50', '50.00', '4.0', 60, 'Wearables', '2023-06-15', '2023-06-15', 'active'),
(111, 'Vacuum Cleaner', 'Vacuum Cleaner.jpg', 'Robotic vacuum cleaner with smart mapping.', '299.99', '280.99', '3.6', 40, 'Home Appliances', '2023-07-01', '2023-07-01', 'active'),
(112, 'Air Purifier', 'Air Purifier.jpg', 'Portable air purifier for cleaner air.', '149.99', '142.99', '4.1', 20, 'Home Appliances', '2023-07-10', '2023-07-10', 'active'),
(113, 'Instant Camera', 'Instant Camera.jpg', 'Polaroid-style instant camera.', '79.99', '72.80', '4.2', 55, 'Photography', '2023-07-20', '2023-07-20', 'active'),
(114, 'Smart Speaker', 'Smart Speaker.jpg', 'Voice-controlled smart speaker with Bluetooth.', '99.99', '92.80', '3.6', 65, 'Electronics', '2023-08-01', '2023-08-01', 'active'),
(115, 'Electric Kettle', 'Electric Kettle.jpg', 'Fast-boil electric kettle with auto shut-off.', '39.99', '35.00', '3.2', 70, 'Kitchen', '2023-08-15', '2023-08-15', 'active'),
(116, 'Cast Iron Skillet', 'Cast Iron Skillet.jpg', 'Durable skillet for all your cooking needs.', '49.99', '43.50', '4.3', 90, 'Kitchen', '2023-08-30', '2023-08-30', 'active'),
(117, 'Backpack', 'Backpack.jpg', 'Stylish backpack with multiple compartments.', '45.00', '40.00', '3.9', 110, 'Fashion', '2023-09-10', '2023-09-10', 'active'),
(118, 'Sunglasses', 'Sunglasses.jpg', 'Polarized sunglasses with UV protection.', '25.99', '22.99', '4.0', 130, 'Fashion', '2023-09-20', '2023-09-20', 'active'),
(119, 'Digital Watch', 'Digital Watch.jpg', 'Stylish digital watch with fitness tracking.', '89.99', '85.00', '3.7', 50, 'Wearables', '2023-10-01', '2023-10-01', 'active'),
(120, 'Coffee Maker', 'Coffee Maker.jpg', 'Automatic drip coffee maker.', '79.99', '75.00', '5.0', 40, 'Kitchen', '2023-10-05', '2023-10-05', 'active'),
(121, 'Blender', 'Blender.jpg', 'High-speed blender for smoothies and more.', '55.00', '50.00', '3.2', 60, 'Kitchen', '2023-10-10', '2023-10-10', 'active'),
(122, 'Portable Speaker', 'Portable Speaker.jpg', 'Compact Bluetooth speaker with great sound.', '39.99', '35.00', '3.6', 100, 'Electronics', '2023-10-15', '2023-10-15', 'active'),
(123, 'Wireless Earbuds', 'Wireless Earbuds.jpg', 'True wireless earbuds with noise cancellation.', '99.99', '95.00', '4.1', 80, 'Electronics', '2023-10-20', '2023-10-20', 'active'),
(124, 'Outdoor Grill', 'Outdoor Grill.jpg', 'Portable grill for outdoor cooking.', '199.99', '180.99', '3.7', 25, 'Outdoor', '2023-10-25', '2023-10-25', 'active'),
(125, 'Camping Tent', 'Camping Tent.jpg', 'Waterproof camping tent for 4 people.', '129.99', '121.00', '3.2', 35, 'Outdoor', '2023-11-01', '2023-11-01', 'active'),
(126, 'Yoga Mat', 'Yoga Mat.jpg', 'Non-slip yoga mat for comfort and stability.', '29.99', '26.00', '3.0', 150, 'Fitness', '2023-11-10', '2023-11-10', 'active'),
(127, 'Dumbbells', 'Dumbbells.jpg', 'Adjustable dumbbells for home workouts.', '89.99', '85.01', '3.2', 45, 'Fitness', '2023-11-15', '2023-11-15', 'active'),
(128, 'Pet Bed', 'Pet Bed.jpg', 'Comfortable bed for small to medium pets.', '35.00', '32.00', '2.7', 60, 'Pet Supplies', '2023-11-20', '2023-11-20', 'active'),
(129, 'Cat Litter Box', 'Cat Litter Box.jpg', 'Self-cleaning litter box for cats.', '149.99', '130.99', '3.1', 20, 'Pet Supplies', '2023-11-25', '2023-11-25', 'active'),
(130, 'Dog Leash', 'Dog Leash.jpg', 'Durable dog leash with ergonomic handle.', '15.99', '10.99', '2.1', 100, 'Pet Supplies', '2023-12-01', '2023-12-01', 'active'),
(131, 'Bicycle', 'Bicycle.jpg', 'Mountain bike with 21 gears.', '299.99', '288.50', '3.6', 30, 'Outdoor', '2023-12-05', '2023-12-05', 'active'),
(132, 'Running Shoes', 'Running Shoes.jpg', 'Lightweight running shoes for all terrains.', '69.99', '60.00', '3.0', 75, 'Fashion', '2023-12-10', '2023-12-10', 'active'),
(133, 'T-Shirt', 'T-Shirt.jpg', 'Cotton t-shirt available in various sizes.', '19.99', '17.00', '3.5', 200, 'Fashion', '2023-12-15', '2023-12-15', 'active'),
(134, 'Jeans', 'Jeans.jpg', 'Comfortable jeans with a slim fit.', '49.99', '46.90', '3.6', 100, 'Fashion', '2023-12-20', '2023-12-20', 'active'),
(135, 'Winter Jacket', 'Winter Jacket.jpg', 'Warm jacket for cold weather.', '129.99', '120.99', '4.6', 40, 'Fashion', '2023-12-25', '2023-12-25', 'active'),
(136, 'Smartphone', 'Smartphone.jpg', 'Latest model smartphone with advanced features.', '699.99', '650.99', '4.3', 25, 'Electronics', '2024-01-01', '2024-01-01', 'active'),
(137, 'Tablet', 'Tablet.jpg', '10-inch tablet with high resolution.', '299.99', '280.40', '4.0', 30, 'Electronics', '2024-01-05', '2024-01-05', 'active'),
(138, 'Electric Bike', 'Electric Bike.jpg', 'Eco-friendly electric bike.', '799.99', '720.00', '4.0', 15, 'Outdoor', '2024-01-15', '2024-01-15', 'active'),
(139, 'Air Fryer', 'Air Fryer.jpg', 'Healthy air fryer for low-fat cooking.', '89.99', '81.99', '3.7', 40, 'Kitchen', '2024-01-20', '2024-01-20', 'active'),
(140, 'Microwave Oven', 'Microwave Oven.jpg', 'Compact microwave oven with auto-cook features.', '129.99', '121.00', '3.2', 30, 'Kitchen', '2024-01-25', '2024-01-25', 'active'),
(141, 'Water Bottle', 'Water Bottle.jpg', 'Reusable stainless steel water bottle.', '19.99', '15.00', '3.5', 150, 'Fitness', '2024-02-01', '2024-02-01', 'active'),
(142, 'Folding Chair', 'Folding Chair.jpg', 'Portable folding chair for outdoor use.', '29.99', '25.00', '4.1', 80, 'Outdoor', '2024-02-05', '2024-02-05', 'active'),
(143, 'Portable Grill', 'Portable Grill.jpg', 'Compact propane grill for camping.', '89.99', '80.99', '3.5', 40, 'Outdoor', '2024-02-10', '2024-02-10', 'active'),
(144, 'Flashlight', 'Flashlight.jpg', 'LED flashlight with multiple brightness settings.', '15.99', '12.99', '3.1', 100, 'Outdoor', '2024-02-15', '2024-02-15', 'active'),
(145, 'Digital Camera', 'Digital Camera.jpg', 'High-resolution digital camera for photography.', '399.99', '355.99', '3.2', 25, 'Photography', '2024-02-20', '2024-02-20', 'active'),
(146, 'Tripod', 'Tripod.jpg', 'Adjustable tripod for cameras and smartphones.', '49.99', '45.99', '3.8', 60, 'Photography', '2024-02-25', '2024-02-25', 'active'),
(147, 'Drone', 'Drone.jpg', 'Camera drone with HD video capabilities.', '499.99', '470.99', '4.5', 15, 'Photography', '2024-03-01', '2024-03-01', 'active'),
(148, 'Wireless Router', 'Wireless Router.jpg', 'High-speed wireless router for home use.', '99.99', '91.45', '3.9', 50, 'Electronics', '2024-03-05', '2024-03-05', 'active'),
(149, 'Computer Monitor', 'Computer Monitor.jpg', '27-inch LED monitor with 4K resolution.', '299.99', '270.99', '4.3', 20, 'Electronics', '2024-03-10', '2024-03-10', 'active'),
(150, 'Gaming Console', 'Gaming Console.jpg', 'Latest gaming console with 4K support.', '499.99', '450.77', '4.6', 10, 'Electronics', '2024-03-15', '2024-03-15', 'active'),
(151, 'E-Reader', 'E-Reader.jpg', 'Lightweight e-reader with built-in light.', '129.99', '121.55', '3.5', 30, 'Electronics', '2024-03-20', '2024-03-20', 'active'),
(152, 'Electric Toothbrush', 'Electric Toothbrush.jpg', 'Smart electric toothbrush with pressure sensor.', '49.99', '42.55', '3.6', 70, 'Health', '2024-03-25', '2024-03-25', 'active'),
(153, 'Skincare Set', 'Skincare Set.jpg', 'Complete skincare set for all skin types.', '99.99', '92.66', '4.3', 45, 'Beauty', '2024-04-01', '2024-04-01', 'active'),
(154, 'Hair Dryer', 'Hair Dryer.jpg', 'Professional hair dryer with multiple heat settings.', '59.99', '52.55', '4.2', 55, 'Beauty', '2024-04-05', '2024-04-05', 'active'),
(155, 'Makeup Kit', 'Makeup Kit.jpg', 'Comprehensive makeup kit with essential tools.', '79.99', '72.99', '4.3', 35, 'Beauty', '2024-04-10', '2024-04-10', 'active'),
(156, 'Cookbook', 'Cookbook.jpg', 'Collection of recipes for home cooking.', '24.99', '18.99', '3.6', 150, 'Books', '2024-04-15', '2024-04-15', 'active'),
(157, 'Board Game', 'Board Game.jpg', 'Fun family board game for all ages.', '39.99', '33.77', '4.0', 90, 'Toys', '2024-04-20', '2024-04-20', 'active'),
(158, 'Puzzle', 'Puzzle.jpg', '1000-piece jigsaw puzzle for relaxing afternoons.', '19.99', '12.88', '3.5', 100, 'Toys', '2024-04-25', '2024-04-25', 'active'),
(159, 'Action Figure', 'Action Figure.jpg', 'Collectible action figure from popular movie.', '29.99', '24.99', '3.0', 75, 'Toys', '2024-04-30', '2024-04-30', 'active'),
(160, 'Plush Toy', 'Plush Toy.jpg', 'Soft plush toy for children.', '24.99', '19.99', '2.0', 120, 'Toys', '2024-05-05', '2024-05-05', 'active'),
(161, 'Electric Pressure Cooker', 'Electric Pressure Cooker.jpg', 'Multi-functional electric pressure cooker.', '89.99', '80.00', '3.2', 40, 'Kitchen', '2024-05-10', '2024-05-10', 'active'),
(162, 'Kitchen Scale', 'Kitchen Scale.jpg', 'Digital kitchen scale for precise measurements.', '25.99', '20.01', '3.0', 100, 'Kitchen', '2024-05-15', '2024-05-15', 'active'),
(163, 'Sous Vide Cooker', 'Sous Vide Cooker.jpg', 'Immersion circulator for sous vide cooking.', '129.99', '120.77', '2.0', 30, 'Kitchen', '2024-05-20', '2024-05-20', 'active'),
(164, 'Non-Stick Cookware Set', 'Non-Stick Cookware Set.jpg', 'Durable non-stick cookware set for everyday use.', '99.99', '85.00', '4.5', 50, 'Kitchen', '2024-05-25', '2024-05-25', 'active'),
(165, 'Food Processor', 'Food Processor.jpg', 'Versatile food processor for meal prep.', '179.99', '160.00', '2.7', 35, 'Kitchen', '2024-05-30', '2024-05-30', 'active'),
(166, 'Ice Cream Maker', 'Ice Cream Maker.jpg', 'Homemade ice cream maker with easy operation.', '59.99', '50.00', '2.5', 24, 'Kitchen', '2024-06-01', '2024-06-01', 'active'),
(167, 'Hand Mixer', 'Hand Mixer.jpg', 'Powerful hand mixer with multiple speed settings.', '39.99', '30.99', '3.8', 70, 'Kitchen', '2024-06-05', '2024-06-05', 'active'),
(168, 'Blender Bottle', 'Blender Bottle.jpg', 'Shaker bottle with a whisk ball for protein shakes.', '14.99', '10.50', '3.5', 150, 'Fitness', '2024-06-10', '2024-06-10', 'active'),
(169, 'Yoga Block', 'Yoga Block.jpg', 'Supportive foam block for yoga practice.', '19.99', '13.01', '3.0', 120, 'Fitness', '2024-06-15', '2024-06-15', 'active'),
(170, 'Resistance Bands', 'Resistance Bands.jpg', 'Set of resistance bands for strength training.', '29.99', '20.99', '2.1', 100, 'Fitness', '2024-06-20', '2024-06-20', 'active'),
(171, 'Fitness Mat', 'Fitness Mat.jpg', 'Thick mat for yoga and workouts.', '34.99', '26.99', '4.0', 90, 'Fitness', '2024-06-25', '2024-06-25', 'active'),
(172, 'Boxing Gloves', 'Boxing Gloves.jpg', 'Durable boxing gloves for training.', '49.99', '45.00', '2.7', 60, 'Fitness', '2024-07-01', '2024-07-01', 'active'),
(173, 'Swimming Goggles', 'Swimming Goggles.jpg', 'Anti-fog swimming goggles for comfort.', '19.99', '16.00', '2.0', 150, 'Sports', '2024-07-05', '2024-07-05', 'active'),
(174, 'Tennis Racket', 'Tennis Racket.jpg', 'Lightweight tennis racket for beginners.', '59.99', '55.00', '3.1', 40, 'Sports', '2024-07-10', '2024-07-10', 'active'),
(175, 'Soccer Ball', 'Soccer Ball.jpg', 'High-quality soccer ball for practice and games.', '24.99', '19.99', '2.1', 80, 'Sports', '2024-07-15', '2024-07-15', 'active'),
(176, 'Baseball Glove', 'Baseball Glove.jpg', 'Durable baseball glove for youth players.', '39.99', '34.99', '2.0', 70, 'Sports', '2024-07-20', '2024-07-20', 'active'),
(177, 'Hiking Backpack', 'Hiking Backpack.jpg', 'Lightweight backpack for hiking trips.', '89.99', '80.00', '3.2', 30, 'Outdoor', '2024-07-25', '2024-07-25', 'active'),
(178, 'Camping Stove', 'Camping Stove.jpg', 'Portable camping stove for outdoor cooking.', '49.99', '45.00', '3.7', 50, 'Outdoor', '2024-07-30', '2024-07-30', 'active'),
(179, 'Fishing Rod', 'Fishing Rod.jpg', 'Telescopic fishing rod for easy transport.', '39.99', '34.00', '2.6', 25, 'Outdoor', '2024-08-01', '2024-08-01', 'active'),
(180, 'Oppo a55', 'Oppo a55.jpg', 'general purpose mobile phone with snapdragon processor.', '19999.00', '18880.50', '4.6', 89, 'Electronics', '2024-11-06', '2024-11-06', 'active'),
(181, 'Realme C11 2021', 'Realme C11 2021.png', 'Feature display, Unisoc SC9863A chipset, 5000 mAh battery, 64 GB storage, 4 GB RAM.', '9999.00', '8999.00', '4.3', 100, 'Mobiles & Accessories', '2025-04-04', '2025-04-04', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `xenzkart_user`
--

CREATE TABLE IF NOT EXISTS `xenzkart_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `profile_image` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_time` datetime NOT NULL,
  `profile_updated_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('active','block') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1005 ;

--
-- Dumping data for table `xenzkart_user`
--

INSERT INTO `xenzkart_user` (`id`, `name`, `profile_image`, `email`, `mobile`, `address`, `password`, `register_time`, `profile_updated_time`, `status`) VALUES
(1001, 'Sandeepkumar S', 'Profile pic_20250324_051535.jpg', 'sandeep@gmail.com', 918123571317, '#909, Cypress St, Bengaluru, KA 560002', '00dcf16d903e5890aaba465b0b1ba51f', '2025-03-16 13:32:30', '2025-04-05 20:33:37', 'active'),
(1002, 'John', 'pic4_20250322_075536.jpg', 'john@gmail.com', 7985675464, '#372 Luz Ranch, Apt. 439, 98461, Boyleland, Nevada, United States.', '527bd5b5d689e2c32ae974c6229ff785', '2025-03-22 07:55:36', '0000-00-00 00:00:00', 'active'),
(1003, 'Jose', 'product_25_20250323_072503.jpg', 'jose@gmail.com', 9879875622, '#199 N.g.acharya Marg, Subhash Nagar,opp Bldg No 56, Chembur, Mumbai, Maharashtra, 400071', '662eaa47199461d01a623884080934ab', '2025-03-23 19:25:03', '0000-00-00 00:00:00', 'active'),
(1004, 'sita', 'product_23_20250405_080814.jpg', 'sita@gmail.com', 9875743542, '#2314, Lakshmi Naraian Street, Behind Imperial Cinema, Pahar Ganj', '803205ab3f1b9b6fa6990393f5ac6b58', '2025-04-05 20:08:16', '0000-00-00 00:00:00', 'active');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `xenzkart_orders`
--
ALTER TABLE `xenzkart_orders`
  ADD CONSTRAINT `xenzkart_orders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `xenzkart_user` (`id`),
  ADD CONSTRAINT `xenzkart_orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `xenzkart_product` (`product_id`);
