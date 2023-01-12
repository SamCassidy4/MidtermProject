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
  `created_date` DATETIME NULL,
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
  `enabled` TINYINT NOT NULL DEFAULT 1,
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
  `amount` VARCHAR(45) NULL,
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
  `rating` INT NULL,
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
INSERT INTO `country` (`id`, `name`, `continent`, `region`) VALUES (2, 'Mexico', 'North America', 'all regions');
INSERT INTO `country` (`id`, `name`, `continent`, `region`) VALUES (3, 'Columbia', 'South America', 'all regions');
INSERT INTO `country` (`id`, `name`, `continent`, `region`) VALUES (4, 'Thailand', 'Asia', 'central');
INSERT INTO `country` (`id`, `name`, `continent`, `region`) VALUES (5, 'Italy', 'Europe', 'all regions');
INSERT INTO `country` (`id`, `name`, `continent`, `region`) VALUES (6, 'Poland', 'Europe', 'southeastern eruope');
INSERT INTO `country` (`id`, `name`, `continent`, `region`) VALUES (7, 'Lebanon', 'Asia', 'all region');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (1, 'Pumpkin Pie', 'Pumpkin Pie is a traditional holiday dessert typically made with sugar pumpkins which are small and round. The crust is usually very flaky. In order to maintain its form, the pie is baked with a couple eggs.', 1, 'https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg', 'Combine all ingredients into a large mixing bowl adding spices as desired (measurements are recommendations). While mixing blind bake pie crust ensuring no bubbles in crust by poking the bottom with a fork. Once ingredients are combined, fill pie shell at the oven. Be cautious of pouring too quickly. Splatters on the crust are not recommended.', '8', 1, 250, '1 hour', 'one pie', 'you can add whip cream as a topping', '1 hour', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (2, 'Beijing Beef', 'Crispy beef strips with onion and red bell pepper in a tangy and sweet sticky sauce with just a touch of heat.', 1, 'https://modernmealmakeover.com/wp-content/uploads/2022/11/IMG-0775-1-800x530.jpg.webp', 'Cut the beef very thinly, about 1/8 of an inch, against the grain. This is very important to ensure tender beef.\nTIP: Freeze the beef for 30-60 minutes prior to cutting. This helps make thin, precise cuts. And use a very sharp knife!\n\nCut the beef very thinly, about 1/8 of an inch, against the grain. This is very important to ensure tender beef.\nTIP: Freeze the beef for 30-60 minutes prior to cutting. This helps make thin, precise cuts. And use a very sharp knife!\nCombine beef with marinade in a bowl and set aside to marinate while chopping the veggies and mixing the sauce.\nWhen everything is ready to go, get your oil nice and hot in a wok. Dredge beef strips in corn starch and fry 6-7 minutes. Don’t overcrowd them, as they will steam. Work in batches if needed. Remove from the wok and set aside.\nRemove most of the oil and increase the heat. Add in onion, bell pepper and garlic and stir fry for a minute. Pour in sauce, stir and simmer for another minute. Then, add in the fried beef strips and toss well to coat with the sauce. Done!', '6', 1, 420, '10 minutes ', 'One pan ', 'On absence of sambal, you can use 1 tablespoon of sriracha or gochujang, one one teaspoon of red chili flakes.', '20 minutes ', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (3, 'Huevos Rancheros ', 'A classic Mexican breakfast, huevos rancheros (translated \"ranch eggs\") are fried eggs served on a lightly fried corn tortillas and smothered in cooked salsa.', 2, 'https://bellyfull.net/wp-content/uploads/2021/04/Huevos-Rancheros-blog-500x500.jpg', 'Sauté onions on skillet on medium heat, then add tomatoes. Next add green chiles and add additional seasoning to taste. Prepare tortillas on a skillet pan on medium heat and heat tortillas on each side. Fry  the eggs for 3 to 4 minutes for runny yolk. Serve!', '2 or 4', 1, 227, '20 mins', '1 skillet pan', 'You can also scramble the eggs instead and black beans, sliced avocados, shredded cheese, chorizo and Mexican rice! ', '20 mins', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (4, 'Carne Asada', 'Grilled Carne Asada tastes better and looks more beautiful than it has a right to, if you judge a meal by the amount of effort it takes. And it\'s a sensory pleasure before it even touches the grill! As you squeeze fresh orange, lime and lemon juices for the marinade, then whisk in cilantro, garlic and jalapeño, the aroma that floats up to your nose is nothing short of heavenly.', 2, 'https://www.closetcooking.com/wp-content/uploads/2013/05/Carne-Asada-500-7755.jpg', 'Once the marinade is mixed together, simply pour it over the steak in a large baking dish, bowl or large zip-top bag and refrigerate for 2 to 4 hours. Once the meat has been marinated, remove it from the marinade and pat it dry. Then drizzle both sides with a little bit of olive oil so it doesn’t stick on the grill and season it lightly with coarse salt and black pepper.\nPlace it on the grill over medium-high heat for about 8 to 10 minutes per side, depending on the thickness of the meat and then let it rest for 5 minutes before slicing it thinly against the grain.', '8', 1, 166, '2-5 hours', '1 grilled pan ', 'Cook time will vary depending on the thickness of the meat. Grilling time for skirt steak will be closer to 4 minutes per side and flank steak will be closer to 6-8 minutes per side. You can also use a meat thermometer for accuracy', '20 mins', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (5, 'Chalao(Exotic Fruit Salad)', 'This is a typical fruit salad from the department of Valle del Cauca. It is prepared on a base of shaved ice, fruits, different flavored syrups, and condensed milk. Fruits include banana, green apple, strawberry, grapes, papaya, and pineapple. On a hot afternoon, enjoy this refreshing sweet that has all the flavors of the Latin land.', 3, 'https://www.chefspencil.com/wp-content/uploads/Cholao.jpg.webp', 'Mix the chopped fruit in a medium sized bowl.\nTo serve, place 3/4 - 1 cup of chopped fruit in a small bowl. Add the heavy cream and mix well. Sprinkle with half the amount of mozzarella cheese. Decorate with as much whipped cream as you want and place 1-2 scoops of ice cream on top. If you want, you can also add a little bit of sweetened condensed milk on top', '4', 1, 168, '10 minutes', '2-3 cups', 'Can add Tajin', '10 mins', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (6, 'Thai Green Curry', 'This Thai Green Curry is an absolute flavor bomb, with spicy, salty, umami and sweet Thai flavors. You can customize it from mild to Thai Hot!', 4, 'https://www.kitchensanctuary.com/wp-content/uploads/2019/06/Thai-Green-Curry-square-FS.jpg', '1.	Heat oil in a curry pot. Add in chicken and sauté till it is no longer pink. Stir in 4 Tbsp Thai green curry paste and cook for 5-6 minutes. Add in ginger, garlic and carrots, sauté for another 2-3 minutes.\n	2.	Add in coconut milk along with chicken stock, soy sauce, fish sauce, brown sugar, basil leaves, and lemongrass (only the inside white part, bruised slightly). Let it simmer for 10-15 minutes for all the flavors to develop.\n	3.	Add in veggies like broccoli, bell peppers, zucchini, and Thai eggplants. Cook for 5-6 minutes, or until they start to get soft.\n	4.	Taste for salt, sugar and spice and adjust according to your taste by adding sugar, fish sauce or more green curry paste.\n	5.	Add snap peas and cook for 2-3 minutes.\n	6.	Serve it with some more fresh basil leaves, lime wedges, and white jasmine or basmati rice.', '4', 1, 352, '15 mins', '1 pan', 'Green curry IS spicy so if using a jar paste, it\'s hard to reduce spiciness without affecting flavour, but you can (usually) reduce down to 4 tbsp and still have decent green curry flavour (every brand differs!).', '20 mins', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (7, 'Air Fried Salmon', 'For the fastest meal ever, turn to your air fryer. This salmon cooks in just 10 minutes and comes out perfectly tender and flaky on the inside with an amazing top crust.', 1, 'https://hips.hearstapps.com/hmg-prod/images/air-fryer-salmon2-1653573828.jpg?resize=480:*', 'Season salmon all over with salt and black pepper. In a small bowl, whisk garlic, mustard, brown sugar, oil, and thyme to combine. Spread garlic mixture on top of salmon. In an air-fryer basket, arrange salmon. Cook at 400° until desired degree of doneness, about 10 minutes.', '2', 1, 290, '5 minutes', '1 air fried pan', 'You can also do this recipe on the stove ', '10 mins', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (8, 'Sparkling Peach Bellinis', 'Refreshing and bubbly, a Peach Bellini is a light and frosty/They’re the perfect cocktail for brunch, happy hour and holidays!', 5, 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Sparkling-Peach-Bellinis_EXPS_BMZ17_37526_C10_28_4b-5.jpg?fit=700,1024', 'Preheat the oven to 375F, Line a baking sheet with foil, place peach halves cut side up on foil, drizzle with honey\nBake for 25-30 minutes or until tender, cool completely, discard peels. Blend peaches until smooth\nTransfer peach puree to a pitcher, add the nectar and 1 bottle of champagne, stir until combined.', '8', 1, 74, '35', '12 drinks', 'You add any fruit toppings ', '30min', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (9, 'Polish Pierogi', 'They are half-circular dumplings usually made from noodle flour dough, and sometimes from pastry dough. Pierogi are stuffed in a similar fashion to many other types of dumplings, for example the Japanese gyoza or the Italian ravioli.', 6, 'https://annainthekitchen.com/wp-content/uploads/2022/01/pierogi-1-720x540.jpg', 'Whisk eggs, water and salt until blended, gradually stir in flour in a bowl. Transfer to a lightly floured surface; knead 10-12 times, forming a firm dough. Cover and let rest for 10 minutes\nIn a small bowl, whisk egg, salt, sugar and pepper. Stir in cheese for filling\nDivide dough into 4 portions. Roll each portion to 1/8-in thickness; cut with floured 4 in cookie cutter. Place 1 tablespoon filling in center of each circle. Moisten edges with water; fold in half and press edges to seal. Repeat as needed\nIn a pot bring water to a boil. Add pierogi in batches; reduce heat to simmer. Cook until pierogi float. Should take 2-3 minutes\nIn a large skillet, heat 1 tablespoon of butter over medium high heat. Add pierogi in batches; cook until golden brown, 1-3 minutes on each side.', '8', 1, 74, '40 min', 'I pan', 'Pierogi from the grocery store are made with cheddar cheese. But the secret to authentic polish pierogi filling is farmers cheese.', '1 hour', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (10, 'Rose Water Rice Pudding', 'Rose water rice pudding is a popular Middle Eastern treat. Pomegranate seeds and chopped pistachios add a simple yet elegant touch to this floral Lebanese specialty', 7, 'https://images.squarespace-cdn.com/content/v1/589cc888cd0f6820a50a1347/1530111137208-TAM06ZUOHIBL5SI4NG79/Bread+and+Salt+-+Rice+Pudding%2C+Cropped.jpg', 'In a heavy saucepan, combine water and rice; bring to a boil over medium heat. Reduce heat; cover and simmer until water is absorbed, about 15 minutes. Add cream and sugar; bring to a boil. Reduce heat; simmer, uncovered, until slightly thickened, 30-40 minutes. Stir in rose water. Refrigerate until chilled, at least 2 hours. Stir in additional cream to reach desired consistency. If desired, top with pomegranate seeds and pistachios', '14', 1, 281, '30 mins', '1 pan', 'You can use leftover rice to make this, so it’s a great way to use up a big batch of cooked rice', '1 hour', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (11, 'Key Lime Pie ', 'This key lime pie is an American classic. Ours is made with lime juice and sweetened condensed milk in a graham cracker crust and topped with whipped cream. Use key limes if you have them, otherwise substitute regular limes.', 1, 'https://toriavey.com/images/2016/06/IMG_7708-2.jpg', 'In a large bowl, beat cream cheese until smooth. Beat in milk and lime juice until blended. Transfer to crust. Refrigerate, covered at least 4 hours. Just before serving, garnish with whipped topping and if desired, lime slices', '8', 1, 417, '30 mins', '1 pie', 'Key limes are great if you can get them! They\'re from the Florida Keys, where they now grow wild. They are smaller and more tart than our standard Persian limes, and they have yellow centers and rinds', '1 hour', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `country_id`, `image_url`, `cooking_instructions`, `number_of_serving`, `user_id`, `calories`, `prep_time`, `yield`, `notes`, `cook_time`, `enabled`) VALUES (12, 'Preztel Gelatin Dessert', 'The salty pretzel crust is the perfect complement to the sweet cream cheese filling', 1, 'https://www.simplyhappyfoodie.com/wp-content/uploads/2019/05/strawberry-pretzel-jello-salad-2.jpg', 'Preheat oven to 350. Mix crushed pretzels, melted butter and sugar; press onto bottom of an ungreased 13x9-in baking dish. Bake 10 minutes. Cool completely\nFor filling, beat cream cheese and sugar until smooth. Stir in whipped topping; spread over crust. Refrigerate, covered, until cold\nIn a small bowl, dissolve gelatin in boiling water. Stir in cold water; refrigerate until partially set. Pour carefully over filling. Refrigerate, covered, until firm, 4 -6 hours.\nCut into squares. If desired, serve with strawberries and additional whipped topping', '12', 1, 401, '35 mins', '1 pan', 'place pretzel in a zip bag and beat them as a trick', '45 mins', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (1, 'pumpkin', 'https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg', 'get pumpkin stuffing out and then put in oven');
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (2, 'sugar', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (3, 'salt', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (4, 'cinnamon', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (5, 'ginger', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (6, 'nutmeg', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (7, 'clove', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (8, 'egg', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (9, 'milk', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (10, 'evaporated milk', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (11, 'pastry shell', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (12, 'steak ', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (13, 'soy sauce', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (14, 'rice vinegar ', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (15, 'black pepper', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (16, 'brown sugar', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (17, 'sambal oelek', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (18, 'corn starch ', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (19, 'cooking oil', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (20, 'garlic', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (21, 'onion', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (22, 'red bell pepper', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (23, 'Extra virgin olive oil ', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (24, 'tomatoes', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (25, 'anaheim chile', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (26, 'chili powder', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (27, 'tortillas', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (28, 'butter', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (29, 'cilantro ', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (30, 'jalapeño', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (31, 'orange', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (32, 'lime', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (33, 'white wine vinegar', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (34, 'salt', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (35, 'cumin', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (36, 'oregano', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (37, 'ancho chili powder', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (38, 'flank steak ', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (39, 'strawberry', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (40, 'kiwi', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (41, 'mango', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (42, 'papaya', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (43, 'pineapple', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (44, 'green apple', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (45, 'heavy cream', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (46, 'mozzarella cheese', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (47, 'whipped cream', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (48, 'vanilla ice cream', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (49, 'oil', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (50, 'chicken breast', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (51, 'thai green curry', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (52, 'coconut milk', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (53, 'chicken stock', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (54, 'broccoli', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (55, 'carrot', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (56, 'green pepper', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (57, 'zucchini', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (58, 'thai eggplant', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (59, 'snap peas', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (60, 'fish sauce', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (61, 'lemongrass', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (62, 'basil', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (63, 'salmon', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (64, 'thyme', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (65, 'peach', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (66, 'honey', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (67, 'peach nectar', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (68, 'champagne', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (69, 'water', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (70, 'all-purpose flour', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (71, 'whole-milk ricotta cheese', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (72, 'long grain rice', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (73, 'half and half cream', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (74, 'rose water', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (75, 'pomegranate seeds', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (76, 'pistachio', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (77, 'cream cheese', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (78, 'condensed milk', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (79, 'key lime juice', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (80, 'graham cracker crust', NULL, NULL);
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (81, 'pretzel', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'dessert');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'American/Chinese');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'Mexican');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'Columbian');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Thai');
INSERT INTO `category` (`id`, `name`) VALUES (6, 'American');
INSERT INTO `category` (`id`, `name`) VALUES (7, 'Italian');
INSERT INTO `category` (`id`, `name`) VALUES (8, 'Polish');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 1, '1 1/2 cups', '1 chopped pumpkin');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 2, '3/4 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 3, '1/2 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 4, '1 to 1 1/4 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 5, '1/2 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 6, '1/4 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 7, '1/ 4 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 8, '3', 'slightly beaten');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 9, '1 1/4 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 10, '1x 6oz can', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (1, 11, '1x 9inch pastry shell', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 12, '1.5 lbs', 'cut into thing slices ');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 13, '1.5 lbs', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 14, '1/2 tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 15, '1/2 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 16, '3 tablespoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 17, '1 tablespoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 18, '1/2 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 19, '1/2 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 20, '5-6 cloves', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 21, '1 whole', 'cut into small pieces ');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (2, 22, '1 whole', 'cut into small thing slices');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 23, '1 tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 21, '1/2 medium ', 'cut into small pieces');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 24, '1 -2 ', 'get fresh tomatoes');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 25, 'Anaheim chile ', 'green and diced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 26, 'Chili powder', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 27, 'tortillas', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 28, 'butter', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 3, 'egg', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (3, 29, '2 tablespoons', 'cut into small pieces');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 30, '1', 'seeded and minced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 20, '4 cloves ', 'minced ');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 29, '1/2 cups', 'chopped');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 23, '1/2 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 31, '1/4 cup', 'juiced orange ');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 32, '2 tablespoons', 'juiced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 33, '2 tablespoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 26, '2 teaspoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 34, '1 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 35, '1 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 36, '1 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 37, '1 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 15, '1/4 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (4, 38, '2 pounds', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 39, '2.5oz', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 40, '2.5oz', 'sliced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 41, '2.5oz', 'sliced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 42, '2.5oz', 'sliced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 43, '2.5oz', 'sliced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 44, '2.5oz', 'sliced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 45, '1/4 cup', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 46, '4-6 tablespoons', 'shredded');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 47, '1 tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (5, 48, '1 cup', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 49, '2 tablespoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 50, '1.5 lbs', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 51, '4-6 tablespoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 20, '4-5 cloves', 'chopped');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 5, '1 tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 52, '2x 14oz cans', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 53, '2 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 54, '1 head cut', 'cut to florets');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 55, '1', 'diced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 22, '1', 'diced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 56, '1', 'diced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 57, '1', 'sliced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 58, '5-6', 'quartered');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 59, '14-18', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 13, '1.5 tablespoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 60, '1.5 tablespoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 61, '4 inch', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 62, '1 cup', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 17, '1 tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 18, '1/2 cup', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 19, '1/2 cup', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (6, 21, '1', 'chopped');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (7, 63, '2x 6oz fillets', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (7, 3, '1/4 teaspoon', 'to taste');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (7, 15, '1/4 teaspoon', 'to taste');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (7, 20, '1 clove', 'minced');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (7, 16, '1 tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (7, 23, '2 tablespoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (7, 64, '1/2 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (8, 65, '3 medium', 'in halves');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (8, 66, '1 tablespoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (8, 67, '1 can ', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (8, 68, '2 bottles', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (9, 69, '1/4 cup', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (9, 3, '1/2 teaspoon', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (9, 70, '2 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (9, 8, '1 large', 'prep for filling');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (9, 34, '1 teaspoon', 'prep for filling');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (9, 2, '1/2 teaspoon', 'prep for filling');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (9, 71, '1 carton', 'prep for filling');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (9, 28, '1 to 4 tablespoons', 'prep for filling');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (10, 69, '4 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (10, 72, '2 cups', 'uncooked');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (10, 73, '4 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (10, 2, '1 1/2 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (10, 74, '1 to 2 teaspoons', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (10, 75, '1/4 cup', 'seeded');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (10, 76, '1/4 cup', 'chopped');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (11, 77, '1 package', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (11, 78, '1 can', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (11, 79, '1/2 cup', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (11, 80, '1', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (11, 47, '2 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (11, 32, '2-3', 'optional: slices');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (12, 81, '2 cups', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (12, 28, '3/4 cup', 'melted');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (12, 2, '2 table spoons and 1 cup of sugar for filling', NULL);
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (12, 77, '1 package', 'for filling');
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `amount`, `food_prep`) VALUES (12, 47, '1 carton', 'frozen topping');

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (1, 'This is the best pie ever', 1, 1, '2022-12-22 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (2, 'Love getting this from Panda Express!', 1, 2, '2023-01-03 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (3, 'This is amazing! Love Mexican food!', 1, 3, '2023-01-06 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (4, 'My second time making this and it was excellent. I ALWAYS modify recipes, but not this one. I’m trying it with chicken next!! Thank you!', 1, 4, '2023-01-07 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (5, 'I put a couple different fruit options but it was still amazing', 1, 5, '2022-12-31 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (6, 'Love thai food minus the spicy lol', 1, 6, '2022-12-28 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (7, 'Simple and easy!', 1, 7, '2022-12-21 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (8, 'Love this cocktail drink, def a brunch moment', 1, 8, '2023-01-01 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (9, 'Such a popular dish! Love it!', 1, 9, '2022-11-23 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (10, 'Love using this recipe for left over rice!', 1, 10, '2022-11-22 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (11, 'sour to me, but still alright', 1, 11, '2022-11-10 00:00:00');
INSERT INTO `comment` (`id`, `remarks`, `user_id`, `recipe_id`, `posted_date`) VALUES (12, 'love it!', 1, 12, '2022-11-11 00:00:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (5, 1, 1, 5);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (4, 2, 1, 3);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (5, 3, 1, 4);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (5, 4, 1, 5);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (3, 5, 1, 4);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (4, 6, 1, 2);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (3, 7, 1, 4);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (5, 8, 1, 5);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (5, 9, 1, 5);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (3, 10, 1, 3);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (3, 11, 1, 2);
INSERT INTO `rating` (`rating`, `recipe_id`, `user_id`, `rate_comment`) VALUES (4, 12, 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (1, 'https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg', 1);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (2, 'https://gypsyplate.com/wp-content/uploads/2022/02/beijing-beef_01.jpg', 2);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (3, 'https://healthfulblondie.com/wp-content/uploads/2021/05/Huevos-Rancheros-2.jpg', 3);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (4, 'https://pinchandswirl.com/wp-content/uploads/2016/08/Carne-Asada-thinly-sliced-across-the-grain.jpg', 4);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (5, 'https://www.chefspencil.com/wp-content/uploads/Cholao.jpg.webp', 5);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (6, 'https://gypsyplate.com/wp-content/uploads/2022/08/thai-green-curry_10.jpg', 6);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (7, 'https://hips.hearstapps.com/hmg-prod/images/air-fryer-salmon2-1653573828.jpg?resize=480:*', 7);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (8, 'https://amandascookin.com/wp-content/uploads/2019/06/bellini-V.jpg', 8);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (9, 'https://i0.wp.com/natteats.com/wp-content/uploads/2020/12/Homemade-Polish-Pierogi-step-by-step-recipe-natteats-2.jpg?w=900&ssl=1', 9);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (10, 'https://i0.wp.com/portandfin.com/wp-content/uploads/2016/02/RosewaterRicePudding2.jpg', 10);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (11, 'https://www.simplyrecipes.com/thmb/JViE9z05SrKxys9F-e7Vo_8lqrk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2016__05__key-lime-pie-vertical-a-1600-077e4901c50840f4adb000c989d974d0.jpg', 11);
INSERT INTO `recipe_image` (`id`, `image_url`, `recipe_id`) VALUES (12, 'https://www.simplyhappyfoodie.com/wp-content/uploads/2019/05/strawberry-pretzel-jello-salad-2.jpg', 12);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dietary_preference`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `dietary_preference` (`id`, `name`, `description`) VALUES (1, 'dairy', 'may contain milk');
INSERT INTO `dietary_preference` (`id`, `name`, `description`) VALUES (2, 'meat', 'Not vegan/Vegetarian friendly');
INSERT INTO `dietary_preference` (`id`, `name`, `description`) VALUES (3, 'egg', 'may contain eggs');
INSERT INTO `dietary_preference` (`id`, `name`, `description`) VALUES (4, 'fish', 'may contain fish');
INSERT INTO `dietary_preference` (`id`, `name`, `description`) VALUES (5, 'alcohol ', 'contains alcohol');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dietary_preference_has_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (1, 1);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (2, 2);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (3, 3);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (2, 4);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (1, 5);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (4, 6);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (4, 7);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (5, 8);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (1, 9);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (1, 10);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (1, 11);
INSERT INTO `dietary_preference_has_recipe` (`dietary_preferences_id`, `recipe_id`) VALUES (1, 12);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category_has_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (1, 1);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (2, 2);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (3, 3);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (3, 4);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (4, 5);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (5, 6);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (6, 7);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (7, 8);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (8, 9);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (1, 10);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (1, 11);
INSERT INTO `category_has_recipe` (`category_id`, `recipe_id`) VALUES (1, 12);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_favorite`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealmagicdb`;
INSERT INTO `user_has_favorite` (`user_id`, `recipe_id`) VALUES (1, 1);

COMMIT;

