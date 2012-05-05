--
-- Database: `splendia`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `bk_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `price` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  PRIMARY KEY (`bk_id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1001 ;

--
-- RELATIONS FOR TABLE `bookings`:
--   `room_id`
--       `rooms` -> `room_id`
--   `user_id`
--       `customers` -> `cs_id`
--

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bk_id`, `user_id`, `room_id`, `price`, `date`, `checkin_date`, `checkout_date`) VALUES
(1000, 1, 1234, 100, '2012-05-05 11:21:07', '2012-05-18', '2012-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `ccn` int(20) NOT NULL,
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cs_id`, `name`, `surname`, `email`, `password`, `ccn`) VALUES
(1, 'Fran', 'Alvarez', 'fjalvarez@gmail.com', '123456', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `Location` varchar(32) NOT NULL,
  `facilities` varchar(32) NOT NULL,
  `category` varchar(32) NOT NULL,
  `num_rooms` int(10) NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10002 ;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `name`, `Location`, `facilities`, `category`, `num_rooms`) VALUES
(10001, 'Hotel Splendia', 'Barcelona', 'All of them!', 'Hotel', 100);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `image` varchar(32) NOT NULL,
  `description` varchar(32) NOT NULL,
  `facilities` varchar(32) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1235 ;

--
-- RELATIONS FOR TABLE `rooms`:
--   `hotel_id`
--       `hotels` -> `hotel_id`
--

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `hotel_id`, `name`, `image`, `description`, `facilities`, `price`) VALUES
(1234, 10001, 'double room', 'image/double_room.jpg', 'The best in BCN !', 'All of them!', 100);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `customers` (`cs_id`),
  ADD CONSTRAINT `bookings_ibfk_6` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);