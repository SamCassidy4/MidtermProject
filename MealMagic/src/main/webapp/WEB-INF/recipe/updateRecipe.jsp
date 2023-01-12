<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Recipe</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body id="updateRecipe">
<h1>Update ${recipe.name}</h1>

	<form action="updateRecipe.do" method="GET">
		<input type="hidden" value="${recipe.id}" name ="id"/>
  <div class="form-row">
  
    <div class="form-group col-md-6">
      <label for="name">Name</label>
      <input type="text" class="form-control" name="name" value="${recipe.name}">
    </div>
    
    
    
    <div class="form-group col-md-6">
      <label for="description">Description</label>
      <input type="text" class="form-control" name="description" value="${recipe.description }">
    </div>
    
    
    
    <div class="form-group col-md-6">
      <label for="imageUrl">Image Url </label>
      <input type="text" class="form-control" name="imageUrl" value="${recipe.imageUrl }" >
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="cookingInstructions">Cooking Instructions</label>
      <input type="text" class="form-control" name="cookingInstructions" value="${recipe.cookingInstructions }">
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="numberOfServings">Number Of Servings</label>
      <input type="text" class="form-control" name="numberOfServings" value ="${recipe.numberOfServing }">
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="calories">Calories</label>
      <input type="text" class="form-control" name="calories" value="${recipe.calories }" >
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="prepTime">Prep Time</label>
      <input type="text" class="form-control" name="prepTime" value="${recipe.prepTime }">
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="yield">Yield</label>
      <input type="text" class="form-control" name="yield" value="${recipe.yield }">
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="notes">Notes</label>
      <input type="text" class="form-control" name="notes" value="${recipe.notes }">
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="cookTime">Cook Time</label>
      <input type="text" class="form-control" name="cookTime" value="${recipe.cookTime }">
    </div>
    
    
   <!--  <div class="form-group col-md-6">
      <label for="countryId">Country Id</label>
      <input type="hidden" class="form-control" name="countryId" placeholder="Cook Time" value="1">
    </div> -->
  </div>
  <div class="form-group">
  </div>
  <br>
  <button type="submit" class="btn btn-primary">Update Me!</button>
  <br>
</form>

</body>
</html>


</div>
	

</body>
</html>