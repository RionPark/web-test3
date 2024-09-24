<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="total"></div>
<table border="1">
	<tr>
		<th data-col='uiNum'>번호</th>
		<th data-col='uiName'>이름</th>
		<th data-col='uiId'>아이디</th>
	</tr>
	<tbody id="tBody"></tbody>
	<tr>
		<th colspan="3" id="pagination"></th>
	</tr>
</table>

<script>

function getUsers(page){
	const xhr = new XMLHttpRequest();
	xhr.open('GET','/users?page=' + page);
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
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
				document.querySelector('#total').innerText = '총갯수 : ' + result.count;
				html ='';
				var sNum = (Math.ceil(page/10)-1) * 10 + 1; // 101
				var lNum = sNum + 9;  //110 101
				var total = Math.ceil(result.count/10);
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