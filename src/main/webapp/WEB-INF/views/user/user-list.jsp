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
<div class="container">
	<input type="text" id="uiName" placeholder="이름">
	<input type="text" id="uiId" placeholder="아이디">
	<button onclick="getUsers(1)">검색</button>
	<div id="total"></div>
	<select id="count" onchange="getUsers(1)">
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="50">50</option>
		<option value="100">100</option>
	</select>
	<table border="1" class="table table-striped table-hover">
		<tr>
			<th data-col='uiNum' scope="col">번호</th>
			<th data-col='uiName' scope="col">이름</th>
			<th data-col='uiId' scope="col">아이디</th>
			<th data-col='uiId' scope="col">성별</th>
			<th data-col='uiId' scope="col">생일</th>
			<th data-col='uiId' scope="col">가입일</th>
		</tr>
		<tbody id="tBody"></tbody>
		<tr>
			<th colspan="6" id="pagination"  scope="col" class="text-center"></th>
		</tr>
	</table>
</div>
<script>

function format(str, f){
	if(!f){
		f = '$1-$2-$3'
	}
	return str.replace(/(\d{4})(\d{2})(\d{2})/g,f);
}
function getUsers(page){
	var count = document.querySelector('#count').value;
	const xhr = new XMLHttpRequest();
	var url = '/users?page=' + page + '&uiName=' + document.querySelector('#uiName').value;
	url += '&uiId=' + document.querySelector('#uiId').value;
	url += '&count=' + count;
	
	xhr.open('GET',url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				const result = JSON.parse(xhr.responseText);
				const users = result.list;
				var html ='';
				for(const user of users){
					html += '<tr>';
					html += '<td>' + user.uiNum + '</td>';
					html += '<td><a href="/views/user/user-view?uiNum=' + user.uiNum + '">' + user.uiName + '</a></td>';
					html += '<td>' + user.uiId + '</td>';
					html += '<td>' + (user.uiGender==1?'남':'여') + '</td>';
					html += '<td>' + format(user.uiBirth) + '</td>';
					html += '<td>' + format(user.credat)  + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
				document.querySelector('#total').innerText = '총갯수 : ' + result.count;
				html ='';
				var sNum = (Math.ceil(page/10)-1) * 10 + 1; // 101
				var lNum = sNum + 9;  //110 101
				var total = Math.ceil(result.count/count);
				if(lNum>total){
					lNum = total;
				}
				if(sNum != 1){
					html += '<a href="javascript:getUsers(' + (sNum-1) + ')">◀</a>'
				}
				for(var i = sNum ; i <= lNum ; i++){
					if(i===page){
						html += ' [' + i + ']';
					}else{
						html += ' <a href="javascript:getUsers(' + i + ')">[' + i + ']</a> ';
					}
				}
				if(lNum != total){
					html += '<a href="javascript:getUsers(' + (lNum+1) + ')">▶</a>'
				}
				document.querySelector('#pagination').innerHTML = html;
			}
		}
	}
	xhr.send();
}
window.onload = getUsers.bind(null,1);
</script>
</body>
</html>