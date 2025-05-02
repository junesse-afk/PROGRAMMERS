package programmers_01;

import java.util.Scanner;

public class programmers_01 {

	public static void main(String[] args) {
		/*
		 머쓱이네 양꼬치 가게는 10인분을 먹으면 음료수 하나를 서비스로 줍니다.
		 
		 양꼬치는 1인분에 12,000원, 음료수는 2,000원입니다.
		 
		 정수 n과 k가 매개변수로 주어졌을 때, 양꼬치 n인분과 음료수 k개를 먹었다면
		 총얼마를 지불해야 하는지 return 하도록 solution 함수를 완성해보세요.
		 
		 예시 10인분을 시켜 서비스로 음료수를 하나 받아 총 10 * 12000 + 3 * 2000 - 1 * 2000 = 124,000원입니다.
		*/
		
		Scanner sc = new Scanner(System.in);
		int T = sc.nextInt();
		
		for (int i = 1; i <= T; i++) {
			int a = sc.nextInt(); //양꼬치개수
			int b = sc.nextInt(); //음료수개수
			
			int totalCost = pro(a, b);
			System.out.println(totalCost);
			
		}
		
		sc.close();
	}
	
	public static int pro(int a, int b) {
		final int yangccochi = 12000;
		final int drink = 2000;
		final int service = 10;
		
		int serviceDrink = a / service; //서비스 음료 개수
		int pay = b - serviceDrink; //실제 지불할 음료수 수
				
		return (a * yangccochi) + (pay * drink);
	}
}
