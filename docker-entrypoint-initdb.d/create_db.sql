CREATE DATABASE IF NOT EXISTS tourradar;
GRANT insert,create,select on tourradar.* to tr@'%' identified by 'tr';
FLUSH privileges;
USE tourradar;
CREATE TABLE IF NOT EXISTS `log`  (
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `ip` VARCHAR(40) NOT NULL DEFAULT '0.0.0.0',
    `user` VARCHAR(15) NULL DEFAULT NULL,
    `logdate` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
    `method` VARCHAR(8) NULL DEFAULT NULL,
    `file` VARCHAR(200) NOT NULL,
    `proto` VARCHAR(10) NULL DEFAULT NULL,
    `answer` SMALLINT(3) UNSIGNED NULL DEFAULT NULL,
    `bytes` INT(10) UNSIGNED NULL DEFAULT '0',
    `referer` TEXT NULL,
    `user_agent` TINYTEXT NULL,
    `host` VARCHAR(50) NULL DEFAULT '-',
    PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
ALTER TABLE tourradar.log PARTITION BY HASH(id) PARTITIONS 10;
