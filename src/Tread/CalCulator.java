package Tread;

public class CalCulator {
	private int memory;
	
	public int getMemory() {
		return memory;
	}
	
	//synchronized ¿¹Á¦
	public synchronized void setMemory(int memory) {
		this.memory = memory;
		try {
			Thread.sleep(2000);
			
		} catch(InterruptedException e) {}
		System.out.println(Thread.currentThread().getName()+": "+this.memory);
	}

}
