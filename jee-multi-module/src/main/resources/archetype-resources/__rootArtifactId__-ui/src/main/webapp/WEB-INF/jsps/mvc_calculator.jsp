<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	<div class="container main-container">
		<!-- NOTICE: The post back will be on the URL of the MVC controller. -->
		<form action="${pageContext.request.contextPath}/mvc/calculator" method="post" >
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="value1"><fmt:message key="calculator_value1" /></label>
						<input type="text" class="form-control" name="value1" value="${value1}" size="3" placeholder="Enter value 1" />
						<c:if test="${not empty value1Validation}">
							<small class='form-text'><fmt:message key="${value1Validation}" /></small>
						</c:if>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="value2"><fmt:message key="calculator_value2" /></label>
						<input type="text" class="form-control" name="value2" value="${value2}" size="3" placeholder="Enter value 2" />
						<c:if test="${not empty value2Validation}">
							<small class='form-text'><fmt:message key="${value2Validation}" /></small>
						</c:if>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<button type="submit" class="btn btn-primary"><fmt:message key="calculator_submit" /></button>
				</div>
			</div>
			<c:if test="${not empty result}">
				<div class="row">
					<div class="col-sm-12">
						<p>Result: <span>${result}</span></p>
					</div>
				</div>
			</c:if>
		</form>
	</div>
</t:template>
