-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mealmagicdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mealmagicdb` ;

-- -----------------------------------------------------
-- Schema mealmagicdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mealmagicdb` DEFAULT CHARACTER SET utf8 ;
USE `mealmagicdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `created_date` DATETIME NOT NULL,
  `last_updated` DATETIME NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `user_bio` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `country` ;

CREATE TABLE IF NOT EXISTS `country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `continent` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `country_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `cooking_instructions` TEXT NULL,
  `number_of_serving` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `calories` INT NULL,
  `prep_time` VARCHAR(45) NULL,
  `yield` TEXT NULL,
  `notes` TEXT NULL,
  `cook_time` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_country1_idx` (`country_id` ASC),
  INDEX `fk_recipe_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_recipe_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient` ;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_ingredient` ;

CREATE TABLE IF NOT EXISTS `recipe_ingredient` (
  `recipe_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  `amount` VARCHAR(45) NOT NULL,
  `food_prep` VARCHAR(100) NULL,
  PRIMARY KEY (`recipe_id`, `ingredient_id`),
  INDEX `fk_recipe_has_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  INDEX `fk_recipe_has_ingredient_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_has_ingredient_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `remarks` TEXT NOT NULL,
  `user_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `posted_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `rating` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rate_comment` INT NULL,
  INDEX `fk_Rating_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_Rating_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`recipe_id`, `user_id`),
  CONSTRAINT `fk_Rating_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_image` ;

CREATE TABLE IF NOT EXISTS `recipe_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(2000) NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_image_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_image_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dietary_preference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dietary_preference` ;

CREATE TABLE IF NOT EXISTS `dietary_preference` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dietary_preference_has_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dietary_preference_has_recipe` ;

CREATE TABLE IF NOT EXISTS `dietary_preference_has_recipe` (
  `dietary_preferences_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`dietary_preferences_id`, `recipe_id`),
  INDEX `fk_dietary_preferences_has_recipe_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_dietary_preferences_has_recipe_dietary_preferences1_idx` (`dietary_preferences_id` ASC),
  CONSTRAINT `fk_dietary_preferences_has_recipe_dietary_preferences1`
    FOREIGN KEY (`dietary_preferences_id`)
    REFERENCES `dietary_preference` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dietary_preferences_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category_has_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_has_recipe` ;

CREATE TABLE IF NOT EXISTS `category_has_recipe` (
  `category_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `recipe_id`),
  INDEX `fk_category_has_recipe_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_category_has_recipe_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_recipe_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_favorite` ;

CREATE TABLE IF NOT EXISTS `user_has_favorite` (
  `user_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `recipe_id`),
  INDEX `fk_user_has_recipe_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_user_has_recipe_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS admin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `created_date`, `last_updated`, `first_name`, `last_name`, `user_bio`, `image_url`) VALUES (1, 'admin', 'admin', 1, 'ADMIN', '2022-12-22 00:00:00', '2022-12-22 00:00:00', 'Owner', 'larry', 'I like to eat', 'https://res.cloudinary.com/practicaldev/image/fetch/s--43JNAc-c--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/ga0f1mk0u10izyfx4td1.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `country`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `country` (`id`, `name`, `continent`, `region`) VALUES (1, 'United States', 'North America', 'mid-west');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`) VALUES (1, 'Pumpkin Pie', 'Pumpkin Pie is a traditional holiday dessert typically made with sugar pumpkins which are small and round. The crust is usually very flaky. In order to maintain its form, the pie is baked with a couple eggs.', 1, 'https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg', 'Combine all ingredients into a large mixing bowl adding spices as desired (measurements are recommendations). While mixing blind bake pie crust ensuring no bubbles in crust by poking the bottom with a fork. Once ingredients are combined, fill pie shell at the oven. Be cautious of pouring too quickly. Splatters on the crust are not recommended.', '8', 1, 250, '1 hour', 'one pie', 'you can add whip cream as a topping', '1 hour');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (1, 'pumpkin', 'https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg', 'get pumpkin stuffing out and then put in oven');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'dessert');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 1, '5', '1 chopped pumpkin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (1, 'This is the best pie ever', 1, 1, '2022-12-22 00:00:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (5, 1, 1, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (1, 'https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dietary_preference`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `dietary_preference` (`id`, `name`, `description`) VALUES (1, 'dairy', 'may contain milk');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dietary_preference_has_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category_has_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_favorite`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `user_has_favorite` (`user_id`, `recipe_id`) VALUES (1, 1);

COMMIT;

