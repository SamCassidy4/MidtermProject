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
		<strong><h3>${recipe.name}</h3></strong> <br> <img
			src="${recipe.imageUrl}" /> <br> <em><h3>Ingredients:
			</em>
		</h3>

		<c:forEach var="RecipeIngredient"
			items="${recipe.getRecipeIngredients()}">
			<ul>
				<li>${RecipeIngredient.getIngredient().getName()}
					${RecipeIngredient.getAmount()}</li>


			</ul>

		</c:forEach>
		<br> <br> <em>
			<h3>Description:</h3>
		</em>
		<h3></h3>${recipe.description}</h4>
		<br> <br> <em><h3>Cooking Instructions:</h3></em>
		<h4>${recipe.cookingInstructions}</h4>
		<br>

		<h3>Number of Servings: ${recipe.numberOfServing}</h3>
		<br>
		<h3>Cook Time: ${recipe.cookTime}</h3>
		<br>
		<h3>Country: ${recipe.country.name}, ${recipe.country.continent },
			${recipe.country.region }</h3>
		<br>

		<h3>Dietary Preference: ${recipe.dietaryPreferences}</h3>

		<br>
		<h3>notes: ${recipe.notes}</h3>
		<br>
		<h3>Prep Time: ${recipe.prepTime}</h3>
		<br>
		<h3>Ratings: ${recipe.ratings}</h3>
		<br>
		<h3>Shared By: ${recipe.user.getUsername()}</h3>
		<br>
		<h3>Yield: ${recipe.yield}</h3>

		<br>
		<h3>Calories: ${recipe.calories}</h3>
		<br>
		<h3>Categories: ${recipe.categories}</h3>
		<br>
		<h3>Comments:</h3>


		<section style="background-color: #eee;">
			<c:forEach var="comment" items="${recipe.comments}">
				
											
										
		<div>
		<h6>${comment.getUser().getUsername()}</h6>
		<p>${comment.postedDate}</p>
		</div>
									
		<div>
		<p>${comment.remark}</p>
		<form action="deleteComment.do" method.get>
		<input hidden="true" name="commentId" value="${recipe.id}">
		<input type="submit" value="delete">
		</form>
		
		</div>
		</c:forEach>
<br>
		
	<div class="form-group">
		<form action="addComment.do" method="GET">
			<label for="remark">Comment:</label>
			<textarea class="form-control" rows="5" name="remark"></textarea>
			<input hidden="true" name="recipe.id" value="${recipe.id}"> 
			<input hidden="true" name="user.id" value="${loggedInUser.id}"> 
			<input type="submit" value="Submit Comment">
	</div>

	</form>

	</div>

	<c:choose>
		<c:when test="${empty sessionScope.loggedInUser}">
			<a class="nav-link" href="login.do"> Login </a>
		</c:when>
		<c:otherwise>
			<form action="delete.do" method="GET">
				<input type="text" hidden="true" name="rid" value="${recipe.id }">
				<input type="submit" value="Delete Recipe">
			</form>

			<br>
			<br>

			<form action="updateView.do" method="GET">
				<input type="text" hidden="true" name="id" value="${recipe.id}">
				<input type="submit" value="Edit Recipe">
			</form>

			<br>
			<br>
			<form action="showIngredient.do" method="GET">
				<input type="text" hidden="true" name="id" value="${recipe.id}">
				<input type="submit" value="Add Ingredient">
			</form>
		</c:otherwise>
	</c:choose>


</body>
</html>