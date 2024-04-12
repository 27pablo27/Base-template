-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.6.17 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour pablo
CREATE DATABASE IF NOT EXISTS `pablo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pablo`;

-- Listage de la structure de table pablo. addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.addon_account : ~10 rows (environ)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Savings account', 0),
	('caution', 'caution', 0),
	('property_black_money', 'Argent Sale Propriété', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Bank', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_weazel', 'Weazel News', 1);

-- Listage de la structure de table pablo. addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.addon_account_data : ~5 rows (environ)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(2, 'society_police', 0, NULL),
	(3, 'society_ambulance', 0, NULL),
	(4, 'society_mechanic', 0, NULL),
	(5, 'society_taxi', 0, NULL);

-- Listage de la structure de table pablo. addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.addon_inventory : ~7 rows (environ)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0),
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_weazel', 'Weazel News', 1);

-- Listage de la structure de table pablo. addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.addon_inventory_items : ~0 rows (environ)

-- Listage de la structure de table pablo. billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `split` tinyint(1) NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.billing : ~0 rows (environ)

-- Listage de la structure de table pablo. blipsbuilder
CREATE TABLE IF NOT EXISTS `blipsbuilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `scale` varchar(11) NOT NULL,
  `color` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table pablo.blipsbuilder : ~0 rows (environ)

-- Listage de la structure de table pablo. cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.cardealer_vehicles : ~0 rows (environ)

-- Listage de la structure de table pablo. datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.datastore : ~9 rows (environ)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Listage de la structure de table pablo. datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.datastore_data : ~8 rows (environ)
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_mechanic', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'property', NULL, '{}'),
	(6, 'property', NULL, '{}'),
	(7, 'property', NULL, '{}'),
	(8, 'property', NULL, '{}');

-- Listage de la structure de table pablo. drugsbuilder
CREATE TABLE IF NOT EXISTS `drugsbuilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdBy` text NOT NULL,
  `createdAt` text NOT NULL,
  `label` varchar(50) NOT NULL,
  `drugsInfos` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table pablo.drugsbuilder : ~0 rows (environ)

-- Listage de la structure de table pablo. fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.fine_types : ~52 rows (environ)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);

-- Listage de la structure de table pablo. fuel_stations
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `station_id` varchar(255) NOT NULL,
  `station_fuel` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1243 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table pablo.fuel_stations : ~27 rows (environ)
INSERT INTO `fuel_stations` (`id`, `station_id`, `station_fuel`) VALUES
	(1216, '1', '0.0'),
	(1217, '2', '0.0'),
	(1218, '3', '0.0'),
	(1219, '7', '0.0'),
	(1220, '4', '0.0'),
	(1221, '5', '0.0'),
	(1222, '6', '0.0'),
	(1223, '8', '0.0'),
	(1224, '9', '0.0'),
	(1225, '10', '0.0'),
	(1226, '11', '0.0'),
	(1227, '13', '0.0'),
	(1228, '12', '0.0'),
	(1229, '14', '0.0'),
	(1230, '17', '0.0'),
	(1231, '16', '0.0'),
	(1232, '15', '0.0'),
	(1233, '18', '0.0'),
	(1234, '19', '0.0'),
	(1235, '20', '0.0'),
	(1236, '21', '0.0'),
	(1237, '23', '0.0'),
	(1238, '22', '0.0'),
	(1239, '26', '0.0'),
	(1240, '24', '0.0'),
	(1241, '25', '0.0'),
	(1242, '27', '0.0');

-- Listage de la structure de table pablo. items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '1',
  `rare` tinyint(4) NOT NULL DEFAULT '0',
  `can_remove` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.items : ~33 rows (environ)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('alive_chicken', 'Poulet vivant', 1, 0, 1),
	('bandage', 'Bandage', 2, 0, 1),
	('blowpipe', 'Chalumeau', 2, 0, 1),
	('bread', 'Pain', 1, 0, 1),
	('cannabis', 'Cannabis', 3, 0, 1),
	('carokit', 'Kit de carrosserie', 3, 0, 1),
	('carotool', 'Outils', 2, 0, 1),
	('clothe', 'Tissu', 1, 0, 1),
	('copper', 'Cuivre', 1, 0, 1),
	('cutted_wood', 'Bois coupé', 1, 0, 1),
	('diamond', 'Diamant', 1, 0, 1),
	('essence', 'Essence', 1, 0, 1),
	('fabric', 'Tissu', 1, 0, 1),
	('fish', 'Poisson', 1, 0, 1),
	('fixkit', 'Kit de réparation', 3, 0, 1),
	('fixtool', 'Outils de réparation', 2, 0, 1),
	('gazbottle', 'Bouteille de gaz', 2, 0, 1),
	('gold', 'Or', 1, 0, 1),
	('iron', 'Fer', 1, 0, 1),
	('marijuana', 'Marijuana', 2, 0, 1),
	('medikit', 'Trousse de premiers secours', 2, 0, 1),
	('packaged_chicken', 'Filet de poulet', 1, 0, 1),
	('packaged_plank', 'Bois emballé', 1, 0, 1),
	('petrol', 'Pétrole', 1, 0, 1),
	('petrol_raffin', 'Pétrole raffiné', 1, 0, 1),
	('phone', 'Téléphone', 1, 0, 1),
	('radio', 'Radio', 1, 0, 1),
	('slaughtered_chicken', 'Poulet abattu', 1, 0, 1),
	('stone', 'Pierre', 1, 0, 1),
	('washed_stone', 'Pierre lavée', 1, 0, 1),
	('water', 'Eau', 1, 0, 1),
	('wood', 'Bois', 1, 0, 1),
	('wool', 'Laine', 1, 0, 1);

-- Listage de la structure de table pablo. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.jobs : ~14 rows (environ)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 0),
	('banker', 'Banker', 0),
	('cardealer', 'Cardealer', 0),
	('fisherman', 'Fisherman', 0),
	('fueler', 'Fueler', 0),
	('lumberjack', 'Lumberjack', 0),
	('mechanic', 'Mechanic', 0),
	('police', 'LSPD', 0),
	('reporter', 'Reporter', 0),
	('slaughterer', 'Butcher', 0),
	('tailor', 'Tailor', 0),
	('taxi', 'Taxi', 0),
	('unemployed', 'Unemployed', 0),
	('weazel', 'Weazel News', 0);

-- Listage de la structure de table pablo. job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.job_grades : ~39 rows (environ)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
	(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
	(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(15, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(16, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(17, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(18, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(19, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(21, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(22, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'EMT', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(26, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
	(27, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
	(28, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
	(29, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
	(30, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'Recruit', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Cabby', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Experienced', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(36, 'banker', 0, 'advisor', 'Consultant', 10, '{}', '{}'),
	(37, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}'),
	(38, 'banker', 2, 'business_banker', 'Investment banker', 30, '{}', '{}'),
	(39, 'banker', 3, 'trader', 'Broker', 40, '{}', '{}'),
	(40, 'banker', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(41, 'weazel', 1, 'journaliste', 'journaliste', 750, '', ''),
	(42, 'weazel', 2, 'director', 'Directeur', 1500, '', ''),
	(43, 'weazel', 3, 'boss', 'Patron', 2500, '', ''),
	(44, 'police', 1, 'cadet', 'Cadet', 1500, '', ''),
	(45, 'police', 2, 'officier', 'Officier', 2500, '', ''),
	(46, 'police', 3, 'sergent', 'Sergent', 3500, '', ''),
	(47, 'police', 4, 'lieutenant', 'Lieutenant', 4500, '', ''),
	(48, 'police', 5, 'capitaine', 'Capitaine', 5000, '', ''),
	(49, 'police', 6, 'commandant', 'Commandant', 7500, '', '');

-- Listage de la structure de table pablo. licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.licenses : ~7 rows (environ)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License'),
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License'),
	('weapon', 'Weapon License'),
	('weed_processing', 'Weed Processing License');

-- Listage de la structure de table pablo. markerbuilder
CREATE TABLE IF NOT EXISTS `markerbuilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `type` int(11) NOT NULL,
  `scale` int(11) NOT NULL DEFAULT '1',
  `bop` int(11) NOT NULL DEFAULT '0',
  `rotate` int(11) NOT NULL DEFAULT '0',
  `colorr` int(11) NOT NULL DEFAULT '0',
  `colorg` int(11) NOT NULL DEFAULT '0',
  `colorb` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.markerbuilder : ~0 rows (environ)

