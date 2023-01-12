<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Available Categories</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body id="listDp">
<h1>List of All Dietary Preferences</h1>
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
 	 	 	  		<th>Description</th>
 	 	 	 	</tr>
 	 	 	</thead>
 	 	 	 	<tbody>
 	 	 	 	 	<c:forEach var="d" items="${dp}">
   	 	 	 	 	 	 <tr>
    		 	 	  	 	<td>${d.id}</td>
    	 	 	 	 	 	<td><a href="showDp.do?id=${d.id}">${d.name}</a></td>
   	 	 	 	 	 	 </tr>
 	 	 	 	 	</c:forEach>
 	 	 	 	</tbody>
 	 	 	</table>
	
</body>
</html>






