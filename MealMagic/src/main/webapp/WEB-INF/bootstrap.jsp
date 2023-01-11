<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="page">
<head>
<meta charset="UTF-8">
<title>Home page</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
</head>
<body>

<nav id=NavBar class="navbar navbar-expand-lg bg">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.do">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="account.do">Account</a>
        <a class="nav-link" href="findAllRecipes.do">Show All Recipes</a>
       <!-- <a class="nav-link" href="findrecipes.do">Find Recipes</a>  COMEBACK TO FIX MAYBE??? --> 
        <a class="nav-link" href="uploadrecipes.do">Create New Recipe</a>
        <a class="nav-link" href="viewfavorites.do">Favorites</a>
       <c:choose>
        	 <c:when test="${empty sessionScope.loggedInUser}">
        <a class="nav-link" href="login.do">Login</a>
        <a class="nav-link" href="createNewUserPage.do">Create Account</a>
        	 </c:when>
        	 <c:otherwise>
        <a class="nav-link" href="logout.do">Log Out</a>
        	 </c:otherwise>
        </c:choose>
        <a class="nav-link" href="about.do">About</a>
        
      </div>
    </div>
  </div>
</nav>


</body>
</html>