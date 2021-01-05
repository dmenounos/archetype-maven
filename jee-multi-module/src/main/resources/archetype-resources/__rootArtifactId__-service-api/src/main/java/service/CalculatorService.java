package ${package}.service;

import javax.ejb.Local;

@Local
public interface CalculatorService {

	int add(int i, int j);
}
