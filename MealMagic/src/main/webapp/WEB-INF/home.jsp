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
<body>


<div class="container">

     <form action="findKeyword.do" method="GET">
<div class="input-group">
  <input type="search" class="form-control rounded" placeholder="Search for your favorite Recipe" aria-label="Search" aria-describedby="search-addon" name="keyword" for="keyword" />
  <button type="submit" class="btn btn-outline-primary">Search</button>
</div>
     </form>
     
     <br>
  <div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card h-100">
      <img src="https://www.allrecipes.com/thmb/DXjy4ZXwgwPun42CBO-3f9-1358=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23439-PerfectPumpkinPie_002-4x3-1-44d015659c5c4a0888238d8f22de2a5e.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Pumpkin Pie</h5>
        <p class="card-text">Pumpkin Pie is a traditional holiday recipe which is incredibly popular in the United States. It uses very aromatic spices such as cinnamon, nutmeg, and cloves.
         Originally Pumpkin pie were at first whole baked pumpkins stuffed with spices and apples.  </p>
         <a href="https://en.wikipedia.org/wiki/Pumpkin_pie" class="btn btn-primary stretched-link">Find Out More Here</a>
      </div>
      <div class="card-footer">
        <small class="text-muted">Last updated 1 week ago</small>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <img src="https://betony-nyc.com/wp-content/uploads/2021/04/homemade-panda-express-beijing-beef-recipe-735x489.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"> Beijing Beef</h5>
        <p class="card-text">Beijing Beef is an Americanized Chinese dish, crispy beef slices tossed in bell pepper, onions, and sweet & tangy sauce. 
        Typically one of the most popular beef dishes on the menu of Panda Express, this recipe will give you a healthier more fulfilling meal.</p>
        <a href="https://en.wikipedia.org/wiki/American_Chinese_cuisine" class="btn btn-primary stretched-link"> Find Out More Here</a>
      </div>
      <div class="card-footer">
        <small class="text-muted">Last updated 20 mins ago</small>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <img src="https://images-gmi-pmc.edge-generalmills.com/5396db68-e188-4893-8d10-a2ecaf14ddb1.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Pretzel Gelatin Dessert</h5>
        <p class="card-text">Sometimes known as "Strawberry Pretzel Salad" This dessert comes from the south, it is a "light dessert" that resembles a cheescake with a sweet-salty crust made with pretzels, butter, and brown sugar, and a fruit topping. 
        This dish is a staple at the holiday dinner table but can be found at potlucks and barbecues all throughout the year.</p>
        <a href ="https://en.wikipedia.org/wiki/Jello_salad" class="btn btn-primary stretched-link">Find Out More Here</a>
      </div>
      <div class="card-footer">
        <small class="text-muted">Last updated 4 days ago</small>
      </div>
    </div>
  </div>
</div>
<br>
<br>
<h2 class="ingredientList">
Search For A Recipe Using Ingredients
 </h2>
 <br>
 <form action="getRecipeFromIngredient.do" method="GET">
 <h3>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="sugar" name="keyword" for="keyword" />
  <label class="form-check-label">Sugar</label>
</div>

<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="all-purpose flour" name="keyword" for="keyword"/>
  <label class="form-check-label">Flour</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="salt" name="keyword" for="keyword" />
  <label class="form-check-label">Salt</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="butter" name="keyword" for="keyword"/>
  <label class="form-check-label">Butter</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="coconut milk" name="keyword" for="keyword" />
  <label class="form-check-label">Coconut Milk</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="pistachio" name="keyword" for="keyword"/>
  <label class="form-check-label">Pistachio</label>
</div>
<br>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="honey" name="keyword" for="keyword"/>
  <label class="form-check-label">Honey</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="nutmeg" name="keyword" for="keyword"/>
  <label class="form-check-label">Nutmeg</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="steak" name="keyword" for="keyword" />
  <label class="form-check-label">Steak</label>
</div>

<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="egg" name="keyword" for="keyword"/>
  <label class="form-check-label">Egg</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="garlic" name="keyword" for="keyword"/>
  <label class="form-check-label">Garlic</label>
</div>
<div class="form-check form-check-inline" >
  <input class="form-check-input" type="checkbox" value="milk" name="keyword" for="keyword"/>
  <label class="form-check-label">Milk</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" value="cooking oil" name="keyword" for="keyword"/>
  <label class="form-check-label">Cooking Oil</label>
</div>
<br>
<br>
<button type="submit" class="btn btn-outline-primary">Submit</button>
</form>
 </h3>

<!--FOR TESTING PURPOSES ONLY  -->
<!-- <form action="getRecipeFromIngredient.do" method="GET">
<div class="input-group">
  <input type="search" class="form-control rounded" placeholder="Search for an ingredient" aria-label="Search" aria-describedby="search-addon" name="keyword" for="keyword" />
  <button type="submit" class="btn btn-outline-primary">search</button>
</div>
</form> -->
</div>

</body>
</html>