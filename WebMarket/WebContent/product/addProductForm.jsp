<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
<h2>상품 정보 입력 폼</h2>
<form method="post" action="../product.do" name="frm">
<table>
	<tr>
		<td>상품 코드</td>
		<td><input type="text" name="code" size="20"></td>
	</tr>
	<tr>
		<td>상품 이름</td>
		<td><input type="text" name="name" size="20"></td>
	</tr>
	<tr>
		<td>상품 가격</td>
		<td><input type="text" name="price" size="20"></td>
	</tr>
	<tr>
		<td>상품 이미지</td>
		<td><input type="text" name="pictureurl" size="20"></td>
	</tr>
	<tr>
		<td>상품 설명</td>
		<td><input type="text" name="description" size="20"></td>
	</tr>
	<tr>
		<td>등록 날짜</td>
		<td><input type="text" name="col_date" size="20"></td>
	</tr>
	<tr>
		<td><input type="submit" value="전송"></td>
		<td><input type="reset" value="취소"></td>
	</tr>		
</table>
</form>
</body>
</html>