package programmers_01;

import java.util.Scanner;

public class CodeRefactoring {
	
	private final static int yangccochi = 12000;
	private final static int drink = 2000;
	private final static int service_drink = 10;

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int T = sc.nextInt();
		
		for (int i = 1; i <= T; i++) {
			int yangccochiCount = sc.nextInt(); //양꼬치개수
			int drinkCount = sc.nextInt(); //음료수개수
			
			calculation(yangccochiCount, drinkCount);
		}
		
		sc.close();
	}
	
	public static void calculation(int yangccochiCount, int drinkCount) {

		int serviceDrink = yangccochiCount / service_drink; //서비스 음료 개수
		int pay = Math.max(drinkCount - serviceDrink, 0); //실제 지불할 음료수 수
		
		int yangccochiCost = yangccochiCount * yangccochi;
		int drinkCost = pay * drink;
		int totalCost = yangccochiCost + drinkCost;
		
		System.out.printf("%d인분을 시켜 서비스로 음료수를 %d개 받아 총 %d * %,d + %d * %,d = %,d원입니다.\n",
	            yangccochiCount, serviceDrink,
	            yangccochiCount, yangccochi,
	            pay, drink,
	            totalCost
	            );
	}

}

