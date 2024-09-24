<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/ajax.js"></script>
</head>
<body>
<div id="rDiv"></div>
<script>
const config = {
		method : 'GET',
		url : '/cars',
		callback : function(res){
			document.querySelector('#rDiv').innerHTML = res;
		}
}
ajax(config);
</script>
</body>
</html>