package calculator;
import java.util.Scanner;

public class Calculator {
	public static void main(String args[])
	{
		Scanner num = new Scanner(System.in);
		
		System.out.print("���ڸ� �Է��Ͻÿ�.: ");
		String a = num.nextLine();
		System.out.print("���� ��ȣ�� �Է��Ͻÿ�.: ");
		String op = num.nextLine();
		System.out.print("���ڸ� �Է��Ͻÿ�.: ");
		String b = num.nextLine();
		
		int num1 = Integer.parseInt(a);
		int num2 = Integer.parseInt(b);
		int num3=0;
		
		if((op.equals("+")))
		{
		    num3 = num1+num2;
		}
		
		else if((op.equals("-")))
		{
		    num3 = num1-num2;
		}
		
		else if((op.equals("*")))
		{
		    num3 = num1*num2;
		}
		
		else if ((op.equals("/")))
		{
			if (b.equals("0"))
			{
				System.out.println("�ٽ� �Է��Ͻʽÿ�.");
			}
		    num3 = num1/num2;
		}
	    
		System.out.print(num3);	
	}
}

class User
{
	
}

