package CVSProgram;
import java.util.*;

public class CVS {
	public static void main(String args[])
	{
		new Service().serviceInfo();
	}
	

}

//������
class Stock {
	private String title; // ��ǰ ����
	private int price; // ��ǰ ����
	private int amount; // ��ǰ ����
	
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title=title;
	}
	
	public int getPrice()
	{
		return price;
	}
	public void setPrice(int price)
	{
		this.price=price;
	}
	
	public int getAmount()
	{
		return amount;
	}
	public void setAmount(int amount)
	{
		this.amount=amount;
	}
	
	@Override
	public String toString()
	{
		return "Shopping[title="+title+", price="+price+", amount="+amount+"]";
	}
	
}

//��ɼ���޼ҵ�����
class Service {
	Scanner info = new Scanner(System.in);
	Check ch = Check.getInstance();
	int info1, info2, info3, info4;
	
	public void serviceInfo() {
		System.out.println("�ʿ��� ����� �Է��Ͻÿ�.");
		System.out.println("1. �԰�");
		System.out.println("2. �Ǹ�");
		System.out.println("3. ȯ��");
		System.out.println("4. ���Ȯ��");
		System.out.print("�Է�:");
		int info1 = info.nextInt();
		
		if(info1 == 1)
		{
			storeService();
		}
		
		else if(info1 == 2)
		{
			sellService();
		}
		
		else if(info1 == 3)
		{
			refundService();
		}
		
		else if(info1 == 4)
		{
			stockCheck();
		}
	}
	
	public void storeService() {
		do {
			int info1 = info.nextInt();
			System.out.println("�� �׸���� �Է��Ͻÿ�.");
			System.out.println("��ǰ ����: ");
			String goodsInfo = info.next();
			
			System.out.println("��ǰ ����: ");
			int price = info.nextInt();
			
			System.out.println("��ǰ ����: ");
			int amount = info.nextInt();
		}while(info1!=0);
		
		ch.add(title, int price, int amount);
	}
	
	public void sellService() {

	}
	
	public void refundService() {
		
		
	}
	
	public void stockCheck() {
		
		
	}
	
class Check {
	private static Check instance;
	public static Check getInstance() {
		if(instance ==null)
			instance = new Check();
		return instance;
	}
	
	
	private Service[] ser;
	private int MAX_SIZE = 100;
	private int idx;
	
	private Check() {
		ser = new Service[MAX_SIZE];
		idx=0;
	}
	
	public void add(String title,int price,int amount) {
		Stock s = new Stock();
		s.setTitle(title);
		s.setPrice(price);
		s.setAmount(amount);
		ser[idx++]=s;
	}
	
	public void list() {
		for(int i=0;i<idx;i++)
			System.out.println(ser[i]);
		
	}
	
}



}