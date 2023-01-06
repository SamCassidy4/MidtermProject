<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../bootstrap.jsp"%>
</head>
<body>
<h1>List of All Recipes</h1>



	<c:choose>
		<c:when test="${empty recipes}">
			<h2>No Recipe Found</h2>
		</c:when>
		<c:otherwise>
			<table>
				<thead>
					<tr>
						<!-- <th>ID</th> -->
						<th>Recipe List</th>

					</tr>
				</thead>
				<tbody>

					<c:forEach var="recipe" items="${recipes}">

						<tr>
							<%-- <td>${recipe.id}</td> --%>
							<td><a href="getRecipe.do?id=${recipe.id}">${recipe.name}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>






