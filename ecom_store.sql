-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 10:44 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_campus` text NOT NULL,
  `admin_about` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_job` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_campus`, `admin_about`, `admin_contact`, `admin_job`) VALUES
(2, 'Arnold Ndoro', 'arnoldndoro0@gmail.com', '1234', 'IMG-20220623-WA0017.jpg', 'Mashava', '  22 years old developer', '+263 772 784 672', 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `boxes_section`
--

CREATE TABLE `boxes_section` (
  `box_id` int(10) NOT NULL,
  `box_title` text NOT NULL,
  `box_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boxes_section`
--

INSERT INTO `boxes_section` (`box_id`, `box_title`, `box_desc`) VALUES
(3, 'Mission', 'The Student Affairs Division’s mission is to provide students with a wide range of support services in order to facilitate their personal and educational growth and development.'),
(4, 'Student Affairs Vision', 'To provide an excellent student-centred campus environment.\r\n\r\n'),
(5, 'Motto', 'Shop smart, shop easy with GZU ecommerce. Discover a world of convenience, sustainability, and affordability at your fingertips.');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`p_id`, `ip_add`, `qty`, `p_price`, `size`) VALUES
(28, '::1', 1, '10', 'Medium'),
(29, '::1', 1, '30', 'Medium'),
(31, '::1', 1, '20', 'Small'),
(32, '::1', 1, '15', 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_top` text NOT NULL,
  `cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(1, 'Man', 'yes', 'men.jpg'),
(2, 'Women', 'yes', 'women.jpg'),
(3, 'All', 'no', 'Captre.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_price` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_limit` int(100) NOT NULL,
  `coupon_used` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_campus` text NOT NULL,
  `customer_res` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_campus`, `customer_res`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`) VALUES
(13, 'MR CHIBIDI', 'MR@CHIBIDI', '1234', 'Mashava', '', '0717990020', 'E7.2', 'Capture.PNG', '::1'),
(25, 'M263076', 'godf@gmail.com', '1234', 'Mashava Campus', 'In-res', '0772784672', 'A2.1', '27539992_795035367347528_7684036691683948510_n.jpg', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_date` date NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `size`, `order_date`, `order_status`) VALUES
(15, 13, 10, 1249597475, 1, 'Medium', '2023-06-18', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` int(10) NOT NULL,
  `manufacturer_title` text NOT NULL,
  `manufacturer_top` text NOT NULL,
  `manufacturer_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `manufacturer_title`, `manufacturer_top`, `manufacturer_image`) VALUES
(6, 'ADDIDAS', 'yes', 'addidas.jpg'),
(7, 'NIKE', 'yes', 'R.png'),
(8, 'PUMA', 'yes', 'R.jpg'),
(9, 'GUCCI', 'yes', 'brands-gucci-21mk2ez.png'),
(10, 'DIOR', 'yes', 'OIP.jpg'),
(11, 'LUIS VUITTON', 'yes', 'download.jpg'),
(12, 'SAMSUNG', 'yes', 'OIP (1).jpg'),
(14, 'GZU', 'yes', 'Capture.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(13, 1249597475, 10, 'Ecocash', 97567, 4633, '2023-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `size`, `order_status`) VALUES
(15, 13, 1249597475, '28', 1, 'Medium', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `manufacturer_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_url` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) DEFAULT NULL,
  `product_keywords` text NOT NULL,
  `product_desc` text NOT NULL,
  `product_features` text NOT NULL,
  `product_video` text NOT NULL,
  `product_label` text NOT NULL,
  `product_sale` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `p_cat_id`, `cat_id`, `manufacturer_id`, `date`, `product_title`, `product_url`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_keywords`, `product_desc`, `product_features`, `product_video`, `product_label`, `product_sale`) VALUES
