SET foreign_key_checks = 0;

CREATE TABLE `announcements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcements_company_id_foreign` (`company_id`),
  KEY `announcements_department_id_foreign` (`department_id`),
  KEY `announcements_added_by_foreign` (`added_by`),
  CONSTRAINT `announcements_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `announcements_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `appraisals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `designation_id` bigint(20) unsigned NOT NULL,
  `customer_experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `administration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professionalism` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `asset_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `asset_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `asset_code` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assets_category_id` bigint(20) unsigned NOT NULL,
  `Asset_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_company_id_foreign` (`company_id`),
  KEY `assets_employee_id_foreign` (`employee_id`),
  KEY `assets_assets_category_id_foreign` (`assets_category_id`),
  CONSTRAINT `assets_assets_category_id_foreign` FOREIGN KEY (`assets_category_id`) REFERENCES `asset_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `attendance_date` date NOT NULL,
  `clock_in` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in_out` tinyint(4) NOT NULL,
  `time_late` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `early_leaving` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `overtime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `total_work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `total_rest` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `attendance_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'present',
  PRIMARY KEY (`id`),
  KEY `attendances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendances VALUES('1','49','2022-03-14','09:00','72.255.58.241','03:31','72.255.58.241','0','00:00','13:29','00:00','05:29','00:00','present');



CREATE TABLE `award_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `award_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `awards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `award_information` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `award_date` date NOT NULL,
  `gift` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `award_type_id` bigint(20) unsigned DEFAULT NULL,
  `award_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `awards_company_id_foreign` (`company_id`),
  KEY `awards_department_id_foreign` (`department_id`),
  KEY `awards_employee_id_foreign` (`employee_id`),
  KEY `awards_award_type_id_foreign` (`award_type_id`),
  CONSTRAINT `awards_award_type_id_foreign` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `c_m_s` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `home` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `calendarables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `candidate_interview` (
  `interview_id` bigint(20) unsigned NOT NULL,
  `candidate_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interview_id`,`candidate_id`),
  KEY `candidate_interview_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_interview_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidates` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `candidate_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `clients_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO clients VALUES('50','Faraz','Ali','faraz@gmail.com','03453785306','client','','Posh and Core','','','Dadu','Dadu','Dadu','sindh','7600','127','1','2022-03-13 13:10:48','2022-03-13 13:10:48');



CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trading_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_location_id_foreign` (`location_id`),
  CONSTRAINT `companies_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO companies VALUES('1','Posh and Core','corporation','','','03453785306','alijan.rahujo143@gmail.com','','00000','1','','','2022-03-13 12:57:46','2022-03-13 12:58:12');



