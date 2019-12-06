
ALTER TABLE `remettences`.`country` ADD COLUMN `iso` VARCHAR(3)  AFTER `alternativeName3`;


ALTER TABLE `remettences`.`user` ADD COLUMN `languageId` BIGINT(3)  DEFAULT NULL AFTER `enabled`,
 ADD INDEX `fk_user_lagnguage`(`languageId`),
 ADD CONSTRAINT `fk_user_lagnguage` FOREIGN KEY `fk_user_lagnguage` (`languageId`)
    REFERENCES `language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


