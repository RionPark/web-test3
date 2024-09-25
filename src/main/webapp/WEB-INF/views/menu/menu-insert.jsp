<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메뉴등록</h3>
<input type="text" id="miName"><br>
<input type="text" id="miPrice"><br>
<input type="text" id="miDesc"><br>
<input type="file" id="miFile"><br>
<button onclick="addMenu()">등록</button>
<script>
function addMenu(){
	const xhr = new XMLHttpRequest();
	const formData = new FormData();
	formData.append('miName',document.querySelector("#miName").value);
	formData.append('miPrice',document.querySelector("#miPrice").value);
	formData.append('miDesc',document.querySelector("#miDesc").value);
	const miFile = document.querySelector('#miFile');
	console.log(miFile.files);
	formData.append('miFile',miFile.files[0]);
	xhr.open('POST','/menus');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				alert(xhr.responseText);
			}
		}
	}
	xhr.send(formData);
}
</script>
</body>
</html>