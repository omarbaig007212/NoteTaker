package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Note note = new Note(title, content, new Date());
			System.out.println(note.getId() + " - " + note.getContent() + " - " + note.getTitle());

			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();

			session.save(note);

			tx.commit();
			session.close();

			PrintWriter writer = response.getWriter();
			response.setContentType("text/html");
			writer.println("<h1 style='text-align:center'>Data Added Successfully!.</h1>");
			writer.println("<h1 style='text-align:center'><a href='view_notes.jsp'>View Notes</a></h1>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
