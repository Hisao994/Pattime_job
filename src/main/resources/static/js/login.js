var d2 = document.getElementById("d2");
var d3 = document.getElementById("d3");
var d4 = document.getElementById("d4");

function zc() {
	d2.style.display = "none";
	d3.style.display = "block";
	d4.style.display = "none";
}
function dl() {
	d4.style.display = "none";
	d3.style.display = "none";
	d2.style.display = "block";
}

function wjmm(){
	d4.style.display = "block";
	d3.style.display = "none";
	d2.style.display = "none";
}

function changeVilidateCode(obj) {
	var timenow = new Date().getTime();
	obj.src = "image.jsp?d=" + timenow;
}

function doit() {
	$.ajax({
		url : "Merchant_baseinfoLogin.action",
		data : $("#loginForm").serialize(),
		dataType : "JSON",
		method : "POST",
		success : function(data) {
			if (data.code == 1) {
				alert("登陆成功");
				window.location.href = "index.jsp?list=1";
			} else if (data.code == 2) {
				alert(data.msg + "，准备跳往首页...");
				window.location.href = "index.jsp?list=1";
			} else {
				alert("登陆失败:" + data.msg);
				return;
			}
		}
	});
}

function update(){
	$.ajax({
		url : "Merchant_baseUpdate.action",
		data : $("#loginForm").serialize(),
		dataType : "JSON",
		method : "POST",
		success : function(data) {
			if (data.code == 1) {
				alert("修改成功");
				window.location.href = "login.jsp";
			}  else {
				alert("修改失败:" + data.msg);
				return;
			}
		}
	});
}