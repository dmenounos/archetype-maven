<%@ tag pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<fmt:setBundle basename="messages" scope="session" />

<!DOCTYPE html>
<html>
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

		<title><fmt:message key="template_title" /></title>

		<!-- Bootstrap CSS, JS + dependencies -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" />

	</head>
	<body>

		<t:navigation>
			<jsp:attribute name="title">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">
					<fmt:message key="template_title" />
				</a>
			</jsp:attribute>
			<jsp:attribute name="links">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item ${pageContext.request.servletPath eq '/WEB-INF/jsps/mvc_calculator.jsp' ? 'active' : ''}">
						<!-- NOTICE: The URL points to a *controller* in the MVC case. -->
						<a class="nav-link" href="${pageContext.request.contextPath}/mvc/calculator">MVC</a>
					</li>
					<li class="nav-item ${pageContext.request.servletPath eq '/rest_calculator.jsp' ? 'active' : ''}">
						<!-- NOTICE: The URL points to a *page* in the REST case. -->
						<a class="nav-link" href="${pageContext.request.contextPath}/rest_calculator.jsp">REST</a>
					</li>
				</ul>
			</jsp:attribute>
		</t:navigation>

		<jsp:doBody />

	</body>
</html>
