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
<script type="text/javascript" src="../jQuery/jquery-3.5.1.min.js"></script>
<script type="text/javascript"> //객체 아이디 넘기기용
	$(function() {
		$("#player1").click(
				function() {
					var params = "dicesum=" + $("#dicesum").val();// 서버로 데이터를 넘김
					console.log(params);//subject=val() &content=val()
					$.ajax({
						type : "POST", // 전송방식
						url : "Control.jsp", // 주소
						data : params, // 서버로 가는 데이터 
						dataType : "xml", //받을 때 데이터 타입 
						success : function(args) {//  성공 했을 때 이 xml형태의 이터를 args로 받음(바깥으로부터 들어옴)
							var str = "";//데이터를 다시 받는 작업
							$(args).find("p").each(
									function() {// record 다 찾아
										var dicesum = $(this).find("#dicesum").text();
										str += "dicesum=" + dicesum;
									});
							console.log(str);
							//반복으로 만들어 낸 데이터를 html로 바꿔서 str으로 출력해
							$("#result").html(str);// 받은 데이터를 표시
							//javascript 방식에서 innerHTML이랑 같은 방식
						},
						//beforeSend : showRequest,
						//보내기 전에 showRequest가서 검사
						// true값을 받아야만, 위 ajax부분을 통해 서버로 데이터를 보냄
						error : function(e) {
							//에러메시지 출력
							alert(e.responseText);
						}
					});
				});
	});
	/*function showRequest() {
		var flag = true; //일단 true
		if (!$("#subject").val()) { //jQuery에서 가져오는 값이 없으면
			alert("제목 입력해");
			$("#subject").focus();
			return false;
		}
		if (!$("#content").val()) {
			alert("내용을 입력하세요!");
			$("#content").focus();
			return false;
		}
		return flag;
	}*/
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
			<td id="16"><img src="../img/bg_olympic.png">올림픽</td>
			<td id="17">프라하</td>
			<td id="18">푸켓</td>
			<td id="19">베를린</td>
			<td id="20">카드</td>
			<td id="21">모스크바</td>
			<td id="22">제네바</td>
			<td id="23">로마</td>
			<td id="24"><img src="../img/bg_travel.png">세계여행</td>
		</tr>
		<tr>
			<td id="15">상파울로</td>
			<td rowspan="7" colspan="7">
				<div id=result>
					<span id="city"></span>

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
			<td id="8"><img src="../img/bg_Uninhabited.png">무인도</td>
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
</body>
</html>