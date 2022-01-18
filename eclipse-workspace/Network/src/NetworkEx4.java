import java.net.*;
import java.io.*;

public class NetworkEx4 {
	public static void  main(String args[]) {
		URL url = null;
		BufferedReader input = null;
		String address = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=react";
		String line = "";

		try {
			url = new URL(address);

			//������Ʈ�� BufferedReader
			//openStream() : �����Ͱ� �带 �� �ֵ��� �������ִ� ��� �޼���
		    input = new BufferedReader(new InputStreamReader(url.openStream()));
		  

			while((line=input.readLine()) !=null) {
				System.out.println(line);
			}
			input.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
