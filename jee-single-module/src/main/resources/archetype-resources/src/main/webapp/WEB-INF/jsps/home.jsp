<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	<div class="container">
		<c:choose>
			<c:when test="${empty username}">
				<form method="post">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="firstname">Όνομα</label>
								<input type="text" class="form-control" name="firstname" value="${firstname}" placeholder="Συμπλήρωσε το όνομά σου" />
								<c:if test="${not empty firstnameValidation}">
									<small class='form-text'>${firstnameValidation}</small>
								</c:if>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="lastname">Επώνυμο</label>
								<input type="text" class="form-control" name="lastname" value="${lastname}" placeholder="Συμπλήρωσε το επώνυμό σου" />
								<c:if test="${not empty lastnameValidation}">
									<small class='form-text'>${lastnameValidation}</small>
								</c:if>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<button type="submit" class="btn btn-primary">Υποβολή</button>
						</div>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-sm-12">
						<p>Hello ${username}!</p>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</t:template>
