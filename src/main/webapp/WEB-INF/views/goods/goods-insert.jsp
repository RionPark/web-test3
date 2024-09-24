<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품등록</h3>
<input type="text" id="giName" placeholder="상품명"><br>
<input type="text" id="giPrice" placeholder="상품가격"><br>
<input type="text" id="giDesc" placeholder="상품설명"><br>
<button onclick="insertGoods()">등록</button>
<script>
function insertGoods(){
	var param = {};
	param.giName = document.querySelector('#giName').value;
	param.giPrice = document.querySelector('#giPrice').value;
	param.giDesc = document.querySelector('#giDesc').value;
	
	param = JSON.stringify(param);
	console.log(param);
	const xhr = new XMLHttpRequest();
	xhr.open('POST','/goods');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				if(xhr.responseText == 1){
					alert('상품등록 완료');
					location.href = '/views/goods/goods-list';
				}
			}
		}
	}
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.send(param);
}
</script>
</body>
</html>