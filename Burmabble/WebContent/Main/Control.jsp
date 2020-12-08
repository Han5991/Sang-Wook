<%@page import="java.util.ArrayList"%>
<%@page import="Bu.City"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String b = request.getParameter("b");

int inn = Integer.parseInt(request.getParameter("inn"));

int motel = Integer.parseInt(request.getParameter("motel"));

int hotel = Integer.parseInt(request.getParameter("hotel"));

//String resultCity = request.getParameter("resultCity");
//String Start = request.getParameter("Start");
//String Olympic = request.getParameter("Olympic");
//String Travel = request.getParameter("Travel");

FileInputStream fin = null;
ObjectInputStream oin = null;
ArrayList<City> city = new ArrayList<City>();
try {
	fin = new FileInputStream("abcd.text");
	oin = new ObjectInputStream(fin);
	city = (ArrayList) oin.readObject();
	for (int i = 0; i < city.size(); i++) {
		System.out.println("Con : " + city.get(i).toString());
	}
} catch (Exception e) {
	System.out.println("Con  E : " + e);
} finally {
	try {
		fin.close();
		oin.close();
	} catch (IOException ie) {
		System.out.println("Con IOE: " + ie);
	}
}

city.get(Integer.parseInt(b)).setpassagemoney(1, inn);
city.get(Integer.parseInt(b)).setpassagemoney(2, motel);
city.get(Integer.parseInt(b)).setpassagemoney(3, hotel);

FileOutputStream fout = null;
ObjectOutputStream oout = null;
try {
	fout = new FileOutputStream("abcd.text");
	oout = new ObjectOutputStream(fout);
	oout.writeObject(city);
	oout.reset();
	System.out.println("Con : 도시저장 완료");
} catch (Exception e) {
	System.out.println(e);
} finally {
	try {
		fout.close();
		oout.close();
	} catch (IOException ie) {
		System.out.println(ie);
	}
}

%>
<root>
    <status></status> 
    <record id="1">
        <subject><%=city.get(Integer.parseInt(b)).toString()%></subject> <!-- 사용자가 넘긴 데이터들 출력 -->
    </record>
    <!-- 추가 데이터 -->
    <record id="2">
        <subject></subject> 
        <content></content>
    </record>
</root>
