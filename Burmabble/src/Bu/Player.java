package Bu;

import java.io.Serializable;
import java.util.ArrayList;

public class Player implements Serializable {
	private String id;
	private int money = 100000;
	private ArrayList<City> citymaster = new ArrayList<City>();

	public Player(String id) {
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