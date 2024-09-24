<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품 리스트</h3>
<table border="1">
	<tr>
		<th>번호</th>
		<th>상품명</th>
		<th>가격</th>
		<th>등록일</th>
	</tr>
	<tbody id="tBody"></tbody>
</table>
<a href="/views/goods/goods-insert">상품등록</a>
<script>
	window.onload = function(){
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/goods');
		xhr.onreadystatechange = function(){
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					console.log(xhr.responseText);
					const goodsList = JSON.parse(xhr.responseText);
					var html = '';
					for(const goods of goodsList){
						html += '<tr>';
						html += '<td>' + goods.giNum + '</td>';
						html += '<td><a href="/views/goods/goods-view?giNum=' + goods.giNum + '">' + goods.giName + '</a></td>';
						html += '<td>' + goods.giPrice + '</td>';
						html += '<td>' + goods.credat + '</td>';
						html += '</tr>';
					}
					document.querySelector('#tBody').innerHTML = html;
				}
			}
		}
		xhr.send();
	}
</script>
</body>
</html>