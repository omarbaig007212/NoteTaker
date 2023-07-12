<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_css_js.jsp"%>
<title>View Notes</title>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>
	<br>
	<h1 style="margin: 10px; padding: 10px">This is View Notes Page.</h1>
	<div class="col-12" style="width: 20rem;">
		<%
		Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("from Note");
		List<Note> list = q.list();
		for (Note note : list) {
		%>
		<div class="card mt-3">
			<img class="card-img-top mx-auto" style="max-width: 150px;"
				src="Images/Note-img.png" alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title"><%=note.getTitle()%></h5>
				<p class="card-text"><%=note.getContent()%></p>
				<div class="container text-center">
					<a href="DeleteServlet?note_id=<%=note.getId()%>"
						class="btn btn-danger">Delete</a> 
						<a href="edit.jsp?note_id=<%=note.getId()%>"class="btn btn-primary">Update</a>
				</div>
			</div>
		</div>
		<%
		}
		s.close();
		%>
	</div>
</body>
</html>