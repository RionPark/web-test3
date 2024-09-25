<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>메뉴명</th>
		<th>가격</th>
		<th>이미지</th>
	</tr>
	<tbody id="tBody"></tbody>
</table>
<script>
	function getMenus(){
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/menus');
		xhr.onreadystatechange = function(){
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					const menus = JSON.parse(xhr.responseText);
					var html = '';
					for(const menu of menus){
						html += '<tr>';
						html += '<td>' + menu.miNum + '</td>';
						html += '<td>' + menu.miName + '</td>';
						html += '<td>' + menu.miPrice + '원</td>';
						if(menu.miPath){
							html += '<td><img src="' + menu.miPath + '" width="200" height="100"></td>';
						}else{
							html += '<td><img src="/upload/no-image.jpg" width="200" height="100"></td>';
						}
						html += '</tr>';
					}
					document.querySelector('#tBody').innerHTML = html;
				}
			}
		}
		xhr.send();
	}
	window.onload = getMenus;
</script>
</body>
</html>