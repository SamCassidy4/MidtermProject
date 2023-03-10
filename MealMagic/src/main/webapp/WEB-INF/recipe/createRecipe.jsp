<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Create Recipe</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="createRecipePage">
<h1 id="formCreateRecipe-h1">Create A New Recipe</h1>

<div>
<form action="create.do" method="GET" id="formCreateRecipe">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="name">Name</label>
      <input type="text" class="form-control" name="name" placeholder="ex. Cherry Pie">
    </div>
    <div class="form-group col-md-6">
      <label for="description">Description</label>
      <input type="text" class="form-control" name="description" placeholder="ex. A pie made from cherries">
    </div>
   <div class="form-group col-md-4">
      <label for="country">Country</label>
      <select name="country.id" class="form-control">
        <option selected>Select a Country</option>
      <c:forEach var="c" items="${countries}">
      
  <%--       <option value="${c.id}">United States</option>
        <option value="$">Mexico</option>
        <option value="3">Colombia</option>
        <option value="4">Thailand</option>
        <option value="5">Italy</option>
        <option value="6">Poland</option>
        <option value="7">Lebanon</option> --%>
        
        <option value="${c.id} ">${c.name }</option>
      
      </c:forEach>
      </select>
    </div>
    
     <div class="form-group col-md-4">
      <label for="category">Category</label>
      <select name="categoryCollection" class="form-control">
        <option selected>Select a Category</option>
      <c:forEach var="c" items="${categories}">
        <option value="${c.id} ">${c.name}</option>
      </c:forEach>
      </select>
    </div>
    
     <div class="form-group col-md-4">
      <label for="dietaryPreference">Dietary Preference</label>
      <select name="dietaryPreferenceCollection" class="form-control">
        <option selected>Select a Dietary Preference</option>
      <c:forEach var="d" items="${dietaryPreferences}">
        <option value="${d.id} ">${d.name}</option>
      </c:forEach>
      </select>
    </div>
    
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
  
  <div class="form-group">
  </div>
  <br>
  <button type="submit" class="btn btn-primary">Create Me!</button>
  <br>
  
	
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</form>
</div>
<section>
<br>
<div style="float:left;">
  <form action="createCountryPage.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${recipe.id}">
		<input type="submit" value="Create A New Country For Recipe">
</form>
</div>
	<br>
	<div style="float:left;">
	 <form action="createCategoryPage.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${category.id}">
		<input type="submit" value="Add A New Category For Recipe">
     </form>
     </div>	
 	<br>
	<div style="float:left;">
	 <form action="createDpPage.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${dp.id}">
		<input type="submit" value="Add A New Dietary Preference">
     </form>
     </div>	
</section>
   
</body>
</html>