-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 20, 2021 lúc 07:27 PM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `petshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `aID` int(50) NOT NULL,
  `aPassword` varchar(32) NOT NULL,
  `aUsername` varchar(30) NOT NULL,
  `aName` varchar(50) NOT NULL,
  `aPhonenumber` varchar(15) NOT NULL,
  `aAddress` varchar(255) NOT NULL,
  `aBirthday` date NOT NULL,
  `aEmail` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`aID`, `aPassword`, `aUsername`, `aName`, `aPhonenumber`, `aAddress`, `aBirthday`, `aEmail`, `status`) VALUES
(1, '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Admin', '0786997179', '600 Nguyen Van Cu, An Hoa, Ninh Kieu, Can Tho', '2001-06-09', 'caspian.huynh@gmail.com', 1),
(2, 'admin', 'admin2', 'Administrator', '0909785410', '66 Nguyen Trai, Hau Giang', '2019-08-01', 'admin@gmail.com', 2),
(3, '21232f297a57a5a743894a0e4a801fc3', 'admin3', 'Le Dao Thien Duc', '0703211458', '79 Vo Van Kiet', '2018-09-20', 'ducldt@gmail.com', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bID` int(50) NOT NULL,
  `cID` int(50) NOT NULL,
  `bStatus` varchar(200) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `bDate` date NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`bID`, `cID`, `bStatus`, `customerName`, `bDate`, `address`, `phone`, `note`, `total`) VALUES
(1, 2, 'New', 'Le Dao Thien Duc', '2021-07-02', '69 Dong Khoi', '0748454686', 'tra tien mat', 1200),
(2, 4, 'New', 'Ly Nguyen Hoang Phuc', '2021-07-01', '60 De Tham', '0780341213', 'rat dep trai', 4500),
(3, 5, 'New', 'Nguyen Tuong Thanh', '2021-07-17', '51/2 Hai Ba Trung', '0703252634', 'thanh toan sau', 850),
(4, 6, 'Delivered', 'Pham Minh Nhi', '2021-06-16', '100 Ngo Quyen', '0784447224', 'banking', 270),
(5, 7, 'Delivered', 'Tran Minh Nguyet', '2021-06-24', '59/30 XVNT', '0333278089', 'thanh toan momo', 1020),
(6, 8, 'New', 'Tran Thi Hong Mai', '2021-07-16', '77 Nguyen Trai', '0891646586', 'thanh toan shoppee', 460);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `bID` int(50) NOT NULL,
  `pId` int(50) NOT NULL,
  `quantity` int(100) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `billdetail`
--

INSERT INTO `billdetail` (`bID`, `pId`, `quantity`, `price`) VALUES
(1, 2, 1, 500),
(2, 4, 1, 500),
(3, 4, 19, 500),
(4, 3, 1, 270),
(5, 2, 1, 500),
(6, 2, 1, 400);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `brID` int(50) NOT NULL,
  `brName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`brID`, `brName`) VALUES
(1, 'Whiskas'),
(2, 'Pedigree'),
(3, 'SOS'),
(4, 'OEM'),
(5, 'NOURSE'),
(6, 'MIN'),
(7, 'SHIKKARI'),
(8, 'SmartHeart'),
(9, 'Me-O'),
(10, 'Ciao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `cmtID` int(50) NOT NULL,
  `pID` int(50) NOT NULL,
  `cID` int(50) NOT NULL,
  `cmtMessage` text NOT NULL,
  `cmtDate` datetime NOT NULL,
  `status` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `cID` int(50) NOT NULL,
  `cPassword` varchar(32) NOT NULL,
  `cUsername` varchar(30) NOT NULL,
  `cName` varchar(50) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `address` varchar(150) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` int(50) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`cID`, `cPassword`, `cUsername`, `cName`, `phonenumber`, `address`, `birthday`, `email`, `status`, `gender`) VALUES