(28, 2, 3, 14, '2023-06-18 14:32:22', 'Cup', 'cup-r', 'cup.PNG', 'cuup.PNG', 'cup.PNG', 10, 'cup', '<p>plastic stadium cup</p>', '<p>cup</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '                                    <p>not available for this product</p>\r\n<p> </p>\r\n<p> </p>                                ', 'new', 0),
(29, 1, 3, 6, '2023-06-18 14:33:59', 'HOOD JACKET', 'JACKET-URL', 'hood1.PNG', 'hood.PNG', 'hood1.PNG', 30, 'hood', '<p>Hood Jacket</p>\r\n<p>&nbsp;</p>', '<p>Hood</p>\r\n<p>&nbsp;</p>', '<p>Not available for this product</p>\r\n<p>&nbsp;</p>', 'new', 0),
(30, 1, 1, 7, '2023-06-18 14:39:19', 'Vest ', 'vest-url', 'VEST.PNG', 'VESRT.PNG', 'VEST.PNG', 15, 'vest', '<p>Vest&nbsp;</p>\r\n<p>&nbsp;</p>', '<p>vest</p>\r\n<p>&nbsp;</p>', '<p>not available for this product</p>\r\n<p>&nbsp;</p>', 'new', 0),
(31, 1, 3, 7, '2023-06-18 14:45:59', 'Transit Insulated Vest', 'a-url', 'aaa.PNG', 'aaaa.PNG', 'aaa.PNG', 20, 'vest', '<p>Whether you need some extra warmth, this lightweight vest is the perfect addition to any outfit. Whether you need some extra warmth at the office or while running errands on a chilly day</p>\r\n<p>&nbsp;</p>', '<p>vest</p>\r\n<p>&nbsp;</p>', '                                    <p>not available</p>\r\n<p> </p>                                ', 'new', 0),
(32, 1, 1, 8, '2023-06-18 14:49:27', 'T-SHIRT', 'shoes-g', 'CCJ.PNG', 'DD.PNG', 'CCJ.PNG', 15, 'shirt', '<p>Hanes famous Authentic design = ultimate comfort. Our favorite classic tee, the Hanes Authentic collection is great for any group. Available in a wide range of sizes with a comfortable fit, this product will meet the needs of your group at a price you&rsquo;ll love. Looking to screenprint this shirt?</p>\r\n<p>&nbsp;</p>', '<p>cool</p>\r\n<p>&nbsp;</p>', '<p>not available</p>\r\n<p>&nbsp;</p>', 'new', 0),
(33, 2, 3, 12, '2023-06-18 15:07:34', 'Bluetooth Headphones', 'cup-r', 'head.PNG', 'head.PNG', 'head.PNG', 15, 'headphones', '<p>Skullcandy Bluetooth over-ear headphones These headphones are built for comfort and amazing sound. With their sleek look and 12 hour playback time they are sure to be a crowd-pleaser.</p>\r\n<p>&nbsp;</p>', '<p>One Size&nbsp; Fit: 6.3\" H X 3.15\" W X 6.69\" D</p>\r\n<p>&nbsp;</p>', '<p>Not Available</p>\r\n<p>&nbsp;</p>', 'new', 0),
(34, 2, 3, 12, '2023-06-18 15:15:17', 'USB Flash Drive', 'cup-r', 'flash.PNG', 'flash.PNG', 'flash.PNG', 15, 'flash', '<p>This 8 GB thumb drive will impress any group! Perfect for schools or businesses, this flash drive easily stores and transports files whenever and wherever needed.</p>\r\n<p>&nbsp;</p>', '<p>Rotate USB Flash Drive</p>\r\n<p>&nbsp;</p>', '<p>not available</p>\r\n<p>&nbsp;</p>', 'new', 0),
(35, 1, 3, 9, '2023-06-18 15:18:02', 'Polo T-Shirt', 'cup-r', 'ddd.PNG', 'dddd.PNG', 'ddd.PNG', 10, 'shirt', '<p>Tshirt</p>\r\n<p>&nbsp;</p>', '<p>Tshirt</p>\r\n<p>&nbsp;</p>', '', 'new', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_top` text NOT NULL,
  `p_cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_top`, `p_cat_image`) VALUES
(1, 'Jackets', 'yes', 'jacket.jpg'),
(2, 'Accessories', 'no', 'acc.jpg'),
(3, 'Shoes', 'no', 'shoes.jpg'),
(4, 'Coats ', 'yes', 'coat.jpg'),
(5, 'T-Shirt', 'no', 'tshirt.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_url`) VALUES
(8, 'Slide Number 10', 'LOGH.PNG', 'http://localhost/m-dev-store/checkout.php'),
(9, 'Slide Number 11', 'LOGO.PNG', 'http://localhost/m-dev-store/shop.php'),
(13, 'Editing Slide 12', 'LOGOO.PNG', 'test.com'),
(14, 'Slide Number 14', 'LOHG.png', 'https://youtube.com/c/ARNOLD');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL,
  `term_title` varchar(100) NOT NULL,
  `term_link` varchar(100) NOT NULL,
  `term_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_title`, `term_link`, `term_desc`) VALUES
(9, 'Rules & Regulations', 'link_1', '<p>GZU IS ONLY ACCOUNTABLE FOR SALERS ONLINE</p>'),
(10, 'Promo & Regulations', 'link_2', '<p>BUY MORE AND GET COUPONS</p>'),
(11, 'Refund Condition Policy', 'link_3', '<p>NO REFUND&nbsp;</p>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `boxes_section`
--
ALTER TABLE `boxes_section`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`),
  ADD UNIQUE KEY `customer_email_2` (`customer_email`),
  ADD UNIQUE KEY `customer_email_3` (`customer_email`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `boxes_section`
--
ALTER TABLE `boxes_section`
  MODIFY `box_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
