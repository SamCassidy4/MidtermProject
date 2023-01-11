<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Categories</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<h1>Category Details</h1>

<div>
  <h5>ID: ${category.id} Name: ${category.name}</h5>
</div>

	
	
	
	<form action="showListCategory.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${recipe.id}">
		<input type="submit" value="Show List Of Categories">
	</form>
	
	<form action="updateCategoryView.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${category.id}">
		<input type="submit" value="Edit Category">
    </form>
    
   <%--  <form action="deleteCategory.do" method="GET">   TO BE CONTINUED MAYBE BUT FORM WORKS!
		<input type="text" hidden="true" name="id"  value="${category.id}">
		<input type="submit" value="Delete Category">
	</form>  --%>
	
	  <form action="createCategoryPage.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${recipe.id}">
		<input type="submit" value="Add A New Category">
     </form>

</body>
</html>