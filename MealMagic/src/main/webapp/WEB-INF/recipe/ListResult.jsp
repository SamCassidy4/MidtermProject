<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All available Recipes</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class ="listPage">
<div>
<body id="listRecipe">
<div class="container" id="result-listRecipe">
<h1>List of All Recipes</h1>

	<c:choose>
		<c:when test="${empty recipes}">
			<h2>No Recipe Found</h2>
		</c:when>
		<c:otherwise>
		<div class="listPage" id="listPage">
			<table class="center">
				<thead>
					<tr>
						<!-- <th>ID</th> -->
						<!-- <th>Recipe List</th> -->

					</tr>
				</thead>
				<tbody class="listPage">

					<c:forEach var="recipe" items="${recipes}">

						<tr>
							<td><a href="getRecipe.do?id=${recipe.id}">${recipe.name}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>