-- Listage de la structure de table pablo. multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL DEFAULT '',
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.multicharacter_slots : ~0 rows (environ)

-- Listage de la structure de table pablo. owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT '0',
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `glovebox` longtext,
  `trunk` longtext,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.owned_vehicles : ~5 rows (environ)
INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`, `parking`, `pound`, `glovebox`, `trunk`) VALUES
	('char1:1aaa2d0ab6323802b1945b3e064309f7f6bee44a', 'LBE 771', '{"modDashboard":-1,"engineHealth":1000.0,"tyreSmokeColor":[255,255,255],"modFrontWheels":-1,"tyresCanBurst":1,"modSmokeEnabled":false,"modHydrolic":-1,"modOrnaments":-1,"wheelColor":156,"modRightFender":-1,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"neonEnabled":[false,false,false,false],"extras":[],"plateIndex":0,"modArmor":-1,"windowTint":-1,"modEngine":-1,"doorsBroken":{"4":false,"3":false,"2":false,"1":false,"0":false},"modDial":-1,"modCustomBackWheels":false,"modAirFilter":-1,"modTurbo":false,"modFender":-1,"modRoofLivery":-1,"plate":"LBE 771","modGrille":-1,"color2":30,"modBrakes":-1,"modWindows":-1,"modSteeringWheel":-1,"interiorColor":0,"modXenon":false,"modHood":-1,"neonColor":[255,0,255],"modSpoilers":-1,"modShifterLeavers":-1,"xenonColor":255,"modFrame":-1,"modRearBumper":-1,"modTank":-1,"modPlateHolder":-1,"dirtLevel":4.0,"modSpeakers":-1,"modTrimA":-1,"modBackWheels":-1,"modFrontBumper":-1,"modEngineBlock":-1,"modDoorSpeaker":-1,"modCustomFrontWheels":false,"modTrimB":-1,"modStruts":-1,"windowsBroken":{"5":true,"4":true,"3":false,"2":false,"1":false,"0":false,"7":false,"6":false},"modArchCover":-1,"modAPlate":-1,"wheels":0,"model":-1045541610,"modLivery":-1,"modLightbar":-1,"modExhaust":-1,"color1":4,"modTrunk":-1,"pearlescentColor":111,"modVanityPlate":-1,"tankHealth":1000.0,"dashboardColor":0,"modRoof":-1,"modSeats":-1,"modSideSkirt":-1,"fuelLevel":60.0,"modTransmission":-1,"modHorns":-1,"modAerials":-1,"modSuspension":-1,"bodyHealth":1000.0}', 'car', NULL, 0, NULL, NULL, NULL, NULL),
	('char1:1aaa2d0ab6323802b1945b3e064309f7f6bee44a', 'NKL 334', '{"bodyHealth":1000,"modShifterLeavers":-1,"modSteeringWheel":-1,"modCustomFrontWheels":false,"modDoorSpeaker":-1,"tyresCanBurst":1,"pearlescentColor":111,"modTrimA":-1,"windowTint":-1,"tyreSmokeColor":[255,255,255],"modRoofLivery":-1,"wheels":0,"modPlateHolder":-1,"plateIndex":0,"modAPlate":-1,"xenonColor":255,"modRearBumper":-1,"modSideSkirt":-1,"modFrontWheels":-1,"modTransmission":-1,"modArchCover":-1,"modTurbo":false,"modVanityPlate":-1,"modAerials":-1,"modExhaust":-1,"modOrnaments":-1,"modWindows":-1,"modEngine":-1,"modSpeakers":-1,"neonColor":[255,0,255],"dirtLevel":3,"modStruts":-1,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modFrontBumper":-1,"modTank":-1,"modTrunk":-1,"tankHealth":1000,"modLightbar":-1,"modGrille":-1,"modEngineBlock":-1,"modSpoilers":-1,"modHorns":-1,"modLivery":-1,"interiorColor":0,"modSmokeEnabled":false,"plate":"NKL 334","modSuspension":-1,"color2":0,"modTrimB":-1,"modArmor":-1,"engineHealth":1000,"modAirFilter":-1,"modSeats":-1,"modRightFender":-1,"modDial":-1,"model":-344943009,"neonEnabled":[false,false,false,false],"extras":{"10":false,"12":false},"modBackWheels":-1,"modFrame":-1,"wheelColor":156,"modFender":-1,"modXenon":false,"modCustomBackWheels":false,"modHood":-1,"modDashboard":-1,"modHydrolic":-1,"doorsBroken":{"4":false,"3":false,"2":false,"1":false,"0":false},"dashboardColor":0,"fuelLevel":65,"modRoof":-1,"windowsBroken":{"5":true,"4":true,"3":false,"2":false,"1":false,"0":false,"7":false,"6":false},"modBrakes":-1,"color1":6}', 'car', NULL, 0, NULL, NULL, NULL, NULL),
	('char1:1aaa2d0ab6323802b1945b3e064309f7f6bee44a', 'SSM 029', '{"modSeats":-1,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modDial":-1,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"modFrontWheels":-1,"modAPlate":-1,"color2":0,"plate":"SSM 029","modSpeakers":-1,"modTrunk":-1,"pearlescentColor":111,"modTank":-1,"modHood":-1,"plateIndex":0,"engineHealth":1000.0,"modCustomFrontWheels":false,"modTrimA":-1,"fuelLevel":65.0,"modDoorSpeaker":-1,"modEngineBlock":-1,"modBackWheels":-1,"modVanityPlate":-1,"wheelColor":156,"extras":{"12":false,"10":false},"modCustomBackWheels":false,"modWindows":-1,"modRearBumper":-1,"modTrimB":-1,"modLivery":-1,"modBrakes":-1,"modFrontBumper":-1,"modTransmission":-1,"bodyHealth":1000.0,"modHorns":-1,"tyreBurst":{"1":false,"5":false,"0":false,"4":false},"modLightbar":-1,"model":-344943009,"tyreSmokeColor":[255,255,255],"interiorColor":0,"dashboardColor":0,"modFrame":-1,"tyresCanBurst":1,"modRoofLivery":-1,"modTurbo":false,"modArchCover":-1,"modRightFender":-1,"modSmokeEnabled":false,"modEngine":-1,"modXenon":false,"modHydrolic":-1,"modDashboard":-1,"modOrnaments":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modSideSkirt":-1,"dirtLevel":9.0,"modArmor":-1,"modFender":-1,"modStruts":-1,"tankHealth":1000.0,"modSteeringWheel":-1,"color1":6,"modGrille":-1,"modAerials":-1,"wheels":0,"xenonColor":255,"windowsBroken":{"5":true,"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true},"windowTint":-1,"modExhaust":-1,"modRoof":-1,"modSpoilers":-1,"modShifterLeavers":-1,"modSuspension":-1}', 'car', NULL, 0, NULL, NULL, NULL, NULL),
	('char1:1aaa2d0ab6323802b1945b3e064309f7f6bee44a', 'WXG 293', '{"modSuspension":-1,"modXenon":false,"modBrakes":-1,"windowTint":-1,"neonEnabled":[false,false,false,false],"windowsBroken":{"6":false,"7":false,"4":true,"5":true,"2":false,"3":false,"0":false,"1":false},"modCustomFrontWheels":false,"modHorns":-1,"modLightbar":-1,"wheels":0,"color2":0,"modRearBumper":-1,"modAPlate":-1,"modTurbo":false,"modDial":-1,"modGrille":-1,"modAirFilter":-1,"modRoof":-1,"dirtLevel":9,"bodyHealth":1000,"doorsBroken":{"4":false,"2":false,"3":false,"0":false,"1":false},"tankHealth":1000,"modArchCover":-1,"extras":{"10":1,"12":false},"plateIndex":0,"modSpeakers":-1,"neonColor":[255,0,255],"modAerials":-1,"modEngine":-1,"tyresCanBurst":1,"modFrontWheels":-1,"modTrimB":-1,"plate":"WXG 293","pearlescentColor":111,"dashboardColor":0,"modSideSkirt":-1,"modCustomBackWheels":false,"wheelColor":156,"modTrunk":-1,"modSpoilers":-1,"modStruts":-1,"modDoorSpeaker":-1,"modHood":-1,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"modShifterLeavers":-1,"modSteeringWheel":-1,"interiorColor":0,"model":-344943009,"modFrontBumper":-1,"modRoofLivery":-1,"modRightFender":-1,"modFender":-1,"modPlateHolder":-1,"xenonColor":255,"modTrimA":-1,"modOrnaments":-1,"fuelLevel":65,"engineHealth":1000,"modWindows":-1,"modTank":-1,"modSmokeEnabled":false,"modArmor":-1,"modDashboard":-1,"modFrame":-1,"modBackWheels":-1,"modExhaust":-1,"color1":6,"modHydrolic":-1,"modEngineBlock":-1,"modSeats":-1,"modTransmission":-1,"modLivery":-1,"tyreSmokeColor":[255,255,255],"modVanityPlate":-1}', 'car', NULL, 2, NULL, 'LosSantos', NULL, NULL),
	('char1:1aaa2d0ab6323802b1945b3e064309f7f6bee44a', 'XGQ 831', '{"plateIndex":0,"interiorColor":0,"tyresCanBurst":1,"engineHealth":1000.0,"modShifterLeavers":-1,"modEngineBlock":-1,"tankHealth":999.9,"dashboardColor":0,"modSpoilers":-1,"modTransmission":-1,"modXenon":false,"modLivery":-1,"modTrunk":-1,"neonColor":[255,0,255],"modArmor":-1,"modWindows":-1,"bodyHealth":998.9,"modRoofLivery":-1,"plate":"XGQ 831","modAirFilter":-1,"fuelLevel":61.0,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modHood":-1,"modRearBumper":-1,"modFrontWheels":-1,"modExhaust":-1,"modCustomBackWheels":false,"modHorns":-1,"modSuspension":-1,"modAerials":-1,"modArchCover":-1,"modBrakes":-1,"modDial":-1,"neonEnabled":[false,false,false,false],"modDashboard":-1,"modAPlate":-1,"color1":6,"modBackWheels":-1,"modVanityPlate":-1,"pearlescentColor":111,"windowsBroken":{"4":true,"3":false,"6":false,"5":true,"0":false,"7":false,"2":false,"1":false},"modSteeringWheel":-1,"modCustomFrontWheels":false,"modPlateHolder":-1,"dirtLevel":3.4,"modEngine":-1,"modTank":-1,"wheels":0,"modOrnaments":-1,"modLightbar":-1,"modSideSkirt":-1,"modTrimB":-1,"color2":0,"doorsBroken":{"4":false,"3":false,"0":false,"2":false,"1":false},"modTurbo":false,"modSmokeEnabled":1,"modFender":-1,"windowTint":-1,"modRoof":-1,"wheelColor":156,"xenonColor":255,"modSeats":-1,"modSpeakers":-1,"modGrille":-1,"model":-344943009,"modTrimA":-1,"modDoorSpeaker":-1,"modFrame":-1,"modFrontBumper":-1,"modRightFender":-1,"modStruts":-1,"extras":{"12":false,"10":false},"tyreSmokeColor":[255,255,255],"modHydrolic":-1}', 'car', NULL, 1, 'VespucciBoulevard', NULL, NULL, NULL);

-- Listage de la structure de table pablo. ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext,
  `lastupdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.ox_inventory : ~0 rows (environ)

