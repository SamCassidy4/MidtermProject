<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Recipe</title>
<%@ include file="../bootstrap.jsp"%>
</head>
<body>
<h1>Create A New Recipe</h1>

<!-- FIXME!! unable to create new recipe due to country_id cannot be null -->

<form action="create.do" method="GET">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="name">Name</label>
      <input type="text" class="form-control" name="name" placeholder="ex. Cherry Pie">
    </div>
    <div class="form-group col-md-6">
      <label for="description">Description</label>
      <input type="text" class="form-control" name="description" placeholder="ex. A pie made from cherries">
    </div>
    <div class="form-group col-md-6">
      <label for="imageUrl">Image Url </label>
      <input type="text" class="form-control" name="imageUrl" placeholder="Image Url">
    </div>
    <div class="form-group col-md-6">
      <label for="cookingInstructions">Cooking Instructions</label>
      <input type="text" class="form-control" name="cookingInstructions" placeholder="ex. bake the pie at 350 degrees F">
    </div>
    <div class="form-group col-md-6">
      <label for="numberOfServings">Number Of Servings</label>
      <input type="text" class="form-control" name="numberOfServings" placeholder="ex. 8 Servings">
    </div>
    <div class="form-group col-md-6">
      <label for="calories">Calories</label>
      <input type="text" class="form-control" name="calories" placeholder="ex. 300 calories per slice">
    </div>
    <div class="form-group col-md-6">
      <label for="prepTime">Prep Time</label>
      <input type="text" class="form-control" name="prepTime" placeholder="ex. 30 minutes prep, 45 minute cook">
    </div>
    <div class="form-group col-md-6">
      <label for="yield">Yield</label>
      <input type="text" class="form-control" name="yield" placeholder="ex. 1 pie">
    </div>
    <div class="form-group col-md-6">
      <label for="notes">Notes</label>
      <input type="text" class="form-control" name="notes" placeholder="ex. Bake it with love">
    </div>
    <div class="form-group col-md-6">
      <label for="cookTime">Cook Time</label>
      <input type="text" class="form-control" name="cookTime" placeholder="Cook Time">
    </div>
   <!--  <div class="form-group col-md-6">
      <label for="countryId">Country Id</label>
      <input type="hidden" class="form-control" name="countryId" placeholder="Cook Time" value="1">
    </div> -->
  </div>
  <div class="form-group">
  </div>
  <br>
  <button type="submit" class="btn btn-primary">Create Me!</button>
  <br>
</form>

</body>
</html>