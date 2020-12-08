package Bu;

import java.io.Serializable;

public class City implements Serializable {
	private String name;
	private String master;
	private int inn;
	private int motel;
	private int hotel;
	private int passagemoney;

	public City(String name, String master) {
		this.name = name;
		this.master = master;
		this.inn = 1000;
		this.motel = 2000;
		this.hotel = 3000;
		this.passagemoney = 0;
	}

	public void setmaster(String master) {
		this.master = master;
	}

	public void setpassagemoney(int type, int number) {
		switch (type) {
		case 1:
			passagemoney += inn * number;
			break;
		case 2:
			passagemoney += motel * number;
			break;
		case 3:
			passagemoney += hotel * number;
			break;
		default:
			System.out.println("잘 못 된 접근입니다.");
		}
		
	}

	public String getName() {
		return name;
	}

	public String getMaster() {
		return master;
	}

	public int getPassagemoney() {
		return passagemoney;
	}

	@Override
	public String toString() {
		return "name : " +getName() + ", master : " + getMaster() + ", passagemoney : " + getPassagemoney();
	}
}