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
					<c:out value="${book.title}" />
				</h1>
				<a href="/books">back to the shelves</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h3>
					<c:if test="${book.user.id == user_id}">You</c:if>
					<c:if test="${book.user.id != user_id}"><c:out value="${book.user.userName}" /></c:if>
					read
					<c:out value="${book.title }" />
					by
					<c:out value="${book.author}" />
				</h3>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h3>
					Here are <c:if test="${book.user.id == user_id}">your</c:if>
					<c:if test="${book.user.id != user_id}"><c:out value="${book.user.userName}" /></c:if>
					thoughts
				</h3>
				<hr />
				<p>
					<c:out value="${book.my_thoughts}" />
				</p>
				<hr />
			</div>
		</div>
		<div class="row">
			<div class="col">
				<c:if test="${book.user.id == user_id}">
					<a class="btn btn-sm btn-warning"
						href="/books/<c:out value="${book.id}" />/edit">Edit</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>