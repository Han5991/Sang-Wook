<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bu.City"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	text-align: center;
	border: 1px solid black;
	text-align: center;
	margin: 107px auto;
}

tr * {
	width: 100px;
	height: 100px;
	border: 1px solid black;
}

iframe {
	width: 740px;
	height: 760px;
}
</style>
</head>
<body>
	<form action="#" method="post">
		<table>
			<tr>
				<td>종류</td>
				<td>갯수</td>
				<td>가격</td>
			</tr>
			<tr>
				<td>하숙</td>
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
				<td colspan="3"><input type="submit" value="구입하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>