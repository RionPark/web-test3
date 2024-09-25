<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="miNum">
<input type="text" id="miName"><br>
<input type="text" id="miPrice"><br>
<input type="text" id="miDesc"><br>
<input type="file" id="miFile" onchange="changeImg(this)"><br>
<img src="/upload/no-image.jpg" id="miPath" width="200"><br> 
<button onclick="modifyMenu()">수정</button>
<button onclick="removeMenu()">삭제</button>
<script>
const miNum = '${param.miNum}';

function removeMenu(){
	const xhr = new XMLHttpRequest();
	xhr.open('DELETE', '/menus/' + miNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				alert(xhr.responseText);
			}
		}
	}
	xhr.send();
}
function modifyMenu(){
	const xhr = new XMLHttpRequest();

	const formData = new FormData();
	formData.append('miName',document.querySelector("#miName").value);
	formData.append('miPrice',document.querySelector("#miPrice").value);
	formData.append('miDesc',document.querySelector("#miDesc").value);
	const miFile = document.querySelector('#miFile');
	if(miFile.files[0]){
		formData.append('miFile',miFile.files[0]);
	}
	formData.append('miNum',document.querySelector('#miNum').value);
	
	xhr.open('PUT', '/menus');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				alert(xhr.responseText);
			}
		}
	}
	xhr.send(formData);
}
function changeImg(obj){
	const file = obj.files[0];
	const fileReader = new FileReader();
	fileReader.onload = function(){
		document.querySelector('#miPath').src = this.result;
	}
	fileReader.readAsDataURL(file);
}
function getMenu(){
	const xhr = new XMLHttpRequest();
	xhr.open('GET','/menus/' + miNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				const menu = JSON.parse(xhr.responseText);
				console.log(menu);
				for(const key in menu){
					if(menu[key]){
						const el = document.querySelector('#' + key);
						console.log(el.tagName);
						if(el.tagName==='INPUT'){
							el.value = menu[key];
						}else if(el.tagName==='IMG'){
							el.src = menu[key];
						}
					}
				}
			}
		}
	}
	xhr.send();
}
window.onload = getMenu;
</script>
</body>
</html>