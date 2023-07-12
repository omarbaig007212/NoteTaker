package com.servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer noteId = Integer.parseInt(request.getParameter("note_id"));
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		Note note = (Note) session.get(Note.class, noteId);
		session.delete(note);
		tx.commit();
		session.close();
		response.sendRedirect("view_notes.jsp");
	}

}