(1, '3aa287237798e2cf40610a9f6e310931', 'hblong', 'Huynh Bao Long', '0786997179', '22 Vo Truong Toan', '2012-08-30', 'caspian.huynh@gmail.com', 1, 'Male'),
(2, '4573692e1e0e68f7c26244c792e70ed4', 'ldtduc', 'Le Dao Thien Duc', '0771289696', '233 Nguyen Van Linh, Hung Loi, Ninh Kieu, Can Tho', '2021-07-14', 'hnimneiht88@gmail.com', 1, 'Male'),
(3, '0d033b42741823c0729a37ce5234f57e', 'dhnhan', 'Doan Hieu Nhan', '0701412525', '76 Huynh Cuong', '2009-09-17', 'supportbuff101@gmail.com', 1, 'Male'),
(4, '6dd544e6b7ab3369a62d4c994362a3cc', 'lnhphuc', 'Ly Nguyen Hoang Phuc', '0771289843', '23 De Tham', '2008-08-29', 'muaquat123@gmail.com', 1, 'Male'),
(5, '893c3fd491f30b629fde7abe2ba1b516', 'ntthanh', 'Nguyen Tuong Thanh', '0786458745', '80 Vo Van Kiet', '2004-01-15', 'thanhnt@gmail.com', 1, 'Male'),
(6, '1492186e5e506530f7d995303422cd69', 'pmnhi', 'Pham Minh Nhi', '0771289213', '56 Mau than', '2000-04-15', 'nhipm@gmail.com', 1, 'Male'),
(7, '2188699f07adfdb23be2febd24e0b462', 'tmnguyet', 'Tran Minh Nguyet', '0701484664', '195 CMT8', '1994-11-16', 'tmnguyet@gmail.com', 1, 'Female'),
(8, '6db4ef0c498f805460d4db55d103c4de', 'tthmai', 'Tran Thi Hong Mai', '077154589', '45 Huynh Cuong', '1995-05-20', 'maitth@gmail.com', 1, 'Female');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `hID` int(50) NOT NULL,
  `aID` int(50) NOT NULL,
  `activity` text DEFAULT NULL,
  `hDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `imgID` int(50) NOT NULL,
  `pID` int(50) NOT NULL,
  `imageName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`imgID`, `pID`, `imageName`) VALUES
