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
<h1>List Of Ingredients</h1>

<form action="experiment.do" method="GET" >
	<c:forEach var="RecipeIngredient" items="${recipe.getRecipeIngredients()}">
		 <div class="form-group col-md-6">
      	 <label for="ingredient.name">${ingredient.name}</label>
      	 <input type="text" class="form-control" name="name" placeholder="" value="${RecipeIngredient.getIngredient().getName()}">
     	</div>
		
	</c:forEach>
	
      	 <input type="hidden" class="form-control" name="ind" placeholder="" value="${recipe.id} ">
	<label for="ingredient.name">${ingredient.name}</label>
      	 <input type="text" class="form-control" name="name" placeholder="New Ingredient">
      	<!--  <input type="text" class="form-control" name="name" placeholder="New Ingredient">
      	 <input type="text" class="form-control" name="name" placeholder="New Ingredient">
      	 <input type="text" class="form-control" name="name" placeholder="New Ingredient"> -->
	<br>
	 <button type="submit" class="btn btn-primary">Update Ingredients!</button>
	
	
</form>
  
  


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
	</form></c:otherwise></c:choose>


</body>
</html>