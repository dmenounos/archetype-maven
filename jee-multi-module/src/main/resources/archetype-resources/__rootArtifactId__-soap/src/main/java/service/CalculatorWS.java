package ${package}.service;

import ${package}.service.CalculatorService;

import javax.ejb.EJB;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService(targetNamespace = "${targetNamespace}")
public class CalculatorWS {

	@EJB
	private CalculatorService service;

	@WebMethod(operationName = "add")
	public int add(@WebParam(name = "i") int i, @WebParam(name = "j") int j) {
		return service.add(i, j);
	}
}
