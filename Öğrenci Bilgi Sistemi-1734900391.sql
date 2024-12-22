CREATE TABLE IF NOT EXISTS `Öğrenciler` (
	`dogum_tarihi` date,
	`email` varchar(255) DEFAULT '100',
	`ogrenci_id` int NOT NULL,
	`ad` varchar(255) DEFAULT '100',
	`soyad` varchar(255) DEFAULT '100',
	`tc_no` varchar(255) DEFAULT '11',
	`telefon` varchar(255) DEFAULT '15',
	`bölüm_id` int,
	`danışman_id` int,
	`kayıt_tarihi` date,
	PRIMARY KEY (`ogrenci_id`)
);

CREATE TABLE IF NOT EXISTS `Bölümler` (
	`bölüm_id` int NOT NULL,
	`bölüm_adı` varchar(255) DEFAULT '100',
	`fakülte` varchar(255) DEFAULT '100',
	`bölüm_kodu` varchar(255) DEFAULT '10',
	`kuruluş_tarihi` date,
	`öğrenci_sayısı` int,
	`danışman_sayısı` int,
	`ders_sayısı` int,
	`bölüm_yönetimi` varchar(255) DEFAULT '100',
	`açık_dersler` varchar(255) DEFAULT '255',
	PRIMARY KEY (`bölüm_id`)
);

CREATE TABLE IF NOT EXISTS `Dersler` (
	`ders_id` int NOT NULL,
	`ders_adı` varchar(255) DEFAULT '100',
	`kredi` int,
	`dönem` varchar(255) DEFAULT '10',
	`öğretim_üyesi_id` int,
	`bölüm_id` int,
	`ders_kodu` varchar(255) DEFAULT '10',
	`önkoşul_dersler` varchar(255) DEFAULT '255',
	`açıklama` text,
	`ders_türü` varchar(255) DEFAULT '50',
	PRIMARY KEY (`ders_id`)
);

CREATE TABLE IF NOT EXISTS `Öğretim Üyeleri` (
	`ad` varchar(255) DEFAULT '100',
	`email` varchar(255) DEFAULT '100',
	`öğretim_üyesi_id` int NOT NULL,
	`soyad` varchar(255) DEFAULT '100',
	`telefon` varchar(255) DEFAULT '15',
	`bölüm_id` int,
	`unvan` varchar(255) DEFAULT '50',
	`danışmanlık_sayısı` int,
	`araştırma_alanı` varchar(255) DEFAULT '100',
	`çalışma_yılları` int,
	PRIMARY KEY (`öğretim_üyesi_id`)
);

CREATE TABLE IF NOT EXISTS `Ders Atamaları` (
	`dönem` varchar(255) DEFAULT '10',
	`yıl` int,
	`saat` time,
	`oda` varchar(255) DEFAULT '10',
	`açıklama` text,
	`öğrenci_sayısı` int,
	`atama_id` int NOT NULL,
	`ders_id` int,
	`durum` varchar(255) DEFAULT '20',
	`öğretim_üyesi_id` int,
	PRIMARY KEY (`atama_id`)
);

CREATE TABLE IF NOT EXISTS `Ders Kayıtları` (
	`kayıt_id` int NOT NULL,
	`öğretim_üyesi_id` int,
	`ogrenci_id` int,
	`ders_id` int,
	`dönem` varchar(255) DEFAULT '10',
	`yıl` int,
	`not` float,
	`durum` varchar(255) DEFAULT '20',
	`kayıt_tarihi` date,
	`açıklama` text,
	PRIMARY KEY (`kayıt_id`)
);

CREATE TABLE IF NOT EXISTS `Danışmanlar` (
	`danışman_id` int NOT NULL,
	`ad` varchar(255) DEFAULT '100',
	`soyad` varchar(255) DEFAULT '100',
	`email` varchar(255) DEFAULT '100',
	`telefon` varchar(255) DEFAULT '15',
	`danışmanlık_türü` varchar(255) DEFAULT '50',
	`danışmanlık_sayısı` int,
	`çalışma_yılları` int,
	`bölüm_id` int,
	`açıklama` text,
	PRIMARY KEY (`danışman_id`)
);

ALTER TABLE `Öğrenciler` ADD CONSTRAINT `Öğrenciler_fk7` FOREIGN KEY (`bölüm_id`) REFERENCES `Bölümler`(`bölüm_id`);

ALTER TABLE `Öğrenciler` ADD CONSTRAINT `Öğrenciler_fk8` FOREIGN KEY (`danışman_id`) REFERENCES `Danışmanlar`(`danışman_id`);

ALTER TABLE `Dersler` ADD CONSTRAINT `Dersler_fk4` FOREIGN KEY (`öğretim_üyesi_id`) REFERENCES `Öğretim Üyeleri`(`öğretim_üyesi_id`);

ALTER TABLE `Dersler` ADD CONSTRAINT `Dersler_fk5` FOREIGN KEY (`bölüm_id`) REFERENCES `Bölümler`(`bölüm_id`);
ALTER TABLE `Öğretim Üyeleri` ADD CONSTRAINT `Öğretim Üyeleri_fk5` FOREIGN KEY (`bölüm_id`) REFERENCES `Bölümler`(`bölüm_id`);
ALTER TABLE `Ders Atamaları` ADD CONSTRAINT `Ders Atamaları_fk7` FOREIGN KEY (`ders_id`) REFERENCES `Dersler`(`ders_id`);

ALTER TABLE `Ders Atamaları` ADD CONSTRAINT `Ders Atamaları_fk9` FOREIGN KEY (`öğretim_üyesi_id`) REFERENCES `Öğretim Üyeleri`(`öğretim_üyesi_id`);
ALTER TABLE `Ders Kayıtları` ADD CONSTRAINT `Ders Kayıtları_fk1` FOREIGN KEY (`öğretim_üyesi_id`) REFERENCES `Öğretim Üyeleri`(`öğretim_üyesi_id`);

ALTER TABLE `Ders Kayıtları` ADD CONSTRAINT `Ders Kayıtları_fk2` FOREIGN KEY (`ogrenci_id`) REFERENCES `Öğrenciler`(`ogrenci_id`);

ALTER TABLE `Ders Kayıtları` ADD CONSTRAINT `Ders Kayıtları_fk3` FOREIGN KEY (`ders_id`) REFERENCES `Dersler`(`ders_id`);
ALTER TABLE `Danışmanlar` ADD CONSTRAINT `Danışmanlar_fk8` FOREIGN KEY (`bölüm_id`) REFERENCES `Bölümler`(`bölüm_id`);