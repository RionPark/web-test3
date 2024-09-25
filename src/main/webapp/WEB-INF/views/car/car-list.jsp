<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/boot/css/bootstrap.css"/>
<link rel="stylesheet" href="/boot/css/bootstrap-grid.css"/>
<link rel="stylesheet" href="/boot/css/bootstrap-reboot.css"/>
<link rel="stylesheet" href="/boot/css/bootstrap-utilities.css"/>
<script src="/boot/js/bootstrap.bundle.js"></script>
<script src="/boot/js/bootstrap.js"></script>
</head>
<body>
<input type="text" id="ciNum"  placeholder="번호">
<input type="text" id="ciName" placeholder="모델명">
<input type="text" id="ciYear" placeholder="연식">
<button onclick="getCars()">검색</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>모델명</th>
		<th>연식</th>
	</tr>
	<tbody id="tBody"></tbody>
</table>
<a href="/views/car/car-insert">차량등록</a>
<script>

function getCars(page){
	var xhr = new XMLHttpRequest();
	var url = '/cars?';
	url += 'ciNum=' + document.querySelector('#ciNum').value;
	url += '&ciName=' + document.querySelector('#ciName').value;
	url += '&ciYear=' + document.querySelector('#ciYear').value;
	url += '&page=' + page;

	xhr.open('GET',url);
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState===4){
			if(xhr.status===200){
				const cars = JSON.parse(xhr.responseText);
				var html = '';
				for(const car of cars){
					html += '<tr>';
					html += '<td>' + car.ciNum + '</td>';
					html += '<td data-num="' + car.ciNum + '">' + car.ciName + '</td>';
					html += '<td>' + car.ciYear + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
				const tds = document.querySelectorAll('td[data-num]');
				for(const td of tds){
					td.onclick = function(){
						const ciNum = td.getAttribute('data-num');
						location.href = '/views/car/car-view?ciNum=' + ciNum;
					}
				}
			}
		}
	}
	xhr.send();
}
window.onload = getCars.bind(null,1);

</script>
</body>
</html>