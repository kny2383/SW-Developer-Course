package Thread2;
public class ThreadNameExample {
	public static void main(String[] args) {
		// currentThread()�� �ڵ� �����ϴ� ���� ������ ��ü�� ������ ��´�.
		Thread mainThread = Thread.currentThread(); 
		System.out.println("���α׷� ���� ������ �̸�: "+ mainThread.getName());
		
		ThreadA threadA = new ThreadA();
		System.out.println("�۾� ������ �̸�: " + threadA.getName());
		threadA.start();
		
		ThreadB threadB = new ThreadB();
		System.out.println("�۾� ������ �̸�: " + threadB.getName());
		threadB.start();	
	}
}

// ThreadA�� ThreadB�� ������
// A�� setName���� �̸� ����
// B�� ���� �ʾƼ� �ڵ� ������ Thread-n ��������