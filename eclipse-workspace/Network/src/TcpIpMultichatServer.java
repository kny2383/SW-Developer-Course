import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;

public class TcpIpMultichatServer {
	//HashMap: Ŭ���̾�Ʈ ������ ������
		HashMap clients;
		
		TcpIpMultichatServer(){
			clients = new HashMap(); 
			Collections.synchronizedMap(clients); //������ü�� cilents�� ����ȭ
		}
		
		public void start() {
			ServerSocket serverSocket = null;
			Socket socket = null;
			
			try {
				serverSocket = new ServerSocket(777);
				System.out.println("������ �غ�Ǿ����ϴ�.");
				
			    while(true) {
			    	socket= serverSocket.accept();
			    	System.out.println("["+socket.getInetAddress()+":"+socket.getPort()+"]");
			    	ServerReceiver thread = new ServerReceiver(socket);
			    	thread.start();
			    }
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}//start()
		
		void sendToAll(String msg) {
			//iterator: set,list �ȿ� �ִ� ��ҵ��� �ݺ��ؼ� ã�ư�
			//keySet(): Set�� key�� �����ִ� �޼ҵ�
			//keySet().iterator(): Set�� iterator
			Iterator it = clients.keySet().iterator(); 
			
			while (it.hasNext()) { //���� ��Ұ� �ִ� ����
				try {
					DataOutputStream out = (DataOutputStream)clients.get(it.next());
					out.writeUTF(msg); //���ڿ� ���
				}catch(IOException e) {}
			}//while
		}//sendToAll
	    public static void main(String[] args) {
	    	new TcpIpMultichatServer().start();
	    }
	    class ServerReceiver extends Thread { //���� class
	    	Socket socket;
	    	DataInputStream in;
	    	DataOutputStream out;
	    	
	    	ServerReceiver(Socket socket){
	    		this.socket = socket;
	    		try {
	    			in = new DataInputStream(socket.getInputStream());
	    			out = new DataOutputStream(socket.getOutputStream());
	    		}catch(IOException e) {}
	    	}
	    	
	    	public void run() {
	    		String name ="";
	    		try {
	    			name = in.readUTF(); //in���� ���ڿ� �б�
	    			sendToAll("#"+name+"���� �����̽��ϴ�.");
	    			
	    			clients.put(name,out); //put()�� ���ڷ� key�� value�� �޴´� �ַ� HashMap�� �̿�
	    			System.out.println("���� ���� ������ ����"+clients.size()+"�Դϴ�.");
	    			
	    			while(in!=null) {
	    				sendToAll(in.readUTF());
	    			}
	    		}catch(IOException e) {
	    			//ignore
	    		}finally {
	    			sendToAll("#"+name+"���� �����̽��ϴ�.");
	    			clients.remove(name); //key �Ѱ��ֱ�
	    			System.out.println("["+socket.getInetAddress()+":"+socket.getPort()+"]");
	    			System.out.println("���� ���� ������ ����"+clients.size()+"�Դϴ�.");
	    		}//try
	    	}//run
	    }
}
