<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	<div class="container main-container">
		<!-- NOTICE: The post back will be on the URL of the REST resource. -->
		<form action="${pageContext.request.contextPath}/rest/calculator" method="post" id="calc-form">
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="value1"><fmt:message key="calculator_value1" /></label>
						<input type="text" class="form-control" name="value1" value="${value1}" size="3" placeholder="Enter value 1" />
						<!-- -->
							<small class='form-text d-none' id="value1-validation"><!-- --></small>
						<!-- -->
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="value2"><fmt:message key="calculator_value2" /></label>
						<input type="text" class="form-control" name="value2" value="${value2}" size="3" placeholder="Enter value 2" />
						<!-- -->
							<small class='form-text d-none' id="value2-validation"><!-- --></small>
						<!-- -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<button type="submit" class="btn btn-primary"><fmt:message key="calculator_submit" /></button>
				</div>
			</div>
			<!-- -->
				<div class="row d-none" id="calc-result">
					<div class="col-sm-12">
						<p>Result: <span><!-- --></span></p>
					</div>
				</div>
			<!-- -->
		</form>
	</div>
	<script>
	$(function() {
		var messages = {
			'field_required' : '<fmt:message key="field_required" />'
		};

		$('#calc-form').on('submit', function(event) {
			event.preventDefault();
			var form = $(this);

			// reset validation messages
			$('#calc-form small.form-text').addClass('d-none').html('');

			// reset result message
			$('#calc-result').addClass('d-none');
			$('#calc-result p span').html('');

			// submit form
			var request = new XMLHttpRequest();
			request.open(form.attr('method'), form.attr('action'), true);
			request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
			request.send(form.serialize());
			request.onload = function() {
				console.log('onload response:', this.status, this.response);

				switch (this.status) {
				case 200:
					var data = JSON.parse(this.response);
					$('#calc-result p span').html(data.result);
					$('#calc-result').removeClass('d-none');
				case 400:
					var data = JSON.parse(this.response);
					Object.keys(data).forEach(function(k, i) {
						$('#' + k).html(messages[data[k]]);
						$('#' + k).removeClass('d-none');
					});
				}
			};
			request.onerror = function() {
				console.log('onerror response:', this.status, this.response);
			};
		});
	});
	</script>
</t:template>
