package ${package}.service;

import javax.ejb.Stateless;

@Stateless
public class CalculatorServiceImpl implements CalculatorService {

	@Override
	public int add(int i, int j) {
		return i + j;
	}
}
