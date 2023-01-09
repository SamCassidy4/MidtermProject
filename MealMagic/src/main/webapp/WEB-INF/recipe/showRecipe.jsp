<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${recipe.name }</title>
<%@ include file="../bootstrap.jsp"%>
</head>
<body>
<h1>Found Recipe</h1>

	<div>
	<strong><h3>${recipe.name}</h3></strong>
			<br>
			<img src = "${recipe.imageUrl}"/>
			<br>
	<em><h3>Ingredients: </em></h3>
	  
		<c:forEach var="RecipeIngredient" items="${recipe.getRecipeIngredients()}">
		<ul>
		<li>${RecipeIngredient.getIngredient().getName()}  ${RecipeIngredient.getAmount()} </li>
		
		
		</ul>
		
		</c:forEach>
			<br>
			<br>
	<em> <h3>Description: </h3></em>
		 <h3></h3>${recipe.description}</h4>
			 <br>
			 <br>
	<em><h3>Cooking Instructions:</h3></em>
	 <h4>${recipe.cookingInstructions}</h4>
	 <br>
	
	<h3>Number of Servings: ${recipe.numberOfServing}</h3>
	<br>
	<h3>Cook Time: ${recipe.cookTime}</h3>
	<br>
	<h3>Country: ${recipe.country.name}, ${recipe.country.continent }, ${recipe.country.region } </h3>
	<br>
	
	<h3>Dietary Preference: ${recipe.dietaryPreferences} </h3>
	
	<br>
	<h3>notes: ${recipe.notes}</h3>
	<br>
	<h3>Prep Time: ${recipe.prepTime}</h3>
	<br>
	<h3>Ratings: ${recipe.ratings}</h3>
<br>
<h3>Shared By: ${recipe.user.getUsername()} </h3>
<br>
<h3>Yield: ${recipe.yield}</h3>

<br>
<h3>Calories: ${recipe.calories}</h3>
<br>
<h3>Categories: ${recipe.categories}</h3>
<br>
<h3>Comments:  ${recipe.comments}</h3>






</div>
	
	<c:choose> <c:when test="${empty sessionScope.loggedInUser}">
        <a class="nav-link" href="login.do"> Login </a>  
        </c:when>
	<c:otherwise> <form action="delete.do" method="GET">
		<input type="text" hidden="true" name="rid" value="${recipe.id }">
		<input type="submit" value="Delete Recipe">
	</form>
	
	<br>
	<br>
	
	<form action="updateView.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${recipe.id}">
		<input type="submit" value="Edit Recipe">
	</form>
	
		<br>
		<br>
	<form action="showIngredient.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${recipe.id}">
		<input type="submit" value="Add Ingredient">
	</form></c:otherwise></c:choose>


</body>
</html>