-- Listage de la structure de table pablo. rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.rented_vehicles : ~0 rows (environ)

-- Listage de la structure de table pablo. society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.society_moneywash : ~0 rows (environ)

-- Listage de la structure de table pablo. users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL DEFAULT '',
  `accounts` longtext,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext,
  `metadata` longtext,
  `position` longtext,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext,
  `status` longtext,
  `is_dead` tinyint(1) DEFAULT '0',
  `disabled` tinyint(1) DEFAULT '0',
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `coins` int(11) NOT NULL DEFAULT '0',
  `id_boutique` int(11) NOT NULL AUTO_INCREMENT,
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `tattoos` longtext,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id_boutique` (`id_boutique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.users : ~1 rows (environ)
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `disabled`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`, `coins`, `id_boutique`, `jail_time`, `tattoos`) VALUES
	('char1:1aaa2d0ab6323802b1945b3e064309f7f6bee44a', '{"black_money":0,"bank":54500,"money":526}', 'admin', '[{"name":"money","slot":1,"count":526}]', 'police', 1, '[]', '{"health":200,"armor":0}', '{"x":-1579.5823974609376,"z":116.3260498046875,"y":-567.2439575195313}', 'Pablo', 'Giavani', '02/02/1998', 'm', 184, '{"mask_1":0,"arms":1,"neck_thickness":0,"chain_2":2,"chin_3":0,"mom":21,"beard_4":0,"eyebrows_6":0,"bodyb_1":-1,"nose_1":-5,"blush_1":0,"tshirt_2":2,"sun_2":0,"helmet_2":0,"bracelets_2":0,"chest_3":0,"bodyb_4":0,"eye_squint":0,"moles_2":0,"eyebrows_3":0,"torso_2":2,"shoes_2":2,"eyebrows_4":0,"bproof_1":0,"watches_2":0,"moles_1":0,"watches_1":-1,"hair_color_2":29,"jaw_2":0,"chin_2":0,"bracelets_1":-1,"bags_2":0,"decals_1":0,"blush_3":0,"bags_1":0,"blush_2":0,"lipstick_3":0,"helmet_1":-1,"skin_md_weight":27,"lipstick_1":0,"nose_2":6,"hair_2":0,"pants_2":3,"shoes_1":70,"beard_3":0,"face_md_weight":61,"chest_1":0,"nose_5":10,"chin_1":0,"complexion_2":0,"makeup_3":0,"cheeks_1":2,"bodyb_2":0,"decals_2":0,"complexion_1":0,"lip_thickness":-2,"sex":0,"makeup_4":0,"jaw_1":0,"glasses_1":0,"eyebrows_5":0,"chest_2":0,"bproof_2":0,"blemishes_1":0,"tshirt_1":4,"nose_6":0,"beard_2":10,"ears_1":-1,"chin_13":0,"eyebrows_2":0,"lipstick_2":0,"cheeks_3":6,"blemishes_2":0,"nose_4":8,"torso_1":23,"makeup_1":0,"age_2":0,"age_1":0,"chain_1":22,"glasses_2":0,"pants_1":28,"chin_4":0,"mask_2":0,"eyebrows_1":0,"cheeks_2":-10,"hair_color_1":61,"bodyb_3":-1,"dad":29,"eye_color":0,"arms_2":0,"lipstick_4":0,"hair_1":76,"nose_3":5,"makeup_2":0,"sun_1":0,"beard_1":11,"ears_2":0}', '[{"val":335400,"name":"hunger","percent":33.54},{"val":501550,"name":"thirst","percent":50.15500000000001}]', 0, 0, NULL, '2024-03-28 20:50:43', '2024-04-01 15:35:26', NULL, NULL, 0, 3, 0, NULL);

-- Listage de la structure de table pablo. user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.user_licenses : ~1 rows (environ)
INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'weapon', 'char1:1aaa2d0ab6323802b1945b3e064309f7f6bee44a');

-- Listage de la structure de table pablo. vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.vehicles : ~240 rows (environ)
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');

-- Listage de la structure de table pablo. vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.vehicle_categories : ~11 rows (environ)
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');

-- Listage de la structure de table pablo. vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table pablo.vehicle_sold : ~0 rows (environ)

-- Listage de la structure de table pablo. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(46) NOT NULL DEFAULT '',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table pablo.whitelist : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
