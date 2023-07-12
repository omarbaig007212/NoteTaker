<%@page import="org.hibernate.Transaction"%>
<%@page import="com.entity.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note</title>
<%@include file="all_css_js.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>
	<br>
	<h1 style="margin: 10px; padding: 10px">Edit your information.</h1>
	<%
		Integer noteId = Integer.parseInt(request.getParameter("note_id"));
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		s.close();
	%>
	<form action="EditNoteServlet" method="post"
		style="margin: 10px; padding: 10px">
		<div class="form-group">
			<input name="note_id" value="<%=note.getId()%>" type="hidden">
			<label for="Title">Title</label> <input type="text" name="title"
				class="form-control" id="title" placeholder="Enter Title"
				value="<%=note.getTitle()%>" required>
		</div>
		<div class="form-group">
			<label for="Content">Enter Content</label>
			<textarea name="content" class="form-control"
				placeholder="Enter Content" id="Content" rows="4" required><%= note.getContent() %></textarea>
		</div>
		<button type="submit" class="btn btn-primary">Update</button>
	</form>
</body>
</html>