package Tread;

public class User1 extends Thread {
	private CalCulator calculator;
	
	public void setCalculator(CalCulator calculator) {
		this.setName("User1");
		this.calculator=calculator;
	}
	
	public void run() {
		calculator.setMemory(100);
	}

}
