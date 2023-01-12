<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All available Recipes</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">s
</head>
<body>
<h1>List of All Countries</h1>
<%-- <c:forEach var="country" items="${country}">
		 <div class="form-group col-md-6">
      	 <label for="country.name">${country.id} ${country.name} ${country.continent}</label>
	<ul>
	<li> ID: ${country.id} Name: ${country.name} Continent: ${country.continent}</li>
	</ul>
	
	</c:forEach> --%>
	
	 	<table>
 	 	 	<thead>
 	 	 	 	<tr>
 	 	 	  		<th>ID</th>
 	 	 	  		<th>Name</th>
 	 	 	 	</tr>
 	 	 	</thead>
 	 	 	 	<tbody>
 	 	 	 	 	<c:forEach var="country" items="${country}">
   	 	 	 	 	 	 <tr>
    		 	 	  	 	<td>${country.id}</td>
    	 	 	 	 	 	<td><a href="showCountry.do?id=${country.id}">${country.name}</a></td>
   	 	 	 	 	 	 </tr>
 	 	 	 	 	</c:forEach>
 	 	 	 	</tbody>
 	 	 	</table>
	
</body>
</html>