(1, 1, 'data\\\\wk1.jpg'),
(2, 1, 'data\\\\wk2.jpg'),
(3, 1, 'data\\\\wk3.jpg'),
(4, 1, 'data\\\\wk4.jpg'),
(5, 2, 'data\\\\w1.jpg'),
(6, 2, 'data\\\\w2.jpg'),
(7, 2, 'data\\\\w3.jpg'),
(8, 2, 'data\\\\w4.jpg'),
(9, 3, 'data\\\\hw1.jpg'),
(10, 3, 'data\\\\hw2.jpg'),
(11, 3, 'data\\\\hw3.jpg'),
(12, 3, 'data\\\\hw4.jpg'),
(13, 4, 'data\\\\hwk1.jpg'),
(14, 4, 'data\\\\hwk2.jpg'),
(15, 4, 'data\\\\hwk3.jpg'),
(16, 4, 'data\\\\hwk4.jpg'),
(17, 5, 'data\\\\p1.jpg'),
(18, 5, 'data\\\\p2.jpg'),
(19, 5, 'data\\\\p3.jpg'),
(20, 5, 'data\\\\p4.jpg'),
(21, 6, 'data\\\\pp1.jpg'),
(22, 6, 'data\\\\pp2.jpg'),
(23, 6, 'data\\\\pp3.jpg'),
(24, 6, 'data\\\\pp4.jpg'),
(25, 7, 'data\\\\j1.jpg'),
(26, 7, 'data\\\\j2.jpg'),
(27, 7, 'data\\\\j3.jpg'),
(28, 7, 'data\\\\j4.jpg'),
(29, 8, 'data\\\\x1.jpg'),
(30, 8, 'data\\\\x2.jpg'),
(31, 8, 'data\\\\x3.jpg'),
(32, 8, 'data\\\\x4.jpg'),
(33, 9, 'data\\\\b1.jpg'),
(34, 9, 'data\\\\b2.jpg'),
(35, 9, 'data\\\\b3.jpg'),
(36, 9, 'data\\\\b4.jpg'),
(37, 10, 'data\\\\bl1.jpg'),
(38, 10, 'data\\\\bl2.jpg'),
(39, 10, 'data\\\\bl3.jpg'),
(40, 10, 'data\\\\bl4.jpg'),
(41, 11, 'data\\\\c1.jpg'),
(42, 11, 'data\\\\c2.jpg'),
(43, 11, 'data\\\\c3.jpg'),
(44, 11, 'data\\\\c4.jpg'),
(45, 12, 'data\\\\cn1.jpg'),
(46, 12, 'data\\\\cn2.jpg'),
(47, 12, 'data\\\\cn3.jpg'),
(48, 12, 'data\\\\cn4.jpg'),
(49, 13, 'data\\\\cc1.jpg'),
(50, 13, 'data\\\\cc2.jpg'),
(51, 13, 'data\\\\cc3.jpg'),
(52, 13, 'data\\\\cc4.jpg'),
(53, 14, 'data\\\\cm1.jpg'),
(54, 14, 'data\\\\cm2.jpg'),
(55, 14, 'data\\\\cm3.jpg'),
(56, 14, 'data\\\\cm4.jpg'),
(57, 15, 'data\\\\nc1.jpg'),
(58, 15, 'data\\\\nc2.jpg'),
(59, 15, 'data\\\\nc3.jpg'),
(60, 15, 'data\\\\nc4.jpg'),
(61, 16, 'data\\\\nm1.jpg'),
(62, 16, 'data\\\\nm2.jpg'),
(63, 16, 'data\\\\nm3.jpg'),
(64, 16, 'data\\\\nm4.jpg'),
(65, 17, 'data\\\\s1.jpg'),
(66, 17, 'data\\\\s2.jpg'),
(67, 17, 'data\\\\s3.jpg'),
(68, 17, 'data\\\\s4.jpg'),
(69, 18, 'data\\\\sm1.jpg'),
(70, 18, 'data\\\\sm2.jpg'),
(71, 18, 'data\\\\sm3.jpg'),
(72, 18, 'data\\\\sm4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `pID` int(50) NOT NULL,
  `status` int(50) NOT NULL,
  `brID` int(50) NOT NULL,
  `tID` int(50) NOT NULL,
  `supID` int(50) NOT NULL,
  `pName` varchar(250) NOT NULL,
  `sellingPrice` double NOT NULL,
  `price` double NOT NULL,
  `describle` varchar(1000) NOT NULL,
  `pDate` datetime NOT NULL,
  `quantity` int(100) NOT NULL,
  `discount` float NOT NULL,
  `pettype` varchar(20) NOT NULL,
  `aID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`pID`, `status`, `brID`, `tID`, `supID`, `pName`, `sellingPrice`, `price`, `describle`, `pDate`, `quantity`, `discount`, `pettype`, `aID`) VALUES
(1, 1, 1, 1, 1, 'Whiskas Wet Food for Kitten 85gr', 8, 12, 'Complete and balanced nutrition, wet cat food recipe provides moisture and nourishment, gravy food format helps promote urinary tract health, helps provide cats with healthy eyesight, easy to eat and digest, can be given to baby cats as treat. Tempting aroma and flavour effective to attract fussy eaters, backed by research done by the Waltham centre for pet nutrition.', '2021-06-10 00:00:00', 100, 0, 'Cat', 1),
(2, 1, 1, 1, 1, 'Whiskas Wet Food for Adult Cat 85gr', 8, 12, 'Complete and balanced nutrition, wet cat food recipe provides moisture and nourishment, gravy food format helps promote urinary tract health, helps provide cats with healthy eyesight, easy to eat and digest, can be given to baby cats as treat. Tempting aroma and flavour effective to attract fussy eaters, backed by research done by the Waltham centre for pet nutrition.', '2021-06-10 00:00:00', 75, 0, 'Cat', 1),
(3, 1, 1, 1, 1, 'Whiskas Dry Cat Food for Adult Cat 1.1kg', 60, 75, '100 percent complete and balanced, made with high quality ingredients, our recipes are carefully prepared and made with quality ingredients that taste delicious.', '2021-06-10 00:00:00', 50, 1, 'Cat', 1),
(4, 1, 1, 1, 1, 'Whiskas Dry Food for Kitten 1.1kg', 65, 80, '100 percent complete and balanced, made with high quality ingredients, our recipes are carefully prepared and made with quality ingredients that taste delicious. Complete pet food for Kitten', '2021-06-10 00:00:00', 40, 0, 'Cat', 1),
(5, 1, 2, 1, 2, 'Pedigree Dog Dry Food - 1.5 kg', 70, 90, 'Complete & balanced dog food with the goodness of egg, a perfect food for adult dogs\r\nContains 22% crude Protein, 10% crude Fat, and 5% crude Fibre\r\nProvides strong muscles, bones & teeth and healthier & shinier coat\r\ndog food that also promotes Digestive Health and supports Natural Defences\r\nProvides dogs the 5 Signs of Good Health - a PEDIGREE assurance!\r\nDogs need 2x Calcium, 2.5x Iron & 9x Vitamin B12 than humans, an ideal treat\r\nDeveloped by experts at the Waltham Centre for Pet Nutrition\r\nIdeal for Pugs, Beagle to Labrador, Golden Retriever & German shepherd', '2021-04-14 00:00:00', 69, 1, 'Dog', 1),
(6, 1, 2, 1, 2, 'Pedigree Puppy Wet Dog Food - 85gr', 8, 13, 'Complete & balanced dog food, a perfect food for adult dogs\r\nMoist chicken chunks gently cooked in healthy gravy, retaining vitamins\r\ndog food with tempting aroma and flavour effective to attract fussy eaters\r\nHelps improve water content and reduces risk of stones\r\nCan be mixed with pedigree dry dog food or home cooked food, an ideal treat\r\nSee 5 signs of good health in just 6 weeks - a pedigree assurance!\r\nFormulated by research done by the Waltham Centre for Pet Nutrition\r\nIdeal for Pugs, Beagle to Labrador, Golden Retriever & German shepherd', '2021-04-14 00:00:00', 46, 0, 'Dog', 1),
(7, 1, 2, 1, 2, 'Pedigree Dog Treats Meat Jerky Stix - 1pc', 11, 16, 'A special delicious dog treat to share with your pet every day\r\nHas a soft chewy texture that does not damage their teeth\r\nHelps satisfy the dog’s natural instinct to chew\r\nMade with great tasting real meat, ideal as a festive treat for dogs\r\nA long-lasting dog snack to help keep dogs engaged and occupied\r\nFeed maximum 5 to 15 sticks a day, depending on dog\'s breed size.\r\nIdeal for Pugs, Beagle to Labrador, Golden Retriever & German shepherd', '2021-04-14 00:00:00', 29, 5, 'Dog', 1),
(8, 1, 2, 1, 1, 'Pedigree Dentastix - Oral Care Dog Treat, 2pc', 15, 20, 'Dental care Dog treats for your pet dog’s strong teeth\r\nClinically proven to reduce tartar build-up by up to 80%\r\nUnique x-shape & abrasive texture helps clean between teeth, ideal as a festive treat for dogs\r\ntreat containing active ingredients like Zinc Sulphate & Sodium Tripolyphosphate\r\nFormulated by research done by the Waltham Centre for Pet Nutrition\r\nAvailable for Small, Medium and Large dog breeds', '2021-06-10 00:00:00', 50, 4, 'Dog', 1),
(9, 1, 4, 2, 1, 'PSK PET MART Water Bottle', 10, 15, 'DURABLE & SAFE MATERIALS - Portable water travel bottle is made of the high quality food grade plastic. Antibacterial, Leak Proof. Enjoy outdoor act with your pet, to make sure your dog our friends forever.\r\nLEAK-PROOF, RECOVER UNUSED WATER - This travel drink bottleâ€s water key allows you to fill through with water and return the unused water back into the bottle. Dispenser is designed with silica gel seal ring which can prevent water leakage efficiently. Could put into the backpack will not get wet.\r\nBIG TROUGH & CONVENIENT - Water bottle is 3.0 inches wide with 2.76 inches big trough. It can hold max 12 fluid ounces (350 ml) of water. It not only ensures dog drinking water easily but also cat, rabbit or other small pet to drinking water easily. You can put this bottle into your pocket, backpack or hanging on your hand with sling rope.\r\nEASY TO CLEAN - Removable top of the outdoor dog bottle can be washed, easy dismantling and cleaning.\r\nQUICK TO USE - One-hand operation of the pupp', '2021-06-10 00:00:00', 30, 0, 'All', 1),
(10, 1, 4, 2, 2, 'PSK PET MART Astronaut Space Capsule Pet Carrier Breathable Travel Backpack', 180, 220, 'dopting environmentally-friendly PVC material which has good quality, is waterproof and resistant to dirty\r\nTransparent cover, the pet will not feel uncomfortable because of the dark space. One side of the backpack has a net pocket where you can place water pot or snacks, another side can be open to facilitate the pet out and in.\r\nComfortable strap, chest buckle design, the owner will not be uncomfortable to wear it during the travel. ', '2021-02-17 00:00:00', 12, 10, 'All', 1),
(11, 1, 6, 2, 1, 'Min Pet Litter Sand 6kg', 40, 55, 'Made from natural bentonite\r\nPowered with neem\r\nAbsorbs moisture quickly\r\n100% Natural product\r\nJasmine fragrance and fine granules - size (4 mm - 0.8 mm)', '2020-12-09 00:00:00', 44, 0, 'All', 1),
(12, 1, 7, 2, 2, 'Japan Pet Litter Sand 10kg', 48, 60, 'Has very high liquid absorption rate\r\nClumps quickly\r\nHas anti-odor properties\r\nBentonite Cat Litter\r\nScoopable', '2020-12-09 00:00:00', 28, 3, 'All', 1),
(13, 1, 4, 2, 1, 'Dog Cage - Multicolor and Multisize', 850, 980, 'Material: Enamelled Steel, Powder coated Black Paint\r\nProduct Weight (gm): 14500 (14.5 KG) ALWAYS ASK CAGE WEIGHT, WHEN COMPARED PRICE WITH OTHER.\r\nNOTICE: The price is attached with the smallest cage size, for bigger one, contact us via phone.\r\nWe have Black/Pink/Blue colors and the size depends on your dog\'s size (Contact us)', '2021-06-10 00:00:00', 15, 30, 'Dog', 1),
(14, 1, 4, 2, 2, 'Cat Cage - Multichoice of sizes and colors', 850, 980, 'Material: Enamelled Steel, Powder coated Black Paint\r\nProduct Weight (gm): 14500 (14.5 KG) ALWAYS ASK CAGE WEIGHT, WHEN COMPARED PRICE WITH OTHER.\r\nNOTICE: The price is attached with the smallest cage size, for bigger one, contact us via phone.\r\nWe have Black/Pink/Blue colors and the size depends on your cat\'s size (Contact us)', '2020-09-02 00:00:00', 11, 30, 'Cat', 1),
(15, 1, 5, 3, 1, 'NOURSE Vitamin for Dog', 159, 210, 'Enriched with Vitamins and Minerals this tablet supports growth and maintains healthy body\r\nIt promotes healthy joints and keeps your dog active\r\nEssential ingredients blended with other nutrients helps in speedy recovery from diseases\r\nAdministration of this dog supplement is easy hence pet parents of fussy eaters feel relaxed\r\nEssential ingredients blended with other nutrients helps in protecting the skin and coat of your dog.', '2021-06-10 00:00:00', 33, 10, 'Dog', 1),
(16, 1, 5, 3, 2, 'NOURSE Vitamin for Cat', 159, 210, 'Vitamins and amino acids supplementation for better health & vital functions of Cats\r\nAll important water soluble and fat soluble vitamins along with all essential amino acids Features & details.\r\nEssential amino acids helps in formation of muscles, hair, skin and enzymes. Also helps boost the immunity and improves overall health.\r\nEssential amino acids helps in formation of muscles, hair, skin and enzymes. Also helps boost the immunity and improves overall health.', '2020-12-09 00:00:00', 22, 10, 'Cat', 1),
(17, 1, 3, 4, 1, 'S.O.S - Dog Shampoo - 300ml', 35, 45, 'Shampoo has neem and green apple extracts.\r\nChoostix prevents the growth of ticks and fleas on your dog.\r\nThe conditioner helps to care for the skin and keep the coat smooth, soft and fluffy.', '2021-02-17 00:00:00', 12, 0, 'Dog', 1),
(18, 1, 3, 4, 1, 'S.O.S - Cat Shampoo - 300ml', 35, 45, 'Controls odour, Fresh, Fragrant.\r\nParaben Free\r\nEssential Oils & Natural Actives\r\nAnimal Cruelty-Free\r\nNo Nasty Chemicals', '2020-12-09 00:00:00', 32, 0, 'Cat', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `supID` int(50) NOT NULL,
  `supName` varchar(250) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`supID`, `supName`, `phone`, `address`, `email`) VALUES
(1, 'Pet Mart', '02923890155', '100 KCN Song Than', 'petmart_ncc@gmail.com'),
(2, 'SaigonPet', '02923830030', '600 Nguyen Van Troi', 'saigonpet@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `tID` int(50) NOT NULL,
  `tName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`tID`, `tName`) VALUES
(1, 'Pet Food'),
(2, 'Pet Appliances'),
(3, 'Pet Dietary Supplements'),
(4, 'Pet Grooming');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aID`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bID`);

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`bID`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brID`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cmtID`),
  ADD KEY `comment_ibfk_1` (`pID`),
  ADD KEY `comment_ibfk_2` (`cID`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cID`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`hID`),
  ADD KEY `history_ibfk_1` (`aID`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`imgID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `products_ibfk_1` (`brID`),
  ADD KEY `products_ibfk_2` (`supID`),
  ADD KEY `products_ibfk_3` (`aID`),
  ADD KEY `products_ibfk_4` (`tID`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supID`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`tID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `aID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `bID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `bID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `brID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `cmtID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `cID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `hID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `imgID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `pID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `tID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `products` (`pID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`);

--
-- Các ràng buộc cho bảng `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`aID`) REFERENCES `admin` (`aID`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brID`) REFERENCES `brand` (`brID`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supID`) REFERENCES `supplier` (`supID`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`aID`) REFERENCES `admin` (`aID`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`tID`) REFERENCES `type` (`tID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
