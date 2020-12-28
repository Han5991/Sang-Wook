package Bu2;

import java.util.ArrayList;

public class Player2 {
	private String id;
	private int money = 100000;
	private ArrayList<City2> citys = new ArrayList<City2>();
	private static Player2 player2 = new Player2();

	private Player2() {
	}

	public static Player2 getInstance() {
		return player2;
	}

	public Player2(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String toString() {
		return "id : " + id + ", money : " + money;
	}
}