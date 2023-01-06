<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meal Magic</title>
<%@ include file="bootstrap.jsp"%>
</head>
<body>
<h1>Furry Lactation is here to make some Meal Magic</h1>


     <form action="findKeyword.do" method="GET">
<div class="input-group">
  <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" name="keyword" for="keyword" />
  <button type="submit" class="btn btn-outline-primary">search</button>
</div>
     </form>
     
     <br>
     

<div class="card" style="width: 18rem;">
  <img src="https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <p class="card-text">Pumpkin pie is a great Holiday desert starting from October all the way until December.
    </p>
  </div>


</body>
</html>