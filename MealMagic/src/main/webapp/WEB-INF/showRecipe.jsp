<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="bootstrap.jsp"%>
</head>
<body>
<h1>Found Recipe</h1>

	<div>
	<strong><h3>${recipe.name}</h3></strong>
			<br>
			<img src = "${recipe.imageUrl}"/>
			<br>
	<em><h3>Ingredients: </em></h3>
		<h4>${recipe.getIngredients().get(0).getName()}</h4>
			<br>
			<br>
	<em> <h3>Description: </h3></em>
		 <h4>${recipe.description}</h4>
			 <br>
			 <br>
	<em><h3>Cooking Instructions:</h3></em>
	 <h4>${recipe.cookingInstructions}</h4>
	 <br>
	 <br>





2:15
</div>
	
	<br>
	<form action="delete.do" method="GET">
	<!-- <input type="radio" name="deleteRecipe" value="yes"><label>Yes</label> -->
		<input type="text" hidden="true" name="rid" value="${recipe.id }">
		<input type="submit" value="Delete Recipe">
	</form>
	<br>
	<br>
	
	<form action="updateView.do" method="GET">
	<!-- <input type="radio" name="updateView" value="yes"><label>Yes</label> -->
		<input type="text" hidden="true" name="id" value="${recipe.id}">
		<input type="submit" value="Edit Recipe">
	</form>


</body>
</html>