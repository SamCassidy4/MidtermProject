<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${recipe.name }</title>
<%@ include file="../bootstrap.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
</head>
<body>

<div class="container">
	<h1>Found Recipe</h1>

	<div>
		 	<h3><strong>${recipe.name}</strong></h3> <br> 
		<img src="${recipe.imageUrl}" /> <br> 
		
		<h3><em>Ingredients:</em></h3>

		<c:forEach var="RecipeIngredient"
			items="${recipe.getRecipeIngredients()}">
			<ul>
				<li>${RecipeIngredient.getIngredient().getName()}
					${RecipeIngredient.getAmount()}</li>


			</ul>

		</c:forEach>
		<br> <br>
			<h3><em>Description:</em></h3>
		<h4>${recipe.description}</h4>
		<br> <br> 
		
		<h3><em>Cooking Instructions:</em></h3>
		<h4>${recipe.cookingInstructions}</h4>
		<br>

		<h3>Number of Servings: </h3>
		<h4>${recipe.numberOfServing}</h4>
		<br>
		<h3>Cook Time:</h3>
		<h4>${recipe.cookTime}</h4>
		<br>
		<h3>Country:</h3>
			<h4>${recipe.country.name}, ${recipe.country.continent },
			${recipe.country.region }</h4>
		<br>

		<h3>Dietary Preference:</h3>
          <c:forEach var="preference" items="${recipe.dietaryPreferences}" >
           
         <h4>Name: ${preference.name} , Description: ${preference.description}</h4>
          </c:forEach>
		<br>
		<h3>Notes:</h3>
		<h4>${recipe.notes}</h4>
		<br>
		<h3>Prep Time:</h3>
		<h4> ${recipe.prepTime}</h4>
		<br>
		<h3>Ratings:</h3>
		
		<h4>
		
		<c:if test="${not empty recipe.ratings}">
		<c:forEach var="rating" items="${recipe.ratings}" >
		<h3>${rating.rating}</h3>
		
		
		</c:forEach>
		<h4> average: ${recipe.getAvgRating()} </h4>
		</c:if>
		</h4>
		
		<br>
		<h3>Shared By:</h3>
		<h4>${recipe.user.getUsername()}</h4>
		<br>
		<h3>Yield:</h3>
		<h4> ${recipe.yield}</h4>

		<br>
		<h3>Calories: </h3>
		<h4>${recipe.calories}</h4>
		<br>
		<h3>Category:</h3>
		<c:forEach var="category" items="${recipe.categories}" >
		<h4>${category.name}</h4>
		</c:forEach>
		<br>
		<h3>Comments:</h3>


		<!-- <section style="background-color: #eee;"> -->
			<c:forEach var="comment" items="${recipe.comments}">
				
											
										
		<div>
		<h6>${comment.getUser().getUsername()}</h6>
		<p>${comment.postedDate}</p>
		</div>
									
		<div>
		<p>${comment.remark}</p>

	

		<form action="deleteComment.do" method="POST">
		<input hidden="true" for="commentId" name="commentId" value="${comment.id}">
		<input hidden="true" for="recipeId" name="recipeId" value="${recipe.id}">
		
		<input type="submit" value="delete">
		</form>
		
		</div>
		</c:forEach>
<br>
		
	<div class="form-group">
		<form action="addComment.do" method="POST">
			<label for="remark">Comment:</label>
			<textarea class="form-control" rows="5" name="remark"></textarea>
			<input hidden="true" name="recipe.id" value="${recipe.id}"> 
			<input hidden="true" name="user.id" value="${loggedInUser.id}"> 
			<input type="submit" value="Submit Comment">
	</form>
	</div>
	
	
<!-- RATING HERE -->
 <form action="rate.do" method="GET">
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="rate" value="1">
  <label class="form-check-label" for="rate">1</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="rate" value="2">
  <label class="form-check-label" for="rate">2</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="rate" value="3">
  <label class="form-check-label" for="rate">3</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="rate" value="4">
  <label class="form-check-label" for="rate">4</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="rate" value="5">
  <label class="form-check-label" for="rate">5 </label>
  <input hidden="true" name="recipeId"  value="${recipe.id}">
  <input hidden="true" name="userId"  value="${loggedInUser.id}">
  <input type="submit" value="Submit Rating">
</div>
</form> 

	</div>

	<c:choose>
		<c:when test="${empty sessionScope.loggedInUser}">
			<form action="login.do" method="GET">
				<input type="submit" value="Login">
			</form>
		</c:when>
		<c:otherwise>
			<form action="delete.do" method="GET">
				<input type="text" hidden="true" name="rid" value="${recipe.id}">
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


</div>

</body>
</html>