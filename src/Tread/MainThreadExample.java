package Tread;

public class MainThreadExample {
	public static void main(String[] args) {
		CalCulator calculator = new CalCulator();
		
		User1 user1 = new User1();
		user1.setCalculator(calculator);
		user1.start();
		
		User2 user2 = new User2();
		user2.setCalculator(calculator);
		user2.start();
		
		
	}

}