CREATE TABLE `complaints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `complaint_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `complaint_from` bigint(20) unsigned NOT NULL,
  `complaint_against` bigint(20) unsigned NOT NULL,
  `complaint_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaints_company_id_foreign` (`company_id`),
  KEY `complaints_complaint_from_foreign` (`complaint_from`),
  KEY `complaints_complaint_against_foreign` (`complaint_against`),
  CONSTRAINT `complaints_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_complaint_against_foreign` FOREIGN KEY (`complaint_against`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_complaint_from_foreign` FOREIGN KEY (`complaint_from`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO countries VALUES('1','US','United States');
INSERT INTO countries VALUES('2','CA','Canada');
INSERT INTO countries VALUES('3','AF','Afghanistan');
INSERT INTO countries VALUES('4','AL','Albania');
INSERT INTO countries VALUES('5','DZ','Algeria');
INSERT INTO countries VALUES('6','DS','American Samoa');
INSERT INTO countries VALUES('7','AD','Andorra');
INSERT INTO countries VALUES('8','AO','Angola');
INSERT INTO countries VALUES('9','AI','Anguilla');
INSERT INTO countries VALUES('10','AQ','Antarctica');
INSERT INTO countries VALUES('11','AG','Antigua and/or Barbuda');
INSERT INTO countries VALUES('12','AR','Argentina');
INSERT INTO countries VALUES('13','AM','Armenia');
INSERT INTO countries VALUES('14','AW','Aruba');
INSERT INTO countries VALUES('15','AU','Australia');
INSERT INTO countries VALUES('16','AT','Austria');
INSERT INTO countries VALUES('17','AZ','Azerbaijan');
INSERT INTO countries VALUES('18','BS','Bahamas');
INSERT INTO countries VALUES('19','BH','Bahrain');
INSERT INTO countries VALUES('20','BD','Bangladesh');
INSERT INTO countries VALUES('21','BB','Barbados');
INSERT INTO countries VALUES('22','BY','Belarus');
INSERT INTO countries VALUES('23','BE','Belgium');
INSERT INTO countries VALUES('24','BZ','Belize');
INSERT INTO countries VALUES('25','BJ','Benin');
INSERT INTO countries VALUES('26','BM','Bermuda');
INSERT INTO countries VALUES('27','BT','Bhutan');
INSERT INTO countries VALUES('28','BO','Bolivia');
INSERT INTO countries VALUES('29','BA','Bosnia and Herzegovina');
INSERT INTO countries VALUES('30','BW','Botswana');
INSERT INTO countries VALUES('31','BV','Bouvet Island');
INSERT INTO countries VALUES('32','BR','Brazil');
INSERT INTO countries VALUES('33','IO','British lndian Ocean Territory');
INSERT INTO countries VALUES('34','BN','Brunei Darussalam');
INSERT INTO countries VALUES('35','BG','Bulgaria');
INSERT INTO countries VALUES('36','BF','Burkina Faso');
INSERT INTO countries VALUES('37','BI','Burundi');
INSERT INTO countries VALUES('38','KH','Cambodia');
INSERT INTO countries VALUES('39','CM','Cameroon');
INSERT INTO countries VALUES('40','CV','Cape Verde');
INSERT INTO countries VALUES('41','KY','Cayman Islands');
INSERT INTO countries VALUES('42','CF','Central African Republic');
INSERT INTO countries VALUES('43','TD','Chad');
INSERT INTO countries VALUES('44','CL','Chile');
INSERT INTO countries VALUES('45','CN','China');
INSERT INTO countries VALUES('46','CX','Christmas Island');
INSERT INTO countries VALUES('47','CC','Cocos (Keeling) Islands');
INSERT INTO countries VALUES('48','CO','Colombia');
INSERT INTO countries VALUES('49','KM','Comoros');
INSERT INTO countries VALUES('50','CG','Congo');
INSERT INTO countries VALUES('51','CK','Cook Islands');
INSERT INTO countries VALUES('52','CR','Costa Rica');
INSERT INTO countries VALUES('53','HR','Croatia (Hrvatska)');
INSERT INTO countries VALUES('54','CU','Cuba');
INSERT INTO countries VALUES('55','CY','Cyprus');
INSERT INTO countries VALUES('56','CZ','Czech Republic');
INSERT INTO countries VALUES('57','DK','Denmark');
INSERT INTO countries VALUES('58','DJ','Djibouti');
INSERT INTO countries VALUES('59','DM','Dominica');
INSERT INTO countries VALUES('60','DO','Dominican Republic');
INSERT INTO countries VALUES('61','TP','East Timor');
INSERT INTO countries VALUES('62','EC','Ecudaor');
INSERT INTO countries VALUES('63','EG','Egypt');
INSERT INTO countries VALUES('64','SV','El Salvador');
INSERT INTO countries VALUES('65','GQ','Equatorial Guinea');
INSERT INTO countries VALUES('66','ER','Eritrea');
INSERT INTO countries VALUES('67','EE','Estonia');
INSERT INTO countries VALUES('68','ET','Ethiopia');
INSERT INTO countries VALUES('69','FK','Falkland Islands (Malvinas)');
INSERT INTO countries VALUES('70','FO','Faroe Islands');
INSERT INTO countries VALUES('71','FJ','Fiji');
INSERT INTO countries VALUES('72','FI','Finland');
INSERT INTO countries VALUES('73','FR','France');
INSERT INTO countries VALUES('74','FX','France, Metropolitan');
INSERT INTO countries VALUES('75','GF','French Guiana');
INSERT INTO countries VALUES('76','PF','French Polynesia');
INSERT INTO countries VALUES('77','TF','French Southern Territories');
INSERT INTO countries VALUES('78','GA','Gabon');
INSERT INTO countries VALUES('79','GM','Gambia');
INSERT INTO countries VALUES('80','GE','Georgia');
INSERT INTO countries VALUES('81','DE','Germany');
INSERT INTO countries VALUES('82','GH','Ghana');
INSERT INTO countries VALUES('83','GI','Gibraltar');
INSERT INTO countries VALUES('84','GR','Greece');
INSERT INTO countries VALUES('85','GL','Greenland');
INSERT INTO countries VALUES('86','GD','Grenada');
INSERT INTO countries VALUES('87','GP','Guadeloupe');
INSERT INTO countries VALUES('88','GU','Guam');
INSERT INTO countries VALUES('89','GT','Guatemala');
INSERT INTO countries VALUES('90','GN','Guinea');
INSERT INTO countries VALUES('91','GW','Guinea-Bissau');
INSERT INTO countries VALUES('92','GY','Guyana');
INSERT INTO countries VALUES('93','HT','Haiti');
INSERT INTO countries VALUES('94','HM','Heard and Mc Donald Islands');
INSERT INTO countries VALUES('95','HN','Honduras');
INSERT INTO countries VALUES('96','HK','Hong Kong');
INSERT INTO countries VALUES('97','HU','Hungary');
INSERT INTO countries VALUES('98','IS','Iceland');
INSERT INTO countries VALUES('99','IN','India');
INSERT INTO countries VALUES('100','ID','Indonesia');
INSERT INTO countries VALUES('101','IR','Iran (Islamic Republic of)');
INSERT INTO countries VALUES('102','IQ','Iraq');
INSERT INTO countries VALUES('103','IE','Ireland');
INSERT INTO countries VALUES('104','IL','Israel');
INSERT INTO countries VALUES('105','IT','Italy');
INSERT INTO countries VALUES('106','CI','Ivory Coast');
INSERT INTO countries VALUES('107','JM','Jamaica');
INSERT INTO countries VALUES('108','JP','Japan');
INSERT INTO countries VALUES('109','JO','Jordan');
INSERT INTO countries VALUES('110','KZ','Kazakhstan');
INSERT INTO countries VALUES('111','KE','Kenya');
INSERT INTO countries VALUES('112','KI','Kiribati');
INSERT INTO countries VALUES('113','KP','Korea, Democratic People\'s Republic of');
INSERT INTO countries VALUES('114','KR','Korea, Republic of');
INSERT INTO countries VALUES('115','KW','Kuwait');
INSERT INTO countries VALUES('116','KG','Kyrgyzstan');
INSERT INTO countries VALUES('117','LA','Lao People\'s Democratic Republic');
INSERT INTO countries VALUES('118','LV','Latvia');
INSERT INTO countries VALUES('119','LB','Lebanon');
INSERT INTO countries VALUES('120','LS','Lesotho');
INSERT INTO countries VALUES('121','LR','Liberia');
INSERT INTO countries VALUES('122','LY','Libyan Arab Jamahiriya');
INSERT INTO countries VALUES('123','LI','Liechtenstein');
INSERT INTO countries VALUES('124','LT','Lithuania');
INSERT INTO countries VALUES('125','LU','Luxembourg');
INSERT INTO countries VALUES('126','MO','Macau');
INSERT INTO countries VALUES('127','MK','Macedonia');
INSERT INTO countries VALUES('128','MG','Madagascar');
INSERT INTO countries VALUES('129','MW','Malawi');
INSERT INTO countries VALUES('130','MY','Malaysia');
INSERT INTO countries VALUES('131','MV','Maldives');
INSERT INTO countries VALUES('132','ML','Mali');
INSERT INTO countries VALUES('133','MT','Malta');
INSERT INTO countries VALUES('134','MH','Marshall Islands');
INSERT INTO countries VALUES('135','MQ','Martinique');
INSERT INTO countries VALUES('136','MR','Mauritania');
INSERT INTO countries VALUES('137','MU','Mauritius');
INSERT INTO countries VALUES('138','TY','Mayotte');
INSERT INTO countries VALUES('139','MX','Mexico');
INSERT INTO countries VALUES('140','FM','Micronesia, Federated States of');
INSERT INTO countries VALUES('141','MD','Moldova, Republic of');
INSERT INTO countries VALUES('142','MC','Monaco');
INSERT INTO countries VALUES('143','MN','Mongolia');
INSERT INTO countries VALUES('144','MS','Montserrat');
INSERT INTO countries VALUES('145','MA','Morocco');
INSERT INTO countries VALUES('146','MZ','Mozambique');
INSERT INTO countries VALUES('147','MM','Myanmar');
INSERT INTO countries VALUES('148','NA','Namibia');
INSERT INTO countries VALUES('149','NR','Nauru');
INSERT INTO countries VALUES('150','NP','Nepal');
INSERT INTO countries VALUES('151','NL','Netherlands');
INSERT INTO countries VALUES('152','AN','Netherlands Antilles');
INSERT INTO countries VALUES('153','NC','New Caledonia');
INSERT INTO countries VALUES('154','NZ','New Zealand');
INSERT INTO countries VALUES('155','NI','Nicaragua');
INSERT INTO countries VALUES('156','NE','Niger');
INSERT INTO countries VALUES('157','NG','Nigeria');
INSERT INTO countries VALUES('158','NU','Niue');
INSERT INTO countries VALUES('159','NF','Norfork Island');
INSERT INTO countries VALUES('160','MP','Northern Mariana Islands');
INSERT INTO countries VALUES('161','NO','Norway');
INSERT INTO countries VALUES('162','OM','Oman');
INSERT INTO countries VALUES('163','PK','Pakistan');
INSERT INTO countries VALUES('164','PW','Palau');
INSERT INTO countries VALUES('165','PA','Panama');
INSERT INTO countries VALUES('166','PG','Papua New Guinea');
INSERT INTO countries VALUES('167','PY','Paraguay');
INSERT INTO countries VALUES('168','PE','Peru');
INSERT INTO countries VALUES('169','PH','Philippines');
INSERT INTO countries VALUES('170','PN','Pitcairn');
INSERT INTO countries VALUES('171','PL','Poland');
INSERT INTO countries VALUES('172','PT','Portugal');
INSERT INTO countries VALUES('173','PR','Puerto Rico');
INSERT INTO countries VALUES('174','QA','Qatar');
INSERT INTO countries VALUES('175','RE','Reunion');
INSERT INTO countries VALUES('176','RO','Romania');
INSERT INTO countries VALUES('177','RU','Russian Federation');
INSERT INTO countries VALUES('178','RW','Rwanda');
INSERT INTO countries VALUES('179','KN','Saint Kitts and Nevis');
INSERT INTO countries VALUES('180','LC','Saint Lucia');
INSERT INTO countries VALUES('181','VC','Saint Vincent and the Grenadines');
INSERT INTO countries VALUES('182','WS','Samoa');
INSERT INTO countries VALUES('183','SM','San Marino');
INSERT INTO countries VALUES('184','ST','Sao Tome and Principe');
INSERT INTO countries VALUES('185','SA','Saudi Arabia');
INSERT INTO countries VALUES('186','SN','Senegal');
INSERT INTO countries VALUES('187','SC','Seychelles');
INSERT INTO countries VALUES('188','SL','Sierra Leone');
INSERT INTO countries VALUES('189','SG','Singapore');
INSERT INTO countries VALUES('190','SK','Slovakia');
INSERT INTO countries VALUES('191','SI','Slovenia');
INSERT INTO countries VALUES('192','SB','Solomon Islands');
INSERT INTO countries VALUES('193','SO','Somalia');
INSERT INTO countries VALUES('194','ZA','South Africa');
INSERT INTO countries VALUES('195','GS','South Georgia South Sandwich Islands');
INSERT INTO countries VALUES('196','ES','Spain');
INSERT INTO countries VALUES('197','LK','Sri Lanka');
INSERT INTO countries VALUES('198','SH','St. Helena');
INSERT INTO countries VALUES('199','PM','St. Pierre and Miquelon');
INSERT INTO countries VALUES('200','SD','Sudan');
INSERT INTO countries VALUES('201','SR','Suriname');
INSERT INTO countries VALUES('202','SJ','Svalbarn and Jan Mayen Islands');
INSERT INTO countries VALUES('203','SZ','Swaziland');
INSERT INTO countries VALUES('204','SE','Sweden');
INSERT INTO countries VALUES('205','CH','Switzerland');
INSERT INTO countries VALUES('206','SY','Syrian Arab Republic');
INSERT INTO countries VALUES('207','TW','Taiwan');
INSERT INTO countries VALUES('208','TJ','Tajikistan');
INSERT INTO countries VALUES('209','TZ','Tanzania, United Republic of');
INSERT INTO countries VALUES('210','TH','Thailand');
INSERT INTO countries VALUES('211','TG','Togo');
INSERT INTO countries VALUES('212','TK','Tokelau');
INSERT INTO countries VALUES('213','TO','Tonga');
INSERT INTO countries VALUES('214','TT','Trinidad and Tobago');
INSERT INTO countries VALUES('215','TN','Tunisia');
INSERT INTO countries VALUES('216','TR','Turkey');
INSERT INTO countries VALUES('217','TM','Turkmenistan');
INSERT INTO countries VALUES('218','TC','Turks and Caicos Islands');
INSERT INTO countries VALUES('219','TV','Tuvalu');
INSERT INTO countries VALUES('220','UG','Uganda');
INSERT INTO countries VALUES('221','UA','Ukraine');
INSERT INTO countries VALUES('222','AE','United Arab Emirates');
INSERT INTO countries VALUES('223','GB','United Kingdom');
INSERT INTO countries VALUES('224','UM','United States minor outlying islands');
INSERT INTO countries VALUES('225','UY','Uruguay');
INSERT INTO countries VALUES('226','UZ','Uzbekistan');
INSERT INTO countries VALUES('227','VU','Vanuatu');
INSERT INTO countries VALUES('228','VA','Vatican City State');
INSERT INTO countries VALUES('229','VE','Venezuela');
INSERT INTO countries VALUES('230','VN','Vietnam');
INSERT INTO countries VALUES('231','VG','Virigan Islands (British)');
INSERT INTO countries VALUES('232','VI','Virgin Islands (U.S.)');
INSERT INTO countries VALUES('233','WF','Wallis and Futuna Islands');
INSERT INTO countries VALUES('234','EH','Western Sahara');
INSERT INTO countries VALUES('235','YE','Yemen');
INSERT INTO countries VALUES('236','YU','Yugoslavia');
INSERT INTO countries VALUES('237','ZR','Zaire');
INSERT INTO countries VALUES('238','ZM','Zambia');
INSERT INTO countries VALUES('239','ZW','Zimbabwe');



CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_head` bigint(20) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_company_id_foreign` (`company_id`),
  KEY `departments_department_head_foreign` (`department_head`),
  CONSTRAINT `departments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `departments_department_head_foreign` FOREIGN KEY (`department_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES('1','HR','1','','','2022-03-13 12:59:29','2022-03-13 12:59:29');



CREATE TABLE `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designations_company_id_foreign` (`company_id`),
  KEY `designations_department_id_foreign` (`department_id`),
  CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO designations VALUES('1','Manager','1','1','','2022-03-13 13:00:01','2022-03-13 13:00:01');



CREATE TABLE `document_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `document_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_types_company_id_foreign` (`company_id`),
  CONSTRAINT `document_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_bank_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `account_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_bank_accounts_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_bank_accounts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `relation` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(4) DEFAULT 0,
  `is_dependent` tinyint(4) DEFAULT 0,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_phone_ext` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_contacts_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_contacts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `document_type_id` bigint(20) unsigned DEFAULT NULL,
  `document_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_documents_employee_id_foreign` (`employee_id`),
  KEY `employee_documents_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `employee_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_immigrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `document_type_id` bigint(20) unsigned DEFAULT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `eligible_review_date` date DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_immigrations_employee_id_foreign` (`employee_id`),
  KEY `employee_immigrations_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `employee_immigrations_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_immigrations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_interview` (
  `interview_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interview_id`,`employee_id`),
  KEY `employee_interview_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_interview_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `employee_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_meeting` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `meeting_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`meeting_id`),
  KEY `employee_meeting_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `employee_meeting_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_meeting_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_project` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  KEY `employee_project_project_id_foreign` (`project_id`),
  CONSTRAINT `employee_project_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_qualificaitons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `education_level_id` bigint(20) unsigned DEFAULT NULL,
  `institution_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `language_skill_id` bigint(20) unsigned DEFAULT NULL,
  `general_skill_id` bigint(20) unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_qualificaitons_employee_id_foreign` (`employee_id`),
  KEY `employee_qualificaitons_education_level_id_foreign` (`education_level_id`),
  KEY `employee_qualificaitons_language_skill_id_foreign` (`language_skill_id`),
  KEY `employee_qualificaitons_general_skill_id_foreign` (`general_skill_id`),
  CONSTRAINT `employee_qualificaitons_education_level_id_foreign` FOREIGN KEY (`education_level_id`) REFERENCES `qualification_education_levels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_qualificaitons_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_qualificaitons_general_skill_id_foreign` FOREIGN KEY (`general_skill_id`) REFERENCES `qualification_skills` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_qualificaitons_language_skill_id_foreign` FOREIGN KEY (`language_skill_id`) REFERENCES `qualification_languages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_support_ticket` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `support_ticket_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`support_ticket_id`),
  KEY `employee_support_ticket_support_ticket_id_foreign` (`support_ticket_id`),
  CONSTRAINT `employee_support_ticket_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_support_ticket_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_task` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`task_id`),
  KEY `employee_task_task_id_foreign` (`task_id`),
  CONSTRAINT `employee_task_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_training_list` (
  `employee_id` bigint(20) unsigned NOT NULL,
  `training_list_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`training_list_id`),
  KEY `employee_training_list_training_list_id_foreign` (`training_list_id`),
  CONSTRAINT `employee_training_list_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_training_list_training_list_id_foreign` FOREIGN KEY (`training_list_id`) REFERENCES `training_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_work_experience` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `post` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_work_experience_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_work_experience_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_shift_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `role_users_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedIn_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` double DEFAULT 0,
  `payslip_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_leave` int(14) DEFAULT 0,
  `remaining_leave` int(14) DEFAULT 0,
  `pension_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_amount` double(8,2) DEFAULT 0.00,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_office_shift_id_foreign` (`office_shift_id`),
  KEY `employees_company_id_foreign` (`company_id`),
  KEY `employees_department_id_foreign` (`department_id`),
  KEY `employees_designation_id_foreign` (`designation_id`),
  KEY `employees_location_id_foreign` (`location_id`),
  KEY `employees_role_users_id_foreign` (`role_users_id`),
  KEY `employees_status_id_foreign` (`status_id`),
  CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_office_shift_id_foreign` FOREIGN KEY (`office_shift_id`) REFERENCES `office_shifts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES('49','Ali','Jan','alijan.rahujo143@gmail.com','+923453785306','2022-03-01','Male','1','1','1','1','','2','','2022-03-01','','','','','','','','','','','','','','0','','general','0','0','','0.00','1','2022-03-13 13:06:08','2022-03-13 13:06:08');



CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `event_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_company_id_foreign` (`company_id`),
  KEY `events_department_id_foreign` (`department_id`),
  CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO events VALUES('1','1','1','asdasd','asdasd','2022-04-06','05:00PM','pending','1','2022-03-14 03:25:54','2022-03-14 03:25:54');



CREATE TABLE `expense_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_types_company_id_foreign` (`company_id`),
  CONSTRAINT `expense_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `file_manager_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `allowed_extensions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_file_size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `file_managers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_managers_department_id_foreign` (`department_id`),
  KEY `file_managers_added_by_foreign` (`added_by`),
  CONSTRAINT `file_managers_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `file_managers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_bank_cashes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payer_id` bigint(20) unsigned DEFAULT NULL,
  `deposit_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposit_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_deposits_company_id_foreign` (`company_id`),
  KEY `finance_deposits_account_id_foreign` (`account_id`),
  KEY `finance_deposits_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_deposits_payer_id_foreign` (`payer_id`),
  CONSTRAINT `finance_deposits_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_deposits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_deposits_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payee_id` bigint(20) unsigned DEFAULT NULL,
  `expense_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_expenses_company_id_foreign` (`company_id`),
  KEY `finance_expenses_account_id_foreign` (`account_id`),
  KEY `finance_expenses_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_expenses_payee_id_foreign` (`payee_id`),
  KEY `finance_expenses_category_id_foreign` (`category_id`),
  CONSTRAINT `finance_expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_expenses_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_payees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_payers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payee_id` bigint(20) unsigned DEFAULT NULL,
  `payer_id` bigint(20) unsigned DEFAULT NULL,
  `expense_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `deposit_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_transactions_company_id_foreign` (`company_id`),
  KEY `finance_transactions_account_id_foreign` (`account_id`),
  KEY `finance_transactions_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_transactions_payee_id_foreign` (`payee_id`),
  KEY `finance_transactions_payer_id_foreign` (`payer_id`),
  KEY `finance_transactions_category_id_foreign` (`category_id`),
  CONSTRAINT `finance_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `from_account_id` bigint(20) unsigned DEFAULT NULL,
  `to_account_id` bigint(20) unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_transfers_company_id_foreign` (`company_id`),
  KEY `finance_transfers_from_account_id_foreign` (`from_account_id`),
  KEY `finance_transfers_to_account_id_foreign` (`to_account_id`),
  KEY `finance_transfers_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `finance_transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transfers_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transfers_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finance_transfers_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_payment_bank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES('1','Posh & Core','logo.png','Asia/Dhaka','$','prefix','1','d-m-Y','default.css','OraSoft.pk','https://www.orasoft.pk','2020-07-25 19:00:00','2021-11-15 04:16:28');



CREATE TABLE `goal_trackings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `goal_type_id` bigint(20) unsigned NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_achievement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `goal_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_publish` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holidays_company_id_foreign` (`company_id`),
  KEY `holidays_department_id_foreign` (`department_id`),
  CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `holidays_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `indicators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `designation_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `customer_experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `professionalism` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `invoice_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_tax_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_qty` bigint(20) NOT NULL DEFAULT 0,
  `item_unit_price` bigint(20) NOT NULL,
  `item_sub_total` double NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_project_id_foreign` (`project_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `invoice_due_date` date NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `invoice_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_client_id_foreign` (`client_id`),
  KEY `invoices_project_id_foreign` (`project_id`),
  CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `ip_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_candidates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_candidates_job_id_foreign` (`job_id`),
  CONSTRAINT `job_candidates_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_category` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_interviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `interview_place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interview_date` date NOT NULL,
  `interview_time` time NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_interviews_job_id_foreign` (`job_id`),
  KEY `job_interviews_added_by_foreign` (`added_by`),
  CONSTRAINT `job_interviews_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `job_interviews_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `job_category_id` bigint(20) unsigned NOT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_vacancy` int(11) NOT NULL,
  `job_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_experience` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `closing_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_featured` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_posts_job_category_id_foreign` (`job_category_id`),
  KEY `job_posts_company_id_foreign` (`company_id`),
  CONSTRAINT `job_posts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_posts_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `leave_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allocated_day` int(11) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_types_company_id_foreign` (`company_id`),
  CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO leave_types VALUES('1','Manual','','','2022-03-12 01:42:17','2022-03-12 01:42:17');



CREATE TABLE `leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leave_type_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `leave_reason` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_half` tinyint(4) DEFAULT 0,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaves_company_id_foreign` (`company_id`),
  KEY `leaves_employee_id_foreign` (`employee_id`),
  KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  KEY `leaves_department_id_foreign` (`department_id`),
  CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_head` bigint(20) unsigned DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int(10) unsigned DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_location_head_foreign` (`location_head`),
  KEY `locations_country_foreign` (`country`),
  CONSTRAINT `locations_country_foreign` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `locations_location_head_foreign` FOREIGN KEY (`location_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO locations VALUES('1','Pakistan','','Karachi','','','','163','0','2022-03-13 12:56:51','2022-03-13 12:56:51');



CREATE TABLE `meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `meeting_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meetings_company_id_foreign` (`company_id`),
  CONSTRAINT `meetings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('2','2019_08_19_000000_create_failed_jobs_table','1');
INSERT INTO migrations VALUES('3','2020_02_09_103616_create_role_users_table','1');
INSERT INTO migrations VALUES('4','2020_02_10_00000_create_users_table','1');
INSERT INTO migrations VALUES('5','2020_02_12_091317_create_locations_table','1');
INSERT INTO migrations VALUES('6','2020_02_12_091344_create_companies_table','1');
INSERT INTO migrations VALUES('7','2020_02_12_091353_create_departments_table','1');
INSERT INTO migrations VALUES('8','2020_02_12_091742_create_statuses_table','1');
INSERT INTO migrations VALUES('9','2020_02_12_091824_create_office_shifts_table','1');
INSERT INTO migrations VALUES('10','2020_02_12_091936_create_designations_table','1');
INSERT INTO migrations VALUES('11','2020_02_12_092121_create_leave_types_table','1');
INSERT INTO migrations VALUES('12','2020_02_13_100750_create_employees_table','1');
INSERT INTO migrations VALUES('13','2020_02_14_092309_create_leaves_table','1');
INSERT INTO migrations VALUES('14','2020_02_20_115449_create_general_settings_table','1');
INSERT INTO migrations VALUES('15','2020_02_23_054028_create_permission_tables','1');
INSERT INTO migrations VALUES('16','2020_02_23_184712_add_columns_to_permission_table','1');
INSERT INTO migrations VALUES('17','2020_03_19_132718_add_employee_id_on_locations_table','2');
INSERT INTO migrations VALUES('18','2020_03_20_162201_create_announcements_table','2');
INSERT INTO migrations VALUES('19','2020_03_20_201357_create_policies_table','2');
INSERT INTO migrations VALUES('20','2020_03_22_113701_create_holidays_table','2');
INSERT INTO migrations VALUES('21','2020_03_23_100213_create_award_types_table','3');
INSERT INTO migrations VALUES('22','2020_03_23_100248_create_awards_table','3');
INSERT INTO migrations VALUES('23','2020_03_23_123604_create_transfers_table','3');
INSERT INTO migrations VALUES('24','2020_03_23_144135_create_resignations_table','3');
INSERT INTO migrations VALUES('25','2020_03_23_150510_create_travel_types_table','3');
INSERT INTO migrations VALUES('26','2020_03_23_152610_create_travels_table','3');
INSERT INTO migrations VALUES('27','2020_03_23_154228_create_promotions_table','3');
INSERT INTO migrations VALUES('28','2020_03_23_194844_create_complaints_table','3');
INSERT INTO migrations VALUES('29','2020_03_24_134301_create_warnings_type_table','3');
INSERT INTO migrations VALUES('30','2020_03_24_134304_create_warnings_table','3');
INSERT INTO migrations VALUES('31','2020_03_24_143012_create_termination_types_table','3');
INSERT INTO migrations VALUES('32','2020_03_24_143038_create_terminations_table','3');
INSERT INTO migrations VALUES('33','2020_04_06_185530_create_training_types_table','3');
INSERT INTO migrations VALUES('34','2020_04_06_190352_create_trainers_table','3');
INSERT INTO migrations VALUES('35','2020_04_07_083717_create_training_lists_table','3');
INSERT INTO migrations VALUES('36','2020_04_07_103503_create_employee_training_list_table','3');
INSERT INTO migrations VALUES('37','2020_04_08_095050_create_events_table','3');
INSERT INTO migrations VALUES('38','2020_04_08_163144_create_meetings_table','3');
INSERT INTO migrations VALUES('39','2020_04_08_163906_create_employee_meeting_table','3');
INSERT INTO migrations VALUES('40','2020_05_05_212429_create_document_types_table','3');
INSERT INTO migrations VALUES('41','2020_04_09_063646_create_finance_bank_cashes_table','4');
INSERT INTO migrations VALUES('42','2020_04_09_154642_create_finance_payees_table','4');
INSERT INTO migrations VALUES('43','2020_04_09_201357_create_finance_payers_table','4');
INSERT INTO migrations VALUES('44','2020_04_10_064405_create_payment_methods_table','4');
INSERT INTO migrations VALUES('45','2020_04_10_094429_create_expense_types_table','4');
INSERT INTO migrations VALUES('46','2020_04_10_121829_create_finance_deposits_table','4');
INSERT INTO migrations VALUES('47','2020_04_11_084040_create_finance_expenses_table','4');
INSERT INTO migrations VALUES('48','2020_04_11_164442_create_finance_transactions_table','4');
INSERT INTO migrations VALUES('49','2020_04_13_071336_create_finance_transfers_table','4');
INSERT INTO migrations VALUES('50','2020_04_13_135659_create_asset_categories_table','5');
INSERT INTO migrations VALUES('51','2020_04_13_160310_create_assets_table','5');
INSERT INTO migrations VALUES('52','2020_04_15_103730_create_file_manager_settings_table','5');
INSERT INTO migrations VALUES('53','2020_04_15_193003_create_file_managers_table','5');
INSERT INTO migrations VALUES('54','2020_04_18_094856_create_support_tickets_table','5');
INSERT INTO migrations VALUES('55','2020_04_21_052227_create_ticket_comments_table','5');
INSERT INTO migrations VALUES('56','2020_04_21_172758_create_employee_support_ticket_table','5');
INSERT INTO migrations VALUES('57','2020_04_24_070148_create_countries_table','5');
INSERT INTO migrations VALUES('58','2020_04_24_071350_create_clients_table','5');
INSERT INTO migrations VALUES('59','2020_04_25_083125_create_projects_table','5');
INSERT INTO migrations VALUES('60','2020_04_25_092544_create_employee_project_table','5');
INSERT INTO migrations VALUES('61','2020_04_27_132031_create_project_discussions_table','5');
INSERT INTO migrations VALUES('62','2020_04_27_202219_create_project_bugs_table','5');
INSERT INTO migrations VALUES('63','2020_04_28_095459_create_project_files_table','5');
INSERT INTO migrations VALUES('64','2020_04_28_172850_create_tasks_table','5');
INSERT INTO migrations VALUES('65','2020_04_28_183034_create_employee_task_table','5');
INSERT INTO migrations VALUES('66','2020_04_29_164820_create_task_discussions_table','5');
INSERT INTO migrations VALUES('67','2020_04_29_185015_create_task_files_table','5');
INSERT INTO migrations VALUES('68','2020_05_01_093124_create_tax_types_table','5');
INSERT INTO migrations VALUES('69','2020_05_02_100902_create_invoices_table','5');
INSERT INTO migrations VALUES('70','2020_05_02_110310_create_invoice_items_table','5');
INSERT INTO migrations VALUES('71','2020_05_06_085438_create_employee_immigrations_table','6');
INSERT INTO migrations VALUES('72','2020_05_07_191655_create_employee_contacts_table','6');
INSERT INTO migrations VALUES('73','2020_05_08_181821_create_employee_documents_table','6');
INSERT INTO migrations VALUES('74','2020_05_12_200437_create_qualification_education_levels_table','6');
INSERT INTO migrations VALUES('75','2020_05_16_204859_create_qualification_languages_table','6');
INSERT INTO migrations VALUES('76','2020_05_17_181817_create_qualification_skills_table','6');
INSERT INTO migrations VALUES('77','2020_05_17_191414_create_employee_qualificaitons_table','6');
INSERT INTO migrations VALUES('78','2020_05_18_191844_create_employee_work_experience_table','6');
INSERT INTO migrations VALUES('79','2020_05_19_170527_create_employee_bank_accounts_table','6');
INSERT INTO migrations VALUES('80','2020_05_22_201218_create_salary_allowances_table','6');
INSERT INTO migrations VALUES('81','2020_05_23_184036_create_salary_commissions_table','6');
INSERT INTO migrations VALUES('82','2020_05_24_085740_create_salary_deductions_table','6');
INSERT INTO migrations VALUES('83','2020_05_24_103950_create_salary_other_payments_table','6');
INSERT INTO migrations VALUES('84','2020_05_24_163618_create_salary_overtimes_table','6');
INSERT INTO migrations VALUES('85','2020_05_26_134431_create_salary_loans_table','6');
INSERT INTO migrations VALUES('86','2020_06_11_104501_create_payslips_table','7');
INSERT INTO migrations VALUES('87','2020_06_17_055449_create_calendarables_table','7');
INSERT INTO migrations VALUES('88','2020_06_19_083329_create_job_categories_table','7');
INSERT INTO migrations VALUES('89','2020_06_19_152528_create_job_employers_table','7');
INSERT INTO migrations VALUES('90','2020_06_22_052056_create_attendances_table','7');
INSERT INTO migrations VALUES('91','2020_07_05_010713_create_job_posts_table','7');
INSERT INTO migrations VALUES('92','2020_07_06_162706_create_job_candidates_table','7');
INSERT INTO migrations VALUES('93','2020_07_07_144320_create_job_interviews_table','7');
INSERT INTO migrations VALUES('94','2020_07_07_160007_create_candidate_interview_table','7');
INSERT INTO migrations VALUES('95','2020_07_07_160428_create_employee_interview_table','7');
INSERT INTO migrations VALUES('96','2020_07_25_003500_create_official_documents_table','7');
INSERT INTO migrations VALUES('97','2020_04_18_203257_create_notifications_table','8');
INSERT INTO migrations VALUES('98','2020_10_16_202848_create_c_m_s_table','9');
INSERT INTO migrations VALUES('99','2018_08_29_200844_create_languages_table','10');
INSERT INTO migrations VALUES('100','2018_08_29_205156_create_translations_table','10');
INSERT INTO migrations VALUES('101','2021_01_08_072901_create_goal_types_table','10');
INSERT INTO migrations VALUES('102','2021_01_08_165133_create_indicators_table','10');
INSERT INTO migrations VALUES('103','2021_01_09_081319_create_appraisals_table','10');
INSERT INTO migrations VALUES('104','2021_01_10_080158_create_goal_trackings_table','10');
INSERT INTO migrations VALUES('105','2021_03_28_184255_create_ip_settings_table','11');
INSERT INTO migrations VALUES('106','2021_04_05_103029_create_salary_basics_table','12');



CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO model_has_roles VALUES('1','App\\User','1');
INSERT INTO model_has_roles VALUES('1','App\\User','8');
INSERT INTO model_has_roles VALUES('1','App\\User','28');
INSERT INTO model_has_roles VALUES('1','App\\User','29');
INSERT INTO model_has_roles VALUES('1','App\\User','30');
INSERT INTO model_has_roles VALUES('1','App\\User','31');
INSERT INTO model_has_roles VALUES('1','App\\User','36');
INSERT INTO model_has_roles VALUES('1','App\\User','40');
INSERT INTO model_has_roles VALUES('1','App\\User','44');
INSERT INTO model_has_roles VALUES('1','App\\User','46');
INSERT INTO model_has_roles VALUES('1','App\\User','47');
INSERT INTO model_has_roles VALUES('1','App\\User','48');
INSERT INTO model_has_roles VALUES('2','App\\User','12');
INSERT INTO model_has_roles VALUES('2','App\\User','13');
INSERT INTO model_has_roles VALUES('2','App\\User','14');
INSERT INTO model_has_roles VALUES('2','App\\User','15');
INSERT INTO model_has_roles VALUES('2','App\\User','24');
INSERT INTO model_has_roles VALUES('2','App\\User','25');
INSERT INTO model_has_roles VALUES('2','App\\User','27');
INSERT INTO model_has_roles VALUES('2','App\\User','32');
INSERT INTO model_has_roles VALUES('2','App\\User','33');
INSERT INTO model_has_roles VALUES('2','App\\User','34');
INSERT INTO model_has_roles VALUES('2','App\\User','37');
INSERT INTO model_has_roles VALUES('2','App\\User','41');
INSERT INTO model_has_roles VALUES('2','App\\User','42');
INSERT INTO model_has_roles VALUES('2','App\\User','49');
INSERT INTO model_has_roles VALUES('3','App\\User','50');
INSERT INTO model_has_roles VALUES('4','App\\User','23');
INSERT INTO model_has_roles VALUES('4','App\\User','26');
INSERT INTO model_has_roles VALUES('4','App\\User','45');
INSERT INTO model_has_roles VALUES('5','App\\User','21');
INSERT INTO model_has_roles VALUES('5','App\\User','22');
INSERT INTO model_has_roles VALUES('6','App\\User','10');



CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `office_shifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_shift` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `sunday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sunday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `office_shifts_company_id_foreign` (`company_id`),
  CONSTRAINT `office_shifts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO office_shifts VALUES('1','Morning','','1','09:00AM','05:00PM','09:00AM','05:00PM','09:00AM','09:00AM','09:00AM','05:00PM','09:00AM','05:00PM','09:00AM','05:00PM','09:00AM','05:00PM','2022-03-13 13:04:07','2022-03-13 13:04:07');



CREATE TABLE `official_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `document_type_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `document_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `official_documents_company_id_foreign` (`company_id`),
  KEY `official_documents_document_type_id_foreign` (`document_type_id`),
  KEY `official_documents_added_by_foreign` (`added_by`),
  CONSTRAINT `official_documents_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `official_documents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `official_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES('new@gmail.com','$2y$10$day4AQ4g8sFvMwhMrTxpJuLXZCpVF2IK9kVS.6qZxeR6b7CVt2eGy','2020-10-06 04:22:35');



CREATE TABLE `payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `method_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_percentage` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_company_id_foreign` (`company_id`),
  CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payslips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payslip_key` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payslip_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL,
  `net_salary` double NOT NULL,
  `allowances` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `loans` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deductions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtimes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pension_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_amount` double NOT NULL,
  `hours_worked` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `month_year` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payslips_employee_id_foreign` (`employee_id`),
  CONSTRAINT `payslips_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES('1','user','web','','');
INSERT INTO permissions VALUES('2','view-user','web','','');
INSERT INTO permissions VALUES('3','edit-user','web','','');
INSERT INTO permissions VALUES('4','delete-user','web','','');
INSERT INTO permissions VALUES('5','last-login-user','web','','');
INSERT INTO permissions VALUES('6','role-access-user','web','','');
INSERT INTO permissions VALUES('7','details-employee','web','','');
INSERT INTO permissions VALUES('8','view-details-employee','web','','');
INSERT INTO permissions VALUES('9','store-details-employee','web','','');
INSERT INTO permissions VALUES('10','modify-details-employee','web','','');
INSERT INTO permissions VALUES('11','customize-setting','web','','');
INSERT INTO permissions VALUES('12','role-access','web','','');
INSERT INTO permissions VALUES('13','general-setting','web','','');
INSERT INTO permissions VALUES('14','view-general-setting','web','','');
INSERT INTO permissions VALUES('15','store-general-setting','web','','');
INSERT INTO permissions VALUES('16','mail-setting','web','','');
INSERT INTO permissions VALUES('17','view-mail-setting','web','','');
INSERT INTO permissions VALUES('18','store-mail-setting','web','','');
INSERT INTO permissions VALUES('19','language-setting','web','','');
INSERT INTO permissions VALUES('20','core_hr','web','','');
INSERT INTO permissions VALUES('21','view-calendar','web','','');
INSERT INTO permissions VALUES('22','promotion','web','','');
INSERT INTO permissions VALUES('23','view-promotion','web','','');
INSERT INTO permissions VALUES('24','store-promotion','web','','');
INSERT INTO permissions VALUES('25','edit-promotion','web','','');
INSERT INTO permissions VALUES('26','delete-promotion','web','','');
INSERT INTO permissions VALUES('27','award','web','','');
INSERT INTO permissions VALUES('28','view-award','web','','');
INSERT INTO permissions VALUES('29','store-award','web','','');
INSERT INTO permissions VALUES('30','edit-award','web','','');
INSERT INTO permissions VALUES('31','delete-award','web','','');
INSERT INTO permissions VALUES('32','transfer','web','','');
INSERT INTO permissions VALUES('33','view-transfer','web','','');
INSERT INTO permissions VALUES('34','store-transfer','web','','');
INSERT INTO permissions VALUES('35','edit-transfer','web','','');
INSERT INTO permissions VALUES('36','delete-transfer','web','','');
INSERT INTO permissions VALUES('37','travel','web','','');
INSERT INTO permissions VALUES('38','view-travel','web','','');
INSERT INTO permissions VALUES('39','store-travel','web','','');
INSERT INTO permissions VALUES('40','edit-travel','web','','');
INSERT INTO permissions VALUES('41','delete-travel','web','','');
INSERT INTO permissions VALUES('42','resignation','web','','');
INSERT INTO permissions VALUES('43','view-resignation','web','','');
INSERT INTO permissions VALUES('44','store-resignation','web','','');
INSERT INTO permissions VALUES('45','edit-resignation','web','','');
INSERT INTO permissions VALUES('46','delete-resignation','web','','');
INSERT INTO permissions VALUES('47','complaint','web','','');
INSERT INTO permissions VALUES('48','view-complaint','web','','');
INSERT INTO permissions VALUES('49','store-complaint','web','','');
INSERT INTO permissions VALUES('50','edit-complaint','web','','');
INSERT INTO permissions VALUES('51','delete-complaint','web','','');
INSERT INTO permissions VALUES('52','warning','web','','');
INSERT INTO permissions VALUES('53','view-warning','web','','');
INSERT INTO permissions VALUES('54','store-warning','web','','');
INSERT INTO permissions VALUES('55','edit-warning','web','','');
INSERT INTO permissions VALUES('56','delete-warning','web','','');
INSERT INTO permissions VALUES('57','termination','web','','');
INSERT INTO permissions VALUES('58','view-termination','web','','');
INSERT INTO permissions VALUES('59','store-termination','web','','');
INSERT INTO permissions VALUES('60','edit-termination','web','','');
INSERT INTO permissions VALUES('61','delete-termination','web','','');
INSERT INTO permissions VALUES('62','timesheet','web','','');
INSERT INTO permissions VALUES('63','attendance','web','','');
INSERT INTO permissions VALUES('64','view-attendance','web','','');
INSERT INTO permissions VALUES('65','edit-attendance','web','','');
INSERT INTO permissions VALUES('66','office_shift','web','','');
INSERT INTO permissions VALUES('67','view-office_shift','web','','');
INSERT INTO permissions VALUES('68','store-office_shift','web','','');
INSERT INTO permissions VALUES('69','edit-office_shift','web','','');
INSERT INTO permissions VALUES('70','delete-office_shift','web','','');
INSERT INTO permissions VALUES('71','holiday','web','','');
INSERT INTO permissions VALUES('72','view-holiday','web','','');
INSERT INTO permissions VALUES('73','store-holiday','web','','');
INSERT INTO permissions VALUES('74','edit-holiday','web','','');
INSERT INTO permissions VALUES('75','delete-holiday','web','','');
INSERT INTO permissions VALUES('76','leave','web','','');
INSERT INTO permissions VALUES('77','view-holiday','web','','');
INSERT INTO permissions VALUES('78','store-holiday','web','','');
INSERT INTO permissions VALUES('79','edit-holiday','web','','');
INSERT INTO permissions VALUES('80','delete-holiday','web','','');
INSERT INTO permissions VALUES('81','payment-module','web','','');
INSERT INTO permissions VALUES('82','view-payslip','web','','');
INSERT INTO permissions VALUES('83','make-payment','web','','');
INSERT INTO permissions VALUES('84','make-bulk_payment','web','','');
INSERT INTO permissions VALUES('85','view-paylist','web','','');
INSERT INTO permissions VALUES('86','set-salary','web','','');
INSERT INTO permissions VALUES('87','hr_report','web','','');
INSERT INTO permissions VALUES('88','report-payslip','web','','');
INSERT INTO permissions VALUES('89','report-attendance','web','','');
INSERT INTO permissions VALUES('90','report-training','web','','');
INSERT INTO permissions VALUES('91','report-project','web','','');
INSERT INTO permissions VALUES('92','report-task','web','','');
INSERT INTO permissions VALUES('93','report-employee','web','','');
INSERT INTO permissions VALUES('94','report-account','web','','');
INSERT INTO permissions VALUES('95','report-deposit','web','','');
INSERT INTO permissions VALUES('96','report-expense','web','','');
INSERT INTO permissions VALUES('97','report-transaction','web','','');
INSERT INTO permissions VALUES('98','recruitment','web','','');
INSERT INTO permissions VALUES('99','job_employer','web','','');
INSERT INTO permissions VALUES('100','view-job_employer','web','','');
INSERT INTO permissions VALUES('101','store-job_employer','web','','');
INSERT INTO permissions VALUES('102','edit-job_employer','web','','');
INSERT INTO permissions VALUES('103','delete-job_employer','web','','');
INSERT INTO permissions VALUES('104','job_post','web','','');
INSERT INTO permissions VALUES('105','view-job_post','web','','');
INSERT INTO permissions VALUES('106','store-job_post','web','','');
INSERT INTO permissions VALUES('107','edit-job_post','web','','');
INSERT INTO permissions VALUES('108','delete-job_post','web','','');
INSERT INTO permissions VALUES('109','job_candidate','web','','');
INSERT INTO permissions VALUES('110','view-job_candidate','web','','');
INSERT INTO permissions VALUES('111','store-job_candidate','web','','');
INSERT INTO permissions VALUES('112','delete-job_candidate','web','','');
INSERT INTO permissions VALUES('113','job_interview','web','','');
INSERT INTO permissions VALUES('114','view-job_interview','web','','');
INSERT INTO permissions VALUES('115','store-job_interview','web','','');
INSERT INTO permissions VALUES('116','delete-job_interview','web','','');
INSERT INTO permissions VALUES('117','project-management','web','','');
INSERT INTO permissions VALUES('118','project','web','','');
INSERT INTO permissions VALUES('119','view-project','web','','');
INSERT INTO permissions VALUES('120','store-project','web','','');
INSERT INTO permissions VALUES('121','edit-project','web','','');
INSERT INTO permissions VALUES('122','delete-project','web','','');
INSERT INTO permissions VALUES('123','task','web','','');
INSERT INTO permissions VALUES('124','view-task','web','','');
INSERT INTO permissions VALUES('125','store-task','web','','');
INSERT INTO permissions VALUES('126','edit-task','web','','');
INSERT INTO permissions VALUES('127','delete-task','web','','');
INSERT INTO permissions VALUES('128','client','web','','');
INSERT INTO permissions VALUES('129','view-client','web','','');
INSERT INTO permissions VALUES('130','store-client','web','','');
INSERT INTO permissions VALUES('131','edit-client','web','','');
INSERT INTO permissions VALUES('132','delete-client','web','','');
INSERT INTO permissions VALUES('133','invoice','web','','');
INSERT INTO permissions VALUES('134','view-invoice','web','','');
INSERT INTO permissions VALUES('135','store-invoice','web','','');
INSERT INTO permissions VALUES('136','edit-invoice','web','','');
INSERT INTO permissions VALUES('137','delete-invoice','web','','');
INSERT INTO permissions VALUES('138','ticket','web','','');
INSERT INTO permissions VALUES('139','view-ticket','web','','');
INSERT INTO permissions VALUES('140','store-ticket','web','','');
INSERT INTO permissions VALUES('141','edit-ticket','web','','');
INSERT INTO permissions VALUES('142','delete-ticket','web','','');
INSERT INTO permissions VALUES('143','import-module','web','','');
INSERT INTO permissions VALUES('144','import-attendance','web','','');
INSERT INTO permissions VALUES('145','import-employee','web','','');
INSERT INTO permissions VALUES('146','file_module','web','','');
INSERT INTO permissions VALUES('147','file_manager','web','','');
INSERT INTO permissions VALUES('148','view-file_manager','web','','');
INSERT INTO permissions VALUES('149','store-file_manager','web','','');
INSERT INTO permissions VALUES('150','edit-file_manager','web','','');
INSERT INTO permissions VALUES('151','delete-file_manager','web','','');
INSERT INTO permissions VALUES('152','view-file_config','web','','');
INSERT INTO permissions VALUES('153','official_document','web','','');
INSERT INTO permissions VALUES('154','view-official_document','web','','');
INSERT INTO permissions VALUES('155','store-official_document','web','','');
INSERT INTO permissions VALUES('156','edit-official_document','web','','');
INSERT INTO permissions VALUES('157','delete-official_document','web','','');
INSERT INTO permissions VALUES('158','event-meeting','web','','');
INSERT INTO permissions VALUES('159','meeting','web','','');
INSERT INTO permissions VALUES('160','view-meeting','web','','');
INSERT INTO permissions VALUES('161','store-meeting','web','','');
INSERT INTO permissions VALUES('162','edit-meeting','web','','');
INSERT INTO permissions VALUES('163','delete-meeting','web','','');
INSERT INTO permissions VALUES('164','event','web','','');
INSERT INTO permissions VALUES('165','view-event','web','','');
INSERT INTO permissions VALUES('166','store-event','web','','');
INSERT INTO permissions VALUES('167','edit-event','web','','');
INSERT INTO permissions VALUES('168','delete-event','web','','');
INSERT INTO permissions VALUES('169','role','web','','');
INSERT INTO permissions VALUES('170','view-role','web','','');
INSERT INTO permissions VALUES('171','store-role','web','','');
INSERT INTO permissions VALUES('172','edit-role','web','','');
INSERT INTO permissions VALUES('173','delete-role','web','','');
INSERT INTO permissions VALUES('174','assign-module','web','','');
INSERT INTO permissions VALUES('175','assign-role','web','','');
INSERT INTO permissions VALUES('176','assign-ticket','web','','');
INSERT INTO permissions VALUES('177','assign-project','web','','');
INSERT INTO permissions VALUES('178','assign-task','web','','');
INSERT INTO permissions VALUES('179','finance','web','','');
INSERT INTO permissions VALUES('180','account','web','','');
INSERT INTO permissions VALUES('181','view-account','web','','');
INSERT INTO permissions VALUES('182','store-account','web','','');
INSERT INTO permissions VALUES('183','edit-account','web','','');
INSERT INTO permissions VALUES('184','delete-account','web','','');
INSERT INTO permissions VALUES('185','view-transaction','web','','');
INSERT INTO permissions VALUES('186','view-balance_transfer','web','','');
INSERT INTO permissions VALUES('187','store-balance_transfer','web','','');
INSERT INTO permissions VALUES('188','expense','web','','');
INSERT INTO permissions VALUES('189','view-expense','web','','');
INSERT INTO permissions VALUES('190','store-expense','web','','');
INSERT INTO permissions VALUES('191','edit-expense','web','','');
INSERT INTO permissions VALUES('192','delete-expense','web','','');
INSERT INTO permissions VALUES('193','deposit','web','','');
INSERT INTO permissions VALUES('194','view-deposit','web','','');
INSERT INTO permissions VALUES('195','store-deposit','web','','');
INSERT INTO permissions VALUES('196','edit-deposit','web','','');
INSERT INTO permissions VALUES('197','delete-deposit','web','','');
INSERT INTO permissions VALUES('198','payer','web','','');
INSERT INTO permissions VALUES('199','view-payer','web','','');
INSERT INTO permissions VALUES('200','store-payer','web','','');
INSERT INTO permissions VALUES('201','edit-payer','web','','');
INSERT INTO permissions VALUES('202','delete-payer','web','','');
INSERT INTO permissions VALUES('203','payee','web','','');
INSERT INTO permissions VALUES('204','view-payee','web','','');
INSERT INTO permissions VALUES('205','store-payee','web','','');
INSERT INTO permissions VALUES('206','edit-payee','web','','');
INSERT INTO permissions VALUES('207','delete-payee','web','','');
INSERT INTO permissions VALUES('208','training_module','web','','');
INSERT INTO permissions VALUES('209','trainer','web','','');
INSERT INTO permissions VALUES('210','view-trainer','web','','');
INSERT INTO permissions VALUES('211','store-trainer','web','','');
INSERT INTO permissions VALUES('212','edit-trainer','web','','');
INSERT INTO permissions VALUES('213','delete-trainer','web','','');
INSERT INTO permissions VALUES('214','training','web','','');
INSERT INTO permissions VALUES('215','view-training','web','','');
INSERT INTO permissions VALUES('216','store-training','web','','');
INSERT INTO permissions VALUES('217','edit-training','web','','');
INSERT INTO permissions VALUES('218','delete-training','web','','');
INSERT INTO permissions VALUES('219','access-module','web','','');
INSERT INTO permissions VALUES('220','access-variable_type','web','','');
INSERT INTO permissions VALUES('221','access-variable_method','web','','');
INSERT INTO permissions VALUES('222','access-language','web','','');
INSERT INTO permissions VALUES('223','announcement','web','','');
INSERT INTO permissions VALUES('224','store-announcement','web','','');
INSERT INTO permissions VALUES('225','edit-announcement','web','','');
INSERT INTO permissions VALUES('226','delete-announcement','web','','');
INSERT INTO permissions VALUES('227','company','web','','');
INSERT INTO permissions VALUES('228','view-company','web','','');
INSERT INTO permissions VALUES('229','store-company','web','','');
INSERT INTO permissions VALUES('230','edit-company','web','','');
INSERT INTO permissions VALUES('231','delete-company','web','','');
INSERT INTO permissions VALUES('232','department','web','','');
INSERT INTO permissions VALUES('233','view-department','web','','');
INSERT INTO permissions VALUES('234','store-department','web','','');
INSERT INTO permissions VALUES('235','edit-department','web','','');
INSERT INTO permissions VALUES('236','delete-department','web','','');
INSERT INTO permissions VALUES('237','designation','web','','');
INSERT INTO permissions VALUES('238','view-designation','web','','');
INSERT INTO permissions VALUES('239','store-designation','web','','');
INSERT INTO permissions VALUES('240','edit-designation','web','','');
INSERT INTO permissions VALUES('241','delete-designation','web','','');
INSERT INTO permissions VALUES('242','location','web','','');
INSERT INTO permissions VALUES('243','view-location','web','','');
INSERT INTO permissions VALUES('244','store-location','web','','');
INSERT INTO permissions VALUES('245','edit-location','web','','');
INSERT INTO permissions VALUES('246','delete-location','web','','');
INSERT INTO permissions VALUES('247','policy','web','','');
INSERT INTO permissions VALUES('248','store-policy','web','','');
INSERT INTO permissions VALUES('249','edit-policy','web','','');
INSERT INTO permissions VALUES('250','delete-policy','web','','');
INSERT INTO permissions VALUES('251','view-cms','web','','');
INSERT INTO permissions VALUES('252','store-cms','web','','');
INSERT INTO permissions VALUES('253','store-user','web','','');
INSERT INTO permissions VALUES('254','delete-attendance','web','','');
INSERT INTO permissions VALUES('255','view-leave','web','','');
INSERT INTO permissions VALUES('256','store-leave','web','','');
INSERT INTO permissions VALUES('257','edit-leave','web','','');
INSERT INTO permissions VALUES('258','delete-leave','web','','');
INSERT INTO permissions VALUES('259','cms','web','','');
INSERT INTO permissions VALUES('260','performance','web','','');
INSERT INTO permissions VALUES('261','goal-type','web','','');
INSERT INTO permissions VALUES('262','view-goal-type','web','','');
INSERT INTO permissions VALUES('263','store-goal-type','web','','');
INSERT INTO permissions VALUES('264','edit-goal-type','web','','');
INSERT INTO permissions VALUES('265','delete-goal-type','web','','');
INSERT INTO permissions VALUES('266','goal-tracking','web','','');
INSERT INTO permissions VALUES('267','view-goal-tracking','web','','');
INSERT INTO permissions VALUES('268','store-goal-tracking','web','','');
INSERT INTO permissions VALUES('269','edit-goal-tracking','web','','');
INSERT INTO permissions VALUES('270','delete-goal-tracking','web','','');
INSERT INTO permissions VALUES('271','indicator','web','','');
INSERT INTO permissions VALUES('272','view-indicator','web','','');
INSERT INTO permissions VALUES('273','store-indicator','web','','');
INSERT INTO permissions VALUES('274','edit-indicator','web','','');
INSERT INTO permissions VALUES('275','delete-indicator','web','','');
INSERT INTO permissions VALUES('276','appraisal','web','','');
INSERT INTO permissions VALUES('277','view-appraisal','web','','');
INSERT INTO permissions VALUES('278','store-appraisal','web','','');
INSERT INTO permissions VALUES('279','edit-appraisal','web','','');
INSERT INTO permissions VALUES('280','delete-appraisal','web','','');
INSERT INTO permissions VALUES('281','assets-and-category','web','','');
INSERT INTO permissions VALUES('282','category','web','','');
INSERT INTO permissions VALUES('283','view-assets-category','web','','');
INSERT INTO permissions VALUES('284','store-assets-category','web','','');
INSERT INTO permissions VALUES('285','edit-assets-category','web','','');
INSERT INTO permissions VALUES('286','delete-assets-category','web','','');
INSERT INTO permissions VALUES('287','assets','web','','');
INSERT INTO permissions VALUES('288','view-assets','web','','');
INSERT INTO permissions VALUES('289','store-assets','web','','');
INSERT INTO permissions VALUES('290','edit-assets','web','','');
INSERT INTO permissions VALUES('291','delete-assets','web','','');
INSERT INTO permissions VALUES('292','set-permission','web','','');



CREATE TABLE `policies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policies_company_id_foreign` (`company_id`),
  KEY `policies_added_by_foreign` (`added_by`),
  CONSTRAINT `policies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `project_bugs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bug_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_bugs_user_id_foreign` (`user_id`),
  KEY `project_bugs_project_id_foreign` (`project_id`),
  CONSTRAINT `project_bugs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_bugs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `project_discussions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `project_discussion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `discussion_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_discussions_user_id_foreign` (`user_id`),
  KEY `project_discussions_project_id_foreign` (`project_id`),
  CONSTRAINT `project_discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `project_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `file_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_files_user_id_foreign` (`user_id`),
  KEY `project_files_project_id_foreign` (`project_id`),
  CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `project_priority` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not started',
  `project_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_client_id_foreign` (`client_id`),
  KEY `projects_company_id_foreign` (`company_id`),
  KEY `projects_added_by_foreign` (`added_by`),
  CONSTRAINT `projects_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `promotions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `promotion_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `promotion_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_company_id_foreign` (`company_id`),
  KEY `promotions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `promotions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `qualification_education_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_education_levels_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_education_levels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `qualification_languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_languages_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_languages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `qualification_skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_skills_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `resignations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `resignation_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resignations_company_id_foreign` (`company_id`),
  KEY `resignations_department_id_foreign` (`department_id`),
  KEY `resignations_employee_id_foreign` (`employee_id`),
  CONSTRAINT `resignations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resignations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resignations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES('7','6');
INSERT INTO role_has_permissions VALUES('8','6');
INSERT INTO role_has_permissions VALUES('9','6');
INSERT INTO role_has_permissions VALUES('10','6');
INSERT INTO role_has_permissions VALUES('11','4');
INSERT INTO role_has_permissions VALUES('11','6');
INSERT INTO role_has_permissions VALUES('13','6');
INSERT INTO role_has_permissions VALUES('14','6');
INSERT INTO role_has_permissions VALUES('15','6');
INSERT INTO role_has_permissions VALUES('16','6');
INSERT INTO role_has_permissions VALUES('17','6');
INSERT INTO role_has_permissions VALUES('18','6');
INSERT INTO role_has_permissions VALUES('21','2');
INSERT INTO role_has_permissions VALUES('22','2');
INSERT INTO role_has_permissions VALUES('23','2');
INSERT INTO role_has_permissions VALUES('24','2');
INSERT INTO role_has_permissions VALUES('25','2');
INSERT INTO role_has_permissions VALUES('26','2');
INSERT INTO role_has_permissions VALUES('27','2');
INSERT INTO role_has_permissions VALUES('28','2');
INSERT INTO role_has_permissions VALUES('29','2');
INSERT INTO role_has_permissions VALUES('30','2');
INSERT INTO role_has_permissions VALUES('31','2');
INSERT INTO role_has_permissions VALUES('32','2');
INSERT INTO role_has_permissions VALUES('33','2');
INSERT INTO role_has_permissions VALUES('34','2');
INSERT INTO role_has_permissions VALUES('35','2');
INSERT INTO role_has_permissions VALUES('36','2');
INSERT INTO role_has_permissions VALUES('38','2');
INSERT INTO role_has_permissions VALUES('39','2');
INSERT INTO role_has_permissions VALUES('41','2');
INSERT INTO role_has_permissions VALUES('42','2');
INSERT INTO role_has_permissions VALUES('43','2');
INSERT INTO role_has_permissions VALUES('44','2');
INSERT INTO role_has_permissions VALUES('46','2');
INSERT INTO role_has_permissions VALUES('47','2');
INSERT INTO role_has_permissions VALUES('48','2');
INSERT INTO role_has_permissions VALUES('49','2');
INSERT INTO role_has_permissions VALUES('50','2');
INSERT INTO role_has_permissions VALUES('51','2');
INSERT INTO role_has_permissions VALUES('52','2');
INSERT INTO role_has_permissions VALUES('53','2');
INSERT INTO role_has_permissions VALUES('54','2');
INSERT INTO role_has_permissions VALUES('55','2');
INSERT INTO role_has_permissions VALUES('56','2');
INSERT INTO role_has_permissions VALUES('57','2');
INSERT INTO role_has_permissions VALUES('58','2');
INSERT INTO role_has_permissions VALUES('59','2');
INSERT INTO role_has_permissions VALUES('60','2');
INSERT INTO role_has_permissions VALUES('61','2');
INSERT INTO role_has_permissions VALUES('145','6');
INSERT INTO role_has_permissions VALUES('169','4');
INSERT INTO role_has_permissions VALUES('169','6');
INSERT INTO role_has_permissions VALUES('170','4');
INSERT INTO role_has_permissions VALUES('170','6');
INSERT INTO role_has_permissions VALUES('171','6');
INSERT INTO role_has_permissions VALUES('172','6');
INSERT INTO role_has_permissions VALUES('173','6');
INSERT INTO role_has_permissions VALUES('220','6');
INSERT INTO role_has_permissions VALUES('221','6');
INSERT INTO role_has_permissions VALUES('222','6');
INSERT INTO role_has_permissions VALUES('292','6');



CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES('1','admin','web','Can access and change everything','1','','');
INSERT INTO roles VALUES('2','employee','web','Default access','1','2020-07-26 13:50:45','2020-07-26 13:50:45');
INSERT INTO roles VALUES('3','client','web','When you create a client, this role and associated.','1','2020-10-08 03:10:23','2020-10-08 03:10:23');
INSERT INTO roles VALUES('4','Manager','web','Can Manage','1','2021-02-24 10:24:58','2021-02-24 10:24:58');
INSERT INTO roles VALUES('5','Editor','web','Custom access','1','2021-02-24 10:24:58','2021-02-24 10:24:58');
INSERT INTO roles VALUES('6','HR','web','','1','2021-09-05 03:12:28','2021-09-05 03:12:28');



CREATE TABLE `salary_allowances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `allowance_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowance_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_taxable` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_allowances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_allowances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_basics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `payslip_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_basics_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_basics_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_commissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `commission_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_commissions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_commissions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_deductions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `deduction_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_deductions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_deductions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_loans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `loan_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_remaining` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_remaining` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_payable` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_loans_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_loans_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_other_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_date` date DEFAULT NULL,
  `other_payment_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payment_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_other_payments_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_other_payments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_overtimes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `overtime_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_hours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_overtimes_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_overtimes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `support_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `ticket_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_priority` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_remarks` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `ticket_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `support_tickets_ticket_code_unique` (`ticket_code`),
  KEY `support_tickets_company_id_foreign` (`company_id`),
  KEY `support_tickets_department_id_foreign` (`department_id`),
  KEY `support_tickets_employee_id_foreign` (`employee_id`),
  CONSTRAINT `support_tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `support_tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `support_tickets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `task_discussions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `task_discussion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_discussions_user_id_foreign` (`user_id`),
  KEY `task_discussions_task_id_foreign` (`task_id`),
  CONSTRAINT `task_discussions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `task_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `file_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_files_user_id_foreign` (`user_id`),
  KEY `task_files_task_id_foreign` (`task_id`),
  CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `task_hour` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not started',
  `task_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_company_id_foreign` (`company_id`),
  KEY `tasks_added_by_foreign` (`added_by`),
  CONSTRAINT `tasks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `tax_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `termination_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `termination_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `terminations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `terminated_employee` bigint(20) unsigned NOT NULL,
  `termination_type` bigint(20) unsigned DEFAULT NULL,
  `termination_date` date NOT NULL,
  `notice_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terminations_company_id_foreign` (`company_id`),
  KEY `terminations_terminated_employee_foreign` (`terminated_employee`),
  KEY `terminations_termination_type_foreign` (`termination_type`),
  CONSTRAINT `terminations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `terminations_terminated_employee_foreign` FOREIGN KEY (`terminated_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `terminations_termination_type_foreign` FOREIGN KEY (`termination_type`) REFERENCES `termination_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `ticket_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ticket_comments` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `trainers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expertise` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainers_company_id_foreign` (`company_id`),
  CONSTRAINT `trainers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `training_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `training_cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `trainer_id` bigint(20) unsigned DEFAULT NULL,
  `training_type_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_lists_company_id_foreign` (`company_id`),
  KEY `training_lists_trainer_id_foreign` (`trainer_id`),
  KEY `training_lists_training_type_id_foreign` (`training_type_id`),
  CONSTRAINT `training_lists_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `training_lists_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `training_lists_training_type_id_foreign` FOREIGN KEY (`training_type_id`) REFERENCES `training_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `training_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `from_department_id` bigint(20) unsigned DEFAULT NULL,
  `to_department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_company_id_foreign` (`company_id`),
  KEY `transfers_from_department_id_foreign` (`from_department_id`),
  KEY `transfers_to_department_id_foreign` (`to_department_id`),
  KEY `transfers_employee_id_foreign` (`employee_id`),
  CONSTRAINT `transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_from_department_id_foreign` FOREIGN KEY (`from_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_to_department_id_foreign` FOREIGN KEY (`to_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `travel_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `arrangement_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_types_company_id_foreign` (`company_id`),
  CONSTRAINT `travel_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `travels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `travel_type` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actual_budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travels_company_id_foreign` (`company_id`),
  KEY `travels_employee_id_foreign` (`employee_id`),
  KEY `travels_travel_type_foreign` (`travel_type`),
  CONSTRAINT `travels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travels_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travels_travel_type_foreign` FOREIGN KEY (`travel_type`) REFERENCES `travel_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_bg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_users_id` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_date` timestamp(2) NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_users_id_foreign` (`role_users_id`),
  CONSTRAINT `users_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Hasnain','Rashid','admin','hasnainrashid1234@gmail.com','','$2y$10$Kvjut1QYWY9d3CabKzF71OWyGSgVLonc81k2JAzkXPxo6VsJzLNiK','admin_1647068552.png','','1','1','1234','182.182.17.97','2022-03-14 15:07:44.00','0WAJTqpmLfdkQhHEZFI5SujpD4lemSvqHHQnHdXXbN6gz1nYb2cMkMbtBmX1','','2022-03-12 13:02:32','');
INSERT INTO users VALUES('49','Ali','Jan','employee','alijan.rahujo143@gmail.com','','$2y$10$sGmf8aN.oDwVCEYh0ZMwneTTca4C5ZFTLYGdxk6WoYNKxy06I7gXW','','','2','1','+923453785306','72.255.58.241','2022-03-14 03:31:12.00','','2022-03-13 13:06:08','2022-03-13 13:06:08','');
INSERT INTO users VALUES('50','Faraz','Ali','client','faraz@gmail.com','','$2y$10$Oi8MwO6bzfWaeJMaa.YvbuG8y.fAPdVmu6DxMpvxMaIIVgT6/S7AK','','','3','1','03453785306','72.255.58.241','2022-03-14 03:30:17.00','','2022-03-13 13:10:48','2022-03-13 13:10:48','');



CREATE TABLE `warnings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `warning_to` bigint(20) unsigned NOT NULL,
  `warning_type` bigint(20) unsigned DEFAULT NULL,
  `warning_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warnings_company_id_foreign` (`company_id`),
  KEY `warnings_warning_to_foreign` (`warning_to`),
  KEY `warnings_warning_type_foreign` (`warning_type`),
  CONSTRAINT `warnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warnings_warning_to_foreign` FOREIGN KEY (`warning_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warnings_warning_type_foreign` FOREIGN KEY (`warning_type`) REFERENCES `warnings_type` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `warnings_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warning_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


SET foreign_key_checks = 1;