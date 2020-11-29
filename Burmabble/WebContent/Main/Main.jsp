<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bu.City"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	p1 = 0;
	p2 = 0;
	
	window.onload = function() {
		var player1 = document.getElementById("player1");
		var player2 = document.getElementById("player2");
		var diceveiw1 = document.getElementById("dice1");
		var diceveiw2 = document.getElementById("dice2");
		var timer= document.getElementById("time");
		var result = document.getElementById("result");
		var dicesum = document.getElementById("dicesum");
		var purchase = document.getElementById("purchase");
		purchase.onclick= function() {
			
		}
		player2.disabled = true;
		result.style.display="none";
		player1.onclick = function() {
			//결과창에 서브 창 띄우기
			result.style.display="block";
			//순서대로 번호를 누르기 위한 작업
			player1.disabled = true;
			
			//두 개의 주사위를 각 각 던져서 화면에 표시하고 말판을 움직임
			var dice1 = Math.floor(((Math.random() * 5 + 1)))
			var dice2 = Math.floor(((Math.random() * 5 + 1)))
			diceveiw1.innerHTML = dice1;
			diceveiw2.innerHTML = dice2;
			dicesum.value = dice1 + dice2

			var c = ((p1) % 32).toFixed(0);
			p1 += dicesum.value;

			var b = ((p1) % 32).toFixed(0);
			dicesum.innerHTML = dicesum.value;
			
			//파랑색으로 바뀌기 전에 흰색으로 초기화
			var bg2 = document.getElementById(c);
			bg2.style.backgroundColor = "#ffffff";
			//주사위가 움직인 만큼 파랑색으로 바뀜 
			var bg = document.getElementById(b);
			city.innerHTML = bg.innerHTML;
			bg.style.backgroundColor = "#0000ff";
			//한 턴 당 시간 셋팅
			setTimeout(() => {
				clearInterval(g);
				player2.disabled = false;
				timer.value=0;
			}, 0);
			
			var t =0;
			
			var g =setInterval(function() {
				t++;
				timer.value=t;
			}, 1000)
		}

		player2.onclick = function() {
			//순서대로 번호를 누르기 위한 작업
			player2.disabled = true;
			//결과창에 서브 창 띄우기
			result.style.display="block";
			
			//두 개의 주사위를 각 각 던져서 화면에 표시하고 말판을 움직임
			var dice1 = Math.floor(((Math.random() * 5 + 1)))
			var dice2 = Math.floor(((Math.random() * 5 + 1)))
			diceveiw1.innerHTML = dice1;
			diceveiw2.innerHTML = dice2;
			dicesum.value = dice1 + dice2;
			var c = ((p2) % 32).toFixed(0);
			p2 += dicesum.value;

			var b = ((p2) % 32).toFixed(0);
			dicesum.innerHTML = dicesum.value;

			//노랑색으로 바뀌기 전에 흰색으로 초기화
			var bg2 = document.getElementById(c);
			bg2.style.backgroundColor = "#ffffff";
			//주사위가 움직인 만큼 파랑색으로 바뀜 
			var bg = document.getElementById(b);
			city.innerHTML = bg.innerHTML;
			
			bg.style.backgroundColor = "#fff136";
			//한 턴당 시간 셋팅
			setTimeout(() => {
				clearInterval(g);
				player1.disabled = false;
				timer.value=0;
			}, 0);
			
			var t =0;
			
			var g =setInterval(function() {
				t++;
				timer.value=t;
			}, 1000)
		}
	}
</script>
<style type="text/css">
table {
	text-align: center;
	border: 1px solid black;
	text-align: center;
	margin: 100px auto;
}

tr * {
	width: 100px;
	height: 100px;
	border: 1px solid black;
}

div {
	width: 740px;
	height: 760px;
	margin: 0px;
}

#result {
	text-align: center;
	margin: 80px auto;
	width: 440px;
}
</style>
</head>
<body>
	<input type="button" value="주사위 던지기1" id="player1">
	<input type="button" value="주사위 던지기2" id="player2">
	<input type="text" value="0" id="time" readonly="readonly">
	<span id="dice1">0</span>
	<span id="dice2">0</span>
	<span id="dicesum"></span>

	<table>
		<tr>
			<td id="16"><img src="../img/bg_olympic.png"></td>
			<td id="17">프라하</td>
			<td id="18">푸켓</td>
			<td id="19">베를린</td>
			<td id="20">카드</td>
			<td id="21">모스크바</td>
			<td id="22">제네바</td>
			<td id="23">로마</td>
			<td id="24"><img src="../img/bg_travel.png"></td>
		</tr>
		<tr>
			<td id="15">상파울로</td>
			<td rowspan="7" colspan="7">
				<div id=result>
					<span id="city"></span>
					<table>
						<tr>
							<td>종류</td>
							<td>갯수</td>
							<td>가격</td>
						</tr>
						<tr>
							<td>여관</td>
							<td><select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
							</select></td>
							<td>1,000</td>
						</tr>
						<tr>
							<td>모텔</td>
							<td><select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
							</select></td>
							<td>2,000</td>
						</tr>
						<tr>
							<td>호텔</td>
							<td><select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
							</select></td>
							<td>3,000</td>
						</tr>
						<tr>
							<td colspan="3"><button type="button" id="purchase">도시/건물구매</button>
								<button type="reset">구매취소</button></td>
						</tr>
					</table>
				</div>
			</td>
			<td id="25">타히티</td>
		</tr>
		<tr>
			<td id="14">하화이</td>
			<td id="26">아테네</td>
		</tr>
		<tr>
			<td id="13">퀘벡</td>
			<td id="27">런던</td>
		</tr>
		<tr>
			<td id="12">카드</td>
			<td id="28">카드</td>
		</tr>
		<tr>
			<td id="11">시드니</td>
			<td id="29">파리</td>
		</tr>
		<tr>
			<td id="10">도쿄</td>
			<td id="30">뉴욕</td>
		</tr>
		<tr>
			<td id="9">발리</td>
			<td id="31">서울</td>
		</tr>
		<tr>
			<td id="8"><img src="../img/bg_Uninhabited.png"></td>
			<td id="7">카이로</td>
			<td id="6">두바이</td>
			<td id="5">독도</td>
			<td id="4">카드</td>
			<td id="3">베이징</td>
			<td id="2">보너스게임</td>
			<td id="1">방콕</td>
			<td id="0"><img src="../img/bg_start.png">시작</td>
		</tr>
	</table>
	<%
		ArrayList<City> city = new ArrayList<City>();
	for (int i = 0; i < 32; i++) {
		city.add(new City(i + "", "null"));
		if (i == 0) {
			city.get(i).setmaster("시작");
		} else if (i == 2) {
			city.get(i).setmaster("보너스 게임");
		} else if (i == 8) {
			city.get(i).setmaster("무인도");
		} else if (i == 16) {
			city.get(i).setmaster("올림픽");
		} else if (i == 20) {
			city.get(i).setmaster("카드");
		} else if (i == 24) {
			city.get(i).setmaster("세계여행");
		}
		System.out.println("도시 주인 : " + city.get(i).getMaster() + "  도시 아이디 : " + city.get(i).getName() + "  " + "  통행료 : "
		+ city.get(i).getPassagemoney());
	}
	%>
</body>
</html>