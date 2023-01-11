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
<body>
<h1>Update ${country.getName()}</h1>

	<form action="updateCountry.do" method="GET">
		<input type="hidden" value="${country.id}" name ="id"/>
  <div class="form-row">
  
    <div class="form-group col-md-6">
      <label for="name">Name</label>
      <input type="text" class="form-control" name="name" value="${country.name}">
    </div>
    
    
    
    <div class="form-group col-md-6">
      <label for="continent">Continent</label>
      <input type="text" class="form-control" name="continent" value="${country.continent}">
    </div>
    
    
    
    <div class="form-group col-md-6">
      <label for="region">Region</label>
      <input type="text" class="form-control" name="region" value="${country.region}" >
    </div>
 
  </div>
  <div class="form-group">
  </div>
  <br>
  <button type="submit" class="btn btn-primary">Update Country!</button>
  <br>
</form>

</body>
</html>


</div>
	

</body>
</html>