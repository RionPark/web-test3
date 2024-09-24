/**
 * 
 */
function ajax(config){
	const xhr = new XMLHttpRequest();
	xhr.open(config.method,config.url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				config.callback(xhr.responseText);
			}
		}
	}
	xhr.send();
}