<%@ tag pageEncoding="UTF-8" %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<!DOCTYPE html>
<html>
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

		<title>Test Template</title>

		<!-- Bootstrap CSS, JS + dependencies -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	</head>
	<body>

		<t:navigation>
			<jsp:attribute name="title">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">
					Hello
				</a>
			</jsp:attribute>
			<jsp:attribute name="links">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item ${pageContext.request.servletPath eq '/WEB-INF/jsps/home.jsp' ? 'active' : ''}">
						<a class="nav-link" href="${pageContext.request.contextPath}/mvc/home">Home</a>
					</li>
				</ul>
			</jsp:attribute>
		</t:navigation>

		<jsp:doBody />

	</body>
</html>
