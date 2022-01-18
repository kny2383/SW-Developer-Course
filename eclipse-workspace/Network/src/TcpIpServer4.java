import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TcpIpServer4 implements Runnable {
	ServerSocket serverSocket;
	Thread[] threadArr;
	
	public static void main(String args[])
	{
		TcpIpServer4 server=new TcpIpServer4(5);
		server.start();
	}


	public TcpIpServer4(int num) {
		try {
			//���������� �����Ͽ� 7777�� ��Ʈ�� ���ս�Ų��.
			serverSocket = new ServerSocket(7777);
			System.out.println(getTime()+"������ �غ�Ǿ����ϴ�.");
			threadArr=new Thread[num];
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public void start() {
		for(int i=0; i<threadArr.length; i++) {
			threadArr[i] = new Thread(this);
			threadArr[i].start();
		}
	}
		
	public void run() {
		while(true) {
			try {
				System.out.println(getTime()+"�����û�� ��ٸ��ϴ�.");
				//���� ������ Ŭ���̾�Ʈ�� �����û�� �� ������ ��ٸ���.
				//Ŭ���̾�Ʈ�� �����û�� ���� Ŭ���̾�Ʈ ���ϰ� ����� ���ο� ���� ����
				Socket socket = serverSocket.accept(); // �������
				System.out.println(getTime()+socket.getInetAddress()+"�� ���� �����û�� ���Խ��ϴ�.");
				
				//������ ��½�Ʈ���� ��´�.
				OutputStream out = socket.getOutputStream();
				DataOutputStream dos = new DataOutputStream(out);
				
				//���ݼ���(remote socket)�� �����͸� ������.
				dos.writeUTF("[Notice] Test Message1 from Server.");
				System.out.println(getTime()+"�����͸� �����߽��ϴ�.");
				
				dos.close();
				socket.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//����ð��� ���ڿ��� ��ȯ�ϴ� �Լ�
	static String getTime() {
		String name = Thread.currentThread().getName();
		SimpleDateFormat f= new SimpleDateFormat("[hh:mm:ss]");
		return f.format(new Date()+name);
	}
}//class



