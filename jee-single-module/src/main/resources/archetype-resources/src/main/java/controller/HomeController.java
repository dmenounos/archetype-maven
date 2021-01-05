package ${package}.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Called upon a GET request.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			// Gather the data that the client sends.
			String username = (String) request.getParameter("username");

			// Place the input data to the request scope.
			request.setAttribute("username", username);

			// Return the result page to the client.
			// NOTICE: The request forwards internally to a jsp page to produce the response html.
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/home.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Called upon a POST request.
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			// Gather the data that the client sends.
			String firstname = (String) request.getParameter("firstname");
			String lastname  = (String) request.getParameter("lastname");

			// Place the input data to the request scope.
			request.setAttribute("firstname", firstname);
			request.setAttribute("lastname", lastname);

			boolean validation = true;

			// Execute an action - here a data validation check.
			if (firstname == null || firstname.trim().isEmpty()) {
				request.setAttribute("firstnameValidation", "Το πεδίο είναι υποχρεωτικό.");
				validation = false;
			}

			if (lastname == null || lastname.trim().isEmpty()) {
				request.setAttribute("lastnameValidation", "Το πεδίο είναι υποχρεωτικό.");
				validation = false;
			}

			if (!validation) {
				// The flow must be interrupted because the input is not valid.
				// NOTICE: The request forwards internally to a jsp page to produce the response html.
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/home.jsp");
				rd.forward(request, response);
				return;
			}

			// Redirect the client to the result page.
			String username = URLEncoder.encode(firstname + " " + lastname, "UTF-8");
			response.sendRedirect(request.getRequestURI() + "?username=" + username);
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
