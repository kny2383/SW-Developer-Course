import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ConnectException;
import java.net.Socket;

public class TcpIpClient5 {
public static void main(String args[]) {
		
		String serverIp="127.0.0.1";
		try {
			Socket socket = new Socket(serverIp,7777);
//		System.out.println("������ �������Դϴ�. ���� IP: "+serverIp);
		//������ �����Ͽ� ���� ��û
		
		
		System.out.println("������ ����Ǿ����ϴ�.");
		Sender sender = new Sender(socket);
		Receiver receiver = new Receiver(socket);
		
		sender.start();
		receiver.start();
		
//		InputStream in = socket.getInputStream();
//		DataInputStream dis = new DataInputStream(in);
//		
//		//�������� ���� ���� ������ ���
//		System.out.println("�����κ��� ���� �޽��� :"+dis.readUTF());
//		System.out.println("������ �����մϴ�.");
//		
//		dis.close();
//		socket.close();
//		System.out.println("������ ����Ǿ����ϴ�.");
	}catch(ConnectException ce) {
		ce.printStackTrace();
	}catch(IOException ie) {
		ie.printStackTrace();
	}catch(Exception e) {
		e.printStackTrace();
	}
}

}
