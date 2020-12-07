<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@page import="Bu.City"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	} else if ((i == 4) || (i == 12) || (i == 20) || (i == 28)) {
		city.get(i).setmaster("카드");
	} else if (i == 24) {
		city.get(i).setmaster("세계여행");
	}
}
FileOutputStream fout = null;
ObjectOutputStream oout = null;
try {
	fout = new FileOutputStream("City.text");
	oout = new ObjectOutputStream(fout);
	oout.writeObject(city);
	oout.reset();
	System.out.println("도시저장 완료");
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
<script type="text/javascript" src="../jQuery/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	p1 = 0;
	p2 = 0;
	window.onload = function() {
		var player1 = document.getElementById("player1");
		var player2 = document.getElementById("player2");
		var diceveiw1 = document.getElementById("dice1");
		var diceveiw2 = document.getElementById("dice2");
		var dicesum = document.getElementById("dicesum");
		
		var timer = document.getElementById("time");
		var cancel = document.getElementsByName("cancel");
		
		var resultCity = document.getElementById("resultCity");
		var Uninhabited = document.getElementById("Uninhabited");
		var Start = document.getElementById("Start");
		var Olympic = document.getElementById("Olympic");
		var Travel = document.getElementById("Travel");
		
		player2.disabled = true;
		resultCity.style.display="none";
		Uninhabited.style.display="none";
		Start.style.display="none";
		Olympic.style.display="none";
		Travel.style.display="none";
		
		for(var i = 0;i<cancel.length;i++){
		 	cancel[i].onclick= function() {
		 		resultCity.style.display="none";
				Uninhabited.style.display="none";
				Start.style.display="none";
				Olympic.style.display="none";
				Travel.style.display="none";
			}			
		}
		$(function() {

			$("#player1").click(function() {
			
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

				b = ((p1) % 32).toFixed(0);
				dicesum.innerHTML = dicesum.value;
				
				//파랑색으로 바뀌기 전에 흰색으로 초기화
				var bg2 = document.getElementById(c);
				bg2.style.backgroundColor = "#ffffff";
				//주사위가 움직인 만큼 파랑색으로 바뀜 
				var bg = document.getElementById(b);
				city.innerHTML = bg.innerHTML;
				bg.style.backgroundColor = "#0000ff";
				
				//결과창에 서브 창 띄우기				
				if(b==0){//시작
					Start.style.display="block";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
				}else if (b==2){//보너스 게임
					
				}else if (b==8){//무인도
					Start.style.display="none";
					Uninhabited.style.display="block";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
				}else if (b==16){//올림픽
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="block";
					Travel.style.display="none";
					resultCity.style.display="none";
				}else if (b==20){
					
				}else if (b==24){//세계여행
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="block";
					resultCity.style.display="none";
				}else{//도시
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="block";
				}

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
				var params = "b="+b;// 서버로 데이터를 넘김
		
/*--------------------------------------------------------------------------------------*/
 
			$("#player2").click(function() {
				
				//순서대로 번호를 누르기 위한 작업
				player2.disabled = true;
				
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

				//결과창에 서브 창 띄우기				
				if(b==0){//시작
					Start.style.display="block";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
				}else if (b==2){//보너스 게임
					
				}else if (b==8){//무인도
					Start.style.display="none";
					Uninhabited.style.display="block";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
				}else if (b==16){//올림픽
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="block";
					Travel.style.display="none";
					resultCity.style.display="none";
				}else if (b==20){
					
				}else if (b==24){//세계여행
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="block";
					resultCity.style.display="none";
				}else{//도시
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="block";
				}
				
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
				
			});
				
/*---------------------------------------------------------------------------------------*/
 	
			$("#purchase").click(function() {
			// 건물 구매창 초기화 작업
		 	resultCity.style.display="none";
			Uninhabited.style.display="none";
			Start.style.display="none";
			Olympic.style.display="none";
			Travel.style.display="none";
			$("#resultCity  input").val(0);
			$("#Start  input").val(0);
			//통신을 위한 작업  b= 현재위치
			if (b == 0) {
				var params = "b="+b;//"시작"
			} else if (b == 2) {
				var params = "b="+b;//"보너스 게임"
			} else if (b == 8) {
				var params = "b="+b;// "무인도"
			} else if (b == 16) {
				var params = "b="+b;// "올림픽"
			} else if ((b == 4) || (b == 12) || (b == 20) || (b == 28)) {
				var params = "b="+b;// "카드"
			} else if (b == 24) {
				var params = "b="+b;// "세계여행"
			} else{
				var params = "b="+b
			}
			//"&resultCity="+ $("#resultCity option:selected").val();
			$.ajax({
				type : "POST", // 전송방식
				url : "Control.jsp", // 주소
				data : params, // 서버로 가는 데이터 
				dataType : "text", //받을 때 데이터 타입 
				success : function(args) {//  성공 했을 때 args로 받음(바깥으로부터 들어옴)
					//내가 구입한 정보 확인창 
					$("#chatting").html(args);
				},
				beforeSend : showRequest,
				error : function(e) {
					alert("Main : "+e.responseText);
				}
			});
			function showRequest() {
				var flag = true; //일단 true
				if (!$("#dicesum").val()) { //jQuery에서 가져오는 값이 없으면
					alert("주사위를 굴려주세요");
					return false;
				}
				return flag;
			}
				});
			});
		});
	}
</script>
<style type="text/css">
table {
	text-align: center;
	border: 1px solid black;
	text-align: center;
	margin: 0px auto;
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
	<table>
		<tr>
			<td>유저 1</td>
			<td><input type="button" value="주사위 던지기1" id="player1">
				<input type="button" value="주사위 던지기2" id="player2"> <input
				type="text" value="0" id="time" readonly="readonly"> <span
				id="dice1">0</span> <span id="dice2">0</span> <span id="dicesum"></span></td>
			<td>유저 2</td>
		</tr>
		<tr>
			<td>빈 공 간</td>
			<td><table>
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
						<td rowspan="7" colspan="7"><span id="city"></span>
							<div id=resultCity>
								<table>
									<tr>
										<td>종류</td>
										<td>갯수</td>
										<td>가격</td>
									</tr>
									<tr>
										<td>여관</td>
										<td><input type="number" min="0" max="3"/></td>
										<td>1,000</td>
									</tr>
									<tr>
										<td>모텔</td>
										<td><input type="number" min="0" max="3"/></td>
										<td>2,000</td>
									</tr>
									<tr>
										<td>호텔</td>
									<td><input type="number" min="0" max="3"/></td>
										<td>3,000</td>
									</tr>
									<tr>
										<td colspan="3"><button type="button" id="purchase">도시/건물구매</button>
											<button type="button" name="cancel">구매취소</button></td>
									</tr>
								</table>
							</div>
							<div id="Uninhabited">
								<img src="../img/bg_Uninhabited.png">
							</div>
							<div id="Start">
								<table>
									<tr>
										<td>종류</td>
										<td>갯수</td>
										<td>가격</td>
									</tr>
									<tr>
										<td>여관</td>
									<td><input type="number" min="0" max="3"/></td>
										<td>1,000</td>
									</tr>
									<tr>
										<td>모텔</td>
										<td><input type="number" min="0" max="3"/></td>
										<td>2,000</td>
									</tr>
									<tr>
										<td>호텔</td>
									<td><input type="number" min="0" max="3"/></td>
										<td>3,000</td>
									</tr>
									<tr>
										<td colspan="3"><button type="button" id="purchase">도시/건물구매</button>
											<button type="button" name="cancel">구매취소</button></td>
									</tr>
								</table>
							</div>
							<div id="Olympic">
								<select>
									<option>방콕</option>
									<option value=3>베이징</option>
									<option value=5>독도</option>
									<option value=6>두바이</option>
									<option value=7>카이로</option>
									<option value=9>발리</option>
									<option value=10>도쿄</option>
									<option value=11>시드니</option>
									<option value=13>퀘백</option>
									<option value=14>하와이</option>
									<option value=15>상파울로</option>
									<option value=17>프라하</option>
									<option value=18>푸켓</option>
									<option value=19>베를린</option>
									<option value=21>모스크바</option>
									<option value=22>제네바</option>
									<option value=23>로마</option>
									<option value=24>세계여행</option>
									<option value=25>타히티</option>
									<option value=26>아테네</option>
									<option value=27>런던</option>
									<option value=28>카드</option>
									<option value=29>파리</option>
									<option value=30>뉴욕</option>
									<option value=31>서울</option>
								</select>
								<button type="button">올림픽개최</button>
							</div>
							<div id="Travel">
								<select>
									<option value=0>시작</option>
									<option value=1>방콕</option>
									<option value=2>보너스 게임</option>
									<option value=3>베이징</option>
									<option value=4>카드</option>
									<option value=5>독도</option>
									<option value=6>두바이</option>
									<option value=7>카이로</option>
									<option value=8>무인도</option>
									<option value=9>발리</option>
									<option value=10>도쿄</option>
									<option value=11>시드니</option>
									<option value=12>카드</option>
									<option value=13>퀘백</option>
									<option value=14>하와이</option>
									<option value=15>상파울로</option>
									<option value=16>올림픽</option>
									<option value=17>프라하</option>
									<option value=18>푸켓</option>
									<option value=19>베를린</option>
									<option value=20>카드</option>
									<option value=21>모스크바</option>
									<option value=22>제네바</option>
									<option value=23>로마</option>
									<option value=25>타히티</option>
									<option value=26>아테네</option>
									<option value=27>런던</option>
									<option value=28>카드</option>
									<option value=29>파리</option>
									<option value=30>뉴욕</option>
									<option value=31>서울</option>
								</select>
								<button type="button">여행가기</button>
								<button type="button" name="cancel">여행 안 감</button>
							</div></td>
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
				</table></td>
			<td>빈 공 간</td>
		</tr>
		<tr>
			<td>유저3</td>
			<td id=chatting>채팅 및 게임 메시지 출력</td>
			<td>유저4</td>
		</tr>
	</table>
</body>
</html>