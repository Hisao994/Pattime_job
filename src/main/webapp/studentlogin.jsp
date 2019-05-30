<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/loginstyle1.css" />

<%@ include file="header1.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#el-form").validate({
			rules : {
				Stu_name : {
					required : true,
					phone : true
				},
				Stu_password : {
					required : true,
				}
			},
			messages : {
				Stu_name : {
					required : "手机不能为空",
				},
				Stu_password : {
					required : "密码不能为空",
				}
			}
		});
	})

	function doit() {

		var name = document.getElementById("Stu_name").value;
		var password = document.getElementById("Stu_password").value;
		/* 		var power = document.getElementById("power").value;
		 */
		if (name == null || name == "") {
			alert("手机号不能为空");
			return;
		}
		if (password == null || password == "") {
			alert("密码不能为空");
			return;
		}

		$.ajax({
			url : "Student_login.action",
			method : "POST",
			dataType : "JSON",
			data : $("#el-form").serialize(),
			success : function(data) {
				if (data.code == 1) {
					alert("登录成功,准备跳往首页");
					window.location.href = "index.jsp";
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
</script>



<div id="d2" style="height: 400.5px; display: block;">
	<img src="img/3.png" class="i1" style="width: 55px; height: 55px;" />

	<form class="el-form" id="el-form">
		<input autocomplete="off" placeholder="手机号" type="text" id="Stu_name" name="Stu_name" rows="2" maxlength="11" validateevent="true"
			class="el-input__inner"
		>
		<input autocomplete="off" placeholder="密码" type="password" id="Stu_password" name="Stu_password" rows="2" validateevent="true"
			class="el-input__inner"
		>
		<input type="button" onclick="doit()" name="submit" id="sub" class="el-button next-btn el-button--primary" value="学生登录" />
	</form>
	<span style="margin-top: 10px;" onClick="location='studentreg.jsp'" class="txt">立即注册学生账号</span>
	<br />
	<a style="margin-top: 10px;" href="login.jsp" class="txt">我是商家</a>
</div>
</div>
<div style="height: 200px;"></div>



<script>
	var d2 = document.getElementById("d2");
	var d3 = document.getElementById("d3");
	var d4 = document.getElementById("d4");
	function zc() {
		d2.style.display = "none";
		d3.style.display = "block";
	}
	function dl() {
		d3.style.display = "none";
		d2.style.display = "block";
	}
</script>

