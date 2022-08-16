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
<title>Book Share</title>
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
				<h1>Add a Book to Your Shelf!</h1>
				<a href="/books">back to the shelves</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<form:form action="/books/new" method="post" modelAttribute="book">
					<div class="container">
						<form:errors style="color: red" path="*" />
					</div>
					<table class="table">
						<tbody>
							<tr>
								<td><form:label path="title">Title:</form:label></td>
								<td><form:input path="title" /></td>
							</tr>
							<tr>
								<td><form:label path="author">Author:</form:label></td>
								<td><form:input path="author" /></td>
							</tr>
							<tr>
								<td><form:label path="my_thoughts">My thoughts:</form:label></td>
								<td><form:textarea path="my_thoughts" /></td>
							</tr>

							<tr>
								<td><input type="submit" value="Submit" /></td>
							</tr>
						</tbody>
					</table>
				</form:form>

			</div>
		</div>
	</div>
</body>
</html>