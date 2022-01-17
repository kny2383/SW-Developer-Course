package Tread;

public class User2 extends Thread {
	private CalCulator calculator;
	
	public void setCalculator(CalCulator calculator) {
		this.setName("User2");
		this.calculator=calculator;
	}
	
	public void run() {
		calculator.setMemory(50);
	}

}