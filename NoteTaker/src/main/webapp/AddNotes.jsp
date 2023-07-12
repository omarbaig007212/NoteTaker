<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes</title>
<%@include file="all_css_js.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>
	<br>
	<h1 style="margin: 10px; padding: 10px">This is AddNotes Page.</h1>

	<form action="SaveNoteServlet" method="post" style="margin: 10px; padding: 10px">
		<div class="form-group">
			<label for="Title">Title</label> 
			<input type="text"
				name = "title"
				class="form-control" id="title" placeholder="Enter Title" required>
		</div>
		<div class="form-group">
			<label for="Content">Enter Content</label>
			<textarea name="content" class="form-control" placeholder="Enter Content" id="Content" rows="4" required></textarea>
		</div>
		<button type="submit" class="btn btn-primary">Add</button>
	</form>
</body>
</html>