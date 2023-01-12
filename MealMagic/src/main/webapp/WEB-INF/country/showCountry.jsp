<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Country</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<h1>Country Details</h1>

<div>
  <h5>ID: ${country.id} Name: ${country.name}</h5>
  <p>Continent: ${country.continent}</p>
  <p>Region: ${country.region }</p>
</div>

	
	
	
	<form action="showListCountry.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${recipe.id}">
		<input type="submit" value="Show A List Of Countries For Recipes">
	</form>
	
	<form action="updateCountryView.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${country.id}">
		<input type="submit" value="Edit Country">
    </form>
    
    <%-- <form action="deleteCountry.do" method="GET">   TO BE CONTINUED MAYBE.. 
		<input type="text" hidden="true" name="id"  value="${country.id}">
		<input type="submit" value="Delete Country">
	</form> --%>
	
	  <form action="createCountryPage.do" method="GET">
		<input type="text" hidden="true" name="id"  value="${recipe.id}">
		<input type="submit" value="Create A New Country For Recipe">
     </form>

</body>
</html>