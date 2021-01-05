package ${package}.controller;

import ${package}.service.CalculatorWS;
import ${package}.service.CalculatorWSService;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import java.net.URLEncoder;

@WebServlet("/mvc/calculator")
public class CalculatorController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@WebServiceRef(CalculatorWSService.class)
	private CalculatorWS service;

	/**
	 * Called upon a GET request.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			// Gather the data that the client sends.
			String value1 = (String) request.getParameter("value1");
			String value2 = (String) request.getParameter("value2");
			String result = (String) request.getParameter("result");

			// Place the input data to the request scope.
			request.setAttribute("value1", value1);
			request.setAttribute("value2", value2);
			request.setAttribute("result", result);

			// Return the result page to the client.
			// NOTICE: The request forwards internally to a jsp page to produce the response html.
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/mvc_calculator.jsp");
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
			String value1 = (String) request.getParameter("value1");
			String value2 = (String) request.getParameter("value2");

			// Place the input data to the request scope.
			request.setAttribute("value1", value1);
			request.setAttribute("value2", value2);

			boolean validation = true;

			// Execute an action - here a data validation check.
			if (value1 == null || value1.trim().isEmpty()) {
				request.setAttribute("value1Validation", "field_required");
				validation = false;
			}

			if (value2 == null || value2.trim().isEmpty()) {
				request.setAttribute("value2Validation", "field_required");
				validation = false;
			}

			if (!validation) {
				// The flow must be interrupted because the input is not valid.
				// NOTICE: The request forwards internally to a jsp page to produce the response html.
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/mvc_calculator.jsp");
				rd.forward(request, response);
				return;
			}

			int i = Integer.parseInt(request.getParameter("value1"));
			int j = Integer.parseInt(request.getParameter("value2"));

			int result = service.add(i, j);

			// Redirect the client to the result page.
			String redirectUri = getRedirectURI(request, value1, value2, result);
			response.sendRedirect(redirectUri);
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private String getRedirectURI(HttpServletRequest request, String value1, String value2, int result) {
		try {
			return request.getRequestURI()
					+ "?result=" + URLEncoder.encode(String.valueOf(result), "UTF-8")
					+ "&value1=" + URLEncoder.encode(value1, "UTF-8")
					+ "&value2=" + URLEncoder.encode(value2, "UTF-8");
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
