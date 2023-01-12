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
		<c:when test="${deletedComment}">
			<h2>Your Comment Was Deleted</h2>
		</c:when>
		<c:otherwise>
			<table>
				<thead>
					<tr>
						<!-- <th>ID</th> -->
						<th>Comment Was Not Deleted..</th>

					</tr>
				</thead>
				
			</table>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>






