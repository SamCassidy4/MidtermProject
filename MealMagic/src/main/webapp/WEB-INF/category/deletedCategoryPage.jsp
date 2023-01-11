<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Confirmation</title>
<%@ include file="../bootstrap.jsp"%>
</head>
<body>
	<c:choose>
		<c:when test="${empty deletedCategory}">
			<h2>Your Category Was Deleted</h2>
		</c:when>
		<c:otherwise>
			<table>
				<thead>
					<tr>
						<!-- <th>ID</th> -->
						<th>Category Was Not Deleted..</th>

					</tr>
				</thead>
				<tbody>

					<c:forEach var="deletecountry" items="${category}">

						<tr>
							<%-- <td>${recipe.id}</td> --%>
							<td><a href="showCategory.do?id=${deletecategory.id}">${deletecategory.name}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>






