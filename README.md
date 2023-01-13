# MidtermProject - MealMagic

http://54.244.123.27:8080/MealMagic/

# Team Members: 
- Pamela Leon: (Developer, DBA and Scrum Master) 
GitHub: https://github.com/pamelaleon

- Sam Cassidy (Developer, Repo Owner)
GitHub: https://github.com/SamCassidy4

- Kna Kong (Developer)
Github: https://github.com/Knakong

# Overview
This MealMagic application was designed to help a user search for exsisting recipes by finding them by name or single ingredients that are readily available. User can also create a profile where they can create a new recipe and upload it into the database. Users can also rate and comment on each recipe they find. If the user is missing an ingredient then they are able to add a new ingredient and add it to their recipe. We wanted to make this akin to a cookbook. The problem we wanted to solve by building this application was allowing the user to be able to easily search and add recipe's they enjoy without having the cumbersome amount of books many people have in their house. This way users can have easy access to the recipes they love along with complete freedom to edit the site as they please.

# Description
Upon entering the website, user can search for a recipe by ingredient by selecting the checkboxes on what ingredients they already have in their kitchen. A list of recipes will appear as to what recipes have the following ingredients the user choose.
User can also search a recipe by searching for their favorite recipe name as well.

However, for user to be able to rate, add recipe or add ingredient they must create an account or login. 

Once user is logged in, they are able to see their own profile with full name and created date. If a user is wishing to delete their account, they can do so on their profile page. 

Users can also see their favorite recipe once logged in. 

User can see all recipes we have in the database, if they do not see a recipe they like they can add a new recipe. They are prompted with a form to describe their recipe in great detail. They can even choose where their recipe is from, what category it is under and the dietary preference of that recipe. If the user does not see a country, category or dietary preference of their choosing then they can add each one of them first and then coming back to the create recipe page where they will see their newly added preferences. 

When user is done they can simple log out and all of their changes are saved. 
  
# Implementation

![image](https://user-images.githubusercontent.com/113270980/212324704-4b7938ec-c957-4bed-83f7-067b3a3ee714.png)

# Technologies and Methodologies Used
- Java
- JUnit
- MySQL
- MySQL workbench
- HTML
- CSS
- SpringBoot
- Bootstrap
- Spring Tool Suite
- Github
- Trello
- JPQL
- Gradle
- MAMP
- Git
- Git Branching
- AWS (Ec2)


# Lesson Learned 
- One of the biggest challenges was being able to have the user find recipes by using single ingredients. How we overcame that was passing in a String array and iterating over the array using for loops instead of for each. This allowed us to build the query string dynamically, since we didn't know how many keywords the user would be passing in. This helped solve this issue. For the query, we used DISTINCT to narrow down our search and also used EXSIST  to be able to find like wise ingredients from already exsisting recipes. 
Example: 
"SELECT DISTINCT r FROM Recipe r";
" JOIN RecipeIngredient ri" + i + " ON r.id = ri" + i + ".recipe.id";
" EXISTS (SELECT i FROM Ingredient i WHERE i.name LIKE :name" + i + " AND i.id = ri" + i
					+ ".ingredient.id)";
          
- Another challange for us that we discovered down the road was when we implemented dietary preferences and category on create recipe, it was not showing when the user went back to look at their newly created recipe. We saw that the reason why country was showing was because the recipe table had country_id already where category and dietary_preference did not, they had a one-to-many relationship with recipe. So we decided that in our Recipe Database Accessesor Implemation class that in our createRecipe method we need to specifically add that category and dietary preference needed to be included when the new recipe was created. Using a String array for each one we iterated over them using a foreach and using Entity Manager to find the class and parse it into a string argument. Then adding each of them to recipe, solving our problem and now user can view category and dietary preference when they create a new recipe.       
      





