<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@page import="Bu.City"%>
<%@page import="Bu.Player"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String C[] = {"시작", "방콕", "보너스게임", "베이징", "카드", "독도", "두바이", "카이로", "무인도", "발리", "도쿄", "시드니", "카드", "퀴벡", "하화이", "상파울로",
		"올림픽", "프라하", "푸켓", "베를린", "카드", "모스크바", "제네바", "로마", "세계여행", "타히티", "아테네", "런던", "카드", "파리", "뉴욕", "서울"};
ArrayList<City> city = new ArrayList<City>();
for (int i = 0; i < 32; i++) {
	city.add(new City(C[i], "null"));
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
ArrayList<Player> player = new ArrayList<Player>();
for (int i = 1; i <= 2; i++) {
	player.add(new Player("p" + i));
}
FileOutputStream fout = null;
ObjectOutputStream oout = null;
try {
	fout = new FileOutputStream("city.text");
	oout = new ObjectOutputStream(fout);
	oout.writeObject(city);
	oout.reset();
	System.out.println("Main : 도시저장 완료");

	fout = new FileOutputStream("player.text");
	oout = new ObjectOutputStream(fout);
	oout.writeObject(player);
	oout.reset();
	System.out.println("Main : 플레이어 저장 완료");

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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script type="text/javascript" src="../jQuery/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	p1 = 0;
	p2 = 0;
	who="";
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
		var Passagemoney = document.getElementById("Passagemoney"); 
		
		player2.disabled = true;
		resultCity.style.display="none";
		Uninhabited.style.display="none";
		Start.style.display="none";
		Olympic.style.display="none";
		Travel.style.display="none";
		Passagemoney.style.display="none";
		
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
			who="p1";
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
				dicesum.innerHTML = dicesum.value;//주사위 위치
				
				//파랑색으로 바뀌기 전에 흰색으로 초기화
				var bg2 = document.getElementById(c);
				bg2.style.backgroundColor = "#ffffff";
				//주사위가 움직인 만큼 파랑색으로 바뀜 
				var bg = document.getElementById(b);
				bg.style.backgroundColor = "#0000ff";
				city.innerHTML = bg.innerHTML;
				
				//결과창에 서브 창 띄우기
				if(b==0){//시작
					Start.style.display="block";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
				}else if (b==2){//보너스 게임
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
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
				}else if (b==4||b==12||b==20||b==28){//카드
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
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

				//한 턴 당 시간 셋팅 및 초기화
				setTimeout(() => {
					clearInterval(g);
					player2.disabled = false;
					timer.value=0;
					/*resultCity.style.display="none";
					Uninhabited.style.display="none";
					Start.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					Passagemoney.style.display="none";*/
				}, 0);
				
				var t =0;
				
				var g =setInterval(function() {
					t++;
					timer.value=t;
				}, 1000)
			
			});//p1
/*--------------------------------------------------------------------------------------*/
			$("#player2").click(function() {
				who="p2";
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

				b = ((p2) % 32).toFixed(0);
				console.log("p2 : "+b);
				dicesum.innerHTML = dicesum.value;

				//노랑색으로 바뀌기 전에 흰색으로 초기화
				var bg2 = document.getElementById(c);
				bg2.style.backgroundColor = "#ffffff";
				//주사위가 움직인 만큼 노랑색으로 바뀜 
				var bg = document.getElementById(b);
				bg.style.backgroundColor = "#fff136";
				city.innerHTML = bg.innerHTML;
				
				//결과창에 서브 창 띄우기
				if(b==0){//시작
					Start.style.display="block";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
				}else if (b==2){//보너스 게임
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
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
				}else if (b==4||b==12||b==20||b==28){//카드
					Start.style.display="none";
					Uninhabited.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					resultCity.style.display="none";
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
				
				//한 턴당 시간 셋팅 및 초기화
				setTimeout(() => {
					clearInterval(g);
					player1.disabled = false;
					timer.value=0;
					/*resultCity.style.display="none";
					Uninhabited.style.display="none";
					Start.style.display="none";
					Olympic.style.display="none";
					Travel.style.display="none";
					Passagemoney.style.display="none";*/
				}, 0);
				
				var t =0;
				
				var g =setInterval(function() {
					t++;
					timer.value=t;
				}, 1000)
				
			});//p2
/*---------------------------------------------------------------------------------------*/
			$("#purchase").click(function() {
			// 건물 구매창 초기화 작업
		 	resultCity.style.display="none";
			Uninhabited.style.display="none";
			Start.style.display="none";
			Olympic.style.display="none";
			Travel.style.display="none";
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
				var params = "b="+b+"&inn="+$("select[name=inn]").val()+"&motel="+$("select[name=motel]").val()+"&hotel="+$("select[name=hotel]").val()+"&who="+who+"&city="+$("input[name=city]").val();
			}
			//$("#resultCity  input[type=number]").val("");
			$("#Start  input").val(0);
			$.ajax({
				type : "POST", // 전송방식
				url : "Control.jsp", // 주소
				data : params, // 서버로 가는 데이터 
				dataType : "xml", //받을 때 데이터 타입 
				success : function(args) {//  성공 했을 때 args로 받음(바깥으로부터 들어옴)
					//내가 구입한 정보 확인창 
					var str="";
					var pl1="";
					var pl2="";
					var error="";
					var pass="";
				$(args).find("record").each(function() {// record 다 찾아
					var subject = $(this).find("subject").text();
					var content1 = $(this).find("content1").text();
					var content2 = $(this).find("content2").text();
					var content3 = $(this).find("content3").text();
					var content4 = $(this).find("content4").text();
							     str+= subject+"<br>"+content3;
							     pl1+= content1;
							     pl2+= content2;
							     pass+=content4;
				 });
				
					$("#chatting").html(str);
					$("#pl1").html(pl1);
					$("#pl2").html(pl2);
					$("#passagemoney").html(pass);
				},
				beforeSend : showRequest,
				error : function(e) {
					alert("Main : "+e.responseText);
					//$("#chatting").html(e.responseText);
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
			//도시 및 건물 구매후 초기화
			$("input:checkbox[name='city']").prop("checked", false);
			$("option:selected").prop("selected", false)
				});//purchase 끝
	});//제이쿼리 끝
	}// onload 끝
</script>
<style type="text/css">
table {
	text-align: center;
	border: 1px solid black;
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
			<td id=pl1><%=player.get(0).toString()%></td>
			<td><button type="button" class="btn btn-secondary" id="player1">주사위던지기1</button>
				<button type="button" class="btn btn-secondary" id="player2">주사위던지기2</button>
				<input type="text" value="0" id="time" readonly="readonly">
				<span id="dice1">0</span> <span id="dice2">0</span> <span
				id="dicesum"></span></td>
			<td id=pl2><%=player.get(1).toString()%></td>
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
										<td>도시 구매</td>
										<td><input type="checkbox" name=city /></td>
										<td>5,000</td>
									</tr>
									<tr>
										<td>여관</td>
										<td><select name='inn' class="form-control"
											id="exampleSelect1">
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
										</select></td>
										<td>1,000</td>
									</tr>
									<tr>
										<td>모텔</td>
										<td><select name='motel' class="form-control"
											id="exampleSelect1">
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
										</select></td>
										<td>2,000</td>
									</tr>
									<tr>
										<td>호텔</td>
										<td><select name='hotel' class="form-control"
											id="exampleSelect1">
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
										</select></td>
										<td>3,000</td>
									</tr>
									<tr>
										<td colspan="3"><button type="button" id="purchase"
												class="btn btn-secondary">도시/건물구매</button>
											<button type="button" name="cancel" class="btn btn-secondary">구매취소</button></td>
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
										<td>도시 구매</td>
										<td><input type="checkbox" name=city /></td>
										<td>5,000</td>
									</tr>
									<tr>
										<td>여관</td>
										<td><select name='inn' class="form-control"
											id="exampleSelect1">
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
										</select></td>
										<td>1,000</td>
									</tr>
									<tr>
										<td>모텔</td>
										<td><select name='motel' class="form-control"
											id="exampleSelect1">
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
										</select></td>
										<td>2,000</td>
									</tr>
									<tr>
										<td>호텔</td>
										<td><select name='hotel' class="form-control"
											id="exampleSelect1">
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
										</select></td>
										<td>3,000</td>
									</tr>
									<tr>
										<td colspan="3"><button type="button" id="purchase"
												class="btn btn-secondary">도시/건물구매</button>
											<button type="button" name="cancel" class="btn btn-secondary">구매취소</button></td>
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
								<button type="button" class="btn btn-secondary">여행가기</button>
								<button type="button" name="cancel" class="btn btn-secondary">여행
									안 감</button>
							</div>
							<div id="Passagemoney">
								<table>
									<tr>
										<td colspan="3">통행료 :
											<div id="passagemoney"></div>
										</td>
									</tr>
									<tr>
										<td><input type="button" value="지급"></td>
										<td><input type="button" value="매각"></td>
										<td><input type="button" value="파산"></td>
									</tr>
								</table>
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
			<td></td>
		</tr>
		<tr>
			<td>유저3</td>
			<td id=chatting>채팅 및 게임 메시지 출력</td>
			<td>유저4</td>
		</tr>
	</table>
</body>
</html>