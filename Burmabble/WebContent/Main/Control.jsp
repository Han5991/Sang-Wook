<%@page import="java.util.ArrayList"%>
<%@page import="Bu.City"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String b = request.getParameter("b");

FileInputStream fin = null;
ObjectInputStream oin = null;
ArrayList<City> city = new ArrayList<City>();
try {
	fin = new FileInputStream("City.text");
	oin = new ObjectInputStream(fin);
	city = (ArrayList) oin.readObject();
	for (int i = 0; i < city.size(); i++) {
		System.out.println("Con : " + city.get(i).toString());
	}
} catch (Exception e) {
	System.out.println("con  E : " + e);
} finally {
	try {
		fin.close();
		oin.close();
	} catch (IOException ie) {
		System.out.println("Con IOE: " + ie);
	}
}
city.get(Integer.parseInt(b));
%>
<p id="dicesum"><%=b%></p>