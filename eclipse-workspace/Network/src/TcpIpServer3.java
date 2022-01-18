import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.text.SimpleDateFormat;
import java.util.Date;

//5�ʶ�� ���ӿ�û�ð� �ο� �޼ҵ�
public class TcpIpServer3 {
	public static void main(String args[])
	{
		ServerSocket serverSocket = null;
		
		try {
			//���������� �����Ͽ� 7777�� ��Ʈ�� ���ս�Ų��.
			serverSocket = new ServerSocket(7777);
			System.out.println(getTime()+"������ �غ�Ǿ����ϴ�.");
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		while(true) {
			try {
				//��������
				System.out.println(getTime()+"�����û�� ��ٸ��ϴ�.");
				
				//��û���ð�
				serverSocket.setSoTimeout(5*1000);
				
				//���� ������ Ŭ���̾�Ʈ�� �����û�� �� ������ ��ٸ���.
				//Ŭ���̾�Ʈ�� �����û�� ���� Ŭ���̾�Ʈ ���ϰ� ����� ���ο� ���� ����
				Socket socket = serverSocket.accept(); // �������
				System.out.println(getTime()+socket.getInetAddress()+"�� ���� �����û�� ���Խ��ϴ�.");
				
				System.out.println("getPort():"+socket.getPort());
				System.out.println("getLocalPort():"+socket.getLocalPort());
				
				//������ ��½�Ʈ���� ��´�.
				OutputStream out = socket.getOutputStream();
				DataOutputStream dos = new DataOutputStream(out);
				
				//���ݼ���(remote socket)�� �����͸� ������.
				dos.writeUTF("[Notice] Test Message1 from Server.");
				System.out.println(getTime()+"�����͸� �����߽��ϴ�.");
				
				dos.close();
				socket.close();
			
			//����Exception���� �������.
			}catch(SocketTimeoutException e) {
				System.out.println("������ �ð����� ���ӿ�û�� ��� ������ �����մϴ�.");
				System.exit(0);
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}//main

//	private static String getTime() {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	//����ð��� ���ڿ��� ��ȯ�ϴ� �Լ�
	static String getTime() {
		SimpleDateFormat f= new SimpleDateFormat("[hh:mm:ss]");
		return f.format(new Date());
	}
}
