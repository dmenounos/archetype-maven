package ${package}.resource;

import ${package}.service.CalculatorWS;
import ${package}.service.CalculatorWSService;

import javax.enterprise.context.RequestScoped;
import javax.json.Json;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import javax.xml.ws.WebServiceRef;
import java.net.URI;

@RequestScoped
@Path("/calculator")
public class CalculatorResource {

	@WebServiceRef(CalculatorWSService.class)
	private CalculatorWS service;

	@Context
	private UriInfo uriInfo;

	/**
	 * Called upon a GET request.
	 */
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response doGet(@QueryParam("result") String result) {
		try {
			JsonObjectBuilder json = Json.createObjectBuilder();

			json.add("result", result);

			// Return the result data to the client.
			// NOTICE: The request produces the response in json form (not html).
			return Response.status(Response.Status.OK).entity(json.build().toString()).build();
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Called upon a POST request.
	 */
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public Response doPost(@FormParam("value1") String value1, @FormParam("value2") String value2) {
		try {
			JsonObjectBuilder json = Json.createObjectBuilder();

			boolean validation = true;

			// Execute an action - here a data validation check.
			if (value1 == null || value1.trim().isEmpty()) {
				json.add("value1-validation", "field_required");
				validation = false;
			}

			if (value2 == null || value2.trim().isEmpty()) {
				json.add("value2-validation", "field_required");
				validation = false;
			}

			if (!validation) {
				// The flow must be interrupted because the input is not valid.
				// NOTICE: The request produces the response in json form (not html).
				return Response.status(Response.Status.BAD_REQUEST).entity(json.build().toString()).build();
			}

			int i = Integer.parseInt(value1);
			int j = Integer.parseInt(value2);

			int result = service.add(i, j);

			// Redirect the client to the result resource.
			URI redirectUri = getRedirectURI(uriInfo, result);
			return Response.status(Response.Status.SEE_OTHER).location(redirectUri).build();
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private URI getRedirectURI(UriInfo uriInfo, int result) {
		try {
			return new URI(uriInfo.getPath() + "?result=" + result);
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
