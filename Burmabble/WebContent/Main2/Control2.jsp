<%@page import="java.util.ArrayList"%>
<%@page import="Bu2.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
/*---------플레이어 정보----------*/
String b = request.getParameter("b"); //플레이어의 위치
String who = request.getParameter("who"); // 플레이어 구분

/*---------도시 정보----------*/
String cityname = request.getParameter("city");
System.out.print(cityname);
int inn = Integer.parseInt(request.getParameter("inn"));
int motel = Integer.parseInt(request.getParameter("motel"));
int hotel = Integer.parseInt(request.getParameter("hotel"));

ArrayList<City2> city = new ArrayList<City2>();
ArrayList<Player2> player = new ArrayList<Player2>();

/*----------데이터 수정(도시 및 건물 구매) ----------*/
String error = "";
String result = "";
if (city.get(Integer.parseInt(b)).getMaster().equals(who) || city.get(Integer.parseInt(b)).getMaster().equals("null")) {//도시 주인 확인
	int sum = 0;
	if (cityname.equals("on")) {
		sum = inn * 1000 + motel * 2000 + hotel * 3000 + 5000;
	} else
		sum = inn * 1000 + motel * 2000 + hotel * 3000;
	if (player.get(Integer.parseInt(who.replace("p", "")) - 1).getMoney() >= sum) {
		// 도시 구매
		if (cityname.equals("on")) {
	city.get(Integer.parseInt(b)).setmaster(who);//도시 주인 표시
	city.get(Integer.parseInt(b)).setpassagemoney(0, 7000);//도시 구매 시 통행료 증가
		}
		// 건물 구매
		city.get(Integer.parseInt(b)).setpassagemoney(1, inn * 2);
		city.get(Integer.parseInt(b)).setpassagemoney(2, motel * 2);
		city.get(Integer.parseInt(b)).setpassagemoney(3, hotel * 2);
		//돈 차감
		player.get(Integer.parseInt(who.replace("p", "")) - 1)
		.setMoney(player.get(Integer.parseInt(who.replace("p", "")) - 1).getMoney() - sum);
	} else {
		error = "돈이 부족합니다";
	}
} else {
	if (who.equals("p1")) {
		player.get(0).setMoney(player.get(0).getMoney() - city.get(Integer.parseInt(b)).getPassagemoney());
		System.out.print("돈 지불");
	} else {
		player.get(1).setMoney(player.get(1).getMoney() - city.get(Integer.parseInt(b)).getPassagemoney());
		System.out.print("돈 지불");
	}
}

/*----------------------------------------------*/
%>
<root> <status></status> <!-- 사용자가 넘긴 데이터들 출력 --> <record id="1">
<subject><%=city.get(Integer.parseInt(b)).toString()%></subject> <content1><%=player.get(0).toString()%></content1>
<content2><%=player.get(1).toString()%></content2> <content3><%=error%></content3>
<content4><%=city.get(Integer.parseInt(b)).getPassagemoney()%></content4>
</record> <!-- 추가 데이터 --> <record id="2"> <subject></subject> <content></content>
</record> </root>
