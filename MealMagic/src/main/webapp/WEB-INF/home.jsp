<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meal Magic</title>
<%@ include file="bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body id="home">

<br>
<div class="container">

     <form action="findKeyword.do" method="GET">
<div class="input-group">
  <input type="search" class="form-control rounded" placeholder="Search for your favorite Recipe" aria-label="Search" aria-describedby="search-addon" name="keyword" for="keyword" />
  <button type="submit" class="btn btn-outline-primary">search</button>
</div>
     </form>
     
     <br>
  <div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card h-100">
      <img src="https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Pumpkin Pie</h5>
        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
      <div class="card-footer">
        <small class="text-muted">Last updated 3 mins ago</small>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <img src="https://betony-nyc.com/wp-content/uploads/2021/04/homemade-panda-express-beijing-beef-recipe-735x489.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"> Beijing Beef</h5>
        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
      </div>
      <div class="card-footer">
        <small class="text-muted">Last updated 3 mins ago</small>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <img src="https://images-gmi-pmc.edge-generalmills.com/5396db68-e188-4893-8d10-a2ecaf14ddb1.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Pretzel Gelatin Dessert</h5>
        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      </div>
      <div class="card-footer">
        <small class="text-muted">Last updated 3 mins ago</small>
      </div>
    </div>
  </div>
</div>
 
 <form action="getRecipeFromIngredient.do" method="GET">
 <h2>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="sugar" name="keyword" for="keyword" />
  <label class="form-check-label">Sugar</label>
</div>

<div class="form-check">
  <input class="form-check-input" type="checkbox" value="all-purpose flour" name="keyword" for="keyword"/>
  <label class="form-check-label">Flour</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="salt" name="keyword" for="keyword" />
  <label class="form-check-label">Salt</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="butter" name="keyword" for="keyword"/>
  <label class="form-check-label">Butter</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="coconut milk" name="keyword" for="keyword" />
  <label class="form-check-label">Coconut Milk</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="pistachio" name="keyword" for="keyword"/>
  <label class="form-check-label">Pistachio</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="honey" name="keyword" for="keyword"/>
  <label class="form-check-label">Honey</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="nutmeg" name="keyword" for="keyword"/>
  <label class="form-check-label">Nutmeg</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="steak" name="keyword" for="keyword"" />
  <label class="form-check-label">Steak</label>
</div>

<div class="form-check">
  <input class="form-check-input" type="checkbox" value="egg" name="keyword" for="keyword"/>
  <label class="form-check-label">Egg</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="garlic" name="keyword" for="keyword"/>
  <label class="form-check-label">Garlic</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="milk" name="keyword" for="keyword"/>
  <label class="form-check-label">Milk</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="cooking oil" name="keyword" for="keyword"/>
  <label class="form-check-label">Cooking Oil</label>
</div>

<button type="submit" class="btn btn-outline-primary">Submit</button>
</form>
 </h2>

<form action="getRecipeFromIngredient.do" method="GET">
<div class="input-group">
  <input type="search" class="form-control rounded" placeholder="Search for an ingredient" aria-label="Search" aria-describedby="search-addon" name="keyword" for="keyword" />
  <button type="submit" class="btn btn-outline-primary">search</button>
</div>
</form>
</div>

</body>
</html>