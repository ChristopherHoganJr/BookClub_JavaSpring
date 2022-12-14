<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col d-flex align-items-center justify-content-between">
				<h1>
					Welcome
					<c:out value="${currentUser.userName}" />
				</h1>
				<a href="/logout">logout</a>
			</div>
		</div>
		<div class="row">
			<div class="col d-flex justify-content-between align-items-center">
				<p>Books from everyone's shelves:</p>
				<a href="/books/new">+ Add a book to my shelf!</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Title</th>
							<th scope="col">Author Name</th>
							<th scope="col">Posted By</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${books}">
							<tr>
								<th scope="row"><c:out value="${book.id}" /></th>
								<td><a href="/books/${book.id}"><c:out
											value="${book.title}" /></a></td>
								<td><c:out value="${book.author}" /></td>
								<td><c:out value="${book.user.userName}" /></td> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>