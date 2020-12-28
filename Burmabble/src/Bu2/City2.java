package Bu2;

public class City2 {
	private String name, master;
	private int Numberinn, inn, Numbermotel, motel, Numberhotel, hotel, passagemoney;

	public City2(String name, String master) {
		this.name = name;
		this.master = master;

		this.inn = 1000;
		this.Numberinn = 0;

		this.motel = 2000;
		this.Numbermotel = 0;

		this.hotel = 3000;
		this.Numberhotel = 0;

		this.passagemoney = 0;
	}

	public void setmaster(String master) {
		this.master = master;
	}

	public void setpassagemoney(int type, int number) {
		switch (type) {
		case 0:
			passagemoney += number;
			break;
		case 1:
			passagemoney += inn * number;
			Numberinn += number;
			break;
		case 2:
			passagemoney += motel * number;
			Numbermotel += number;
			break;
		case 3:
			passagemoney += hotel * number;
			Numberhotel += number;
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
		return "name : " + getName() + ", master : " + getMaster() + ", passagemoney : " + getPassagemoney();
	}
}