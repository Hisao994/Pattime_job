var stu_id;
var merchant_wantedjob_id;

// 选择职位分类
var minJobid = 0;
var maxJobid = 0;
var Jobid;

$(function() {
	$(".message .button").click(function() {
		$("#content .cont_left").css("display", "none");
		$("#content .cont_left").eq($(this).index()).css("display", "block");
	});
});

function tochangeBaseinfo(Merchant_username) {
	$
			.ajax({
				url : "user/toUpdateMerchant_baseinfo.action",
				method : "POST",
				data : "Merchant_username=" + Merchant_username,
				dataType : "JSON",
				success : function(data) {
					var str;
					var baseinfo = data.obj;
					str = "<input  type='hidden' id='merchant_id' name='merchant_id' value='"
							+ baseinfo.merchant_id
							+ "'/>"
							+ "<p>店名:<input name='merchant_name' id='merchant_name' value='"
							+ baseinfo.merchant_name
							+ "'   validateevent='true' class='el-input__inner'/></p><br />";

					str += "<p>店主名：<input name='merchant_hostname' id='merchant_hostname'  value='"
							+ baseinfo.merchant_hostname
							+ "'   validateevent='true' class='el-input__inner'/></p><br />";

					str += "<p>店主身份证：<input name='merchant_idcard' id='merchant_idcard' value='"
							+ baseinfo.merchant_idcard
							+ "'   validateevent='true' class='el-input__inner'></p><br />";

					str += "<p>店主电话：<input name='merchant_telephone' id='merchant_telephone' value='"
							+ baseinfo.merchant_telephone
							+ "'   validateevent='true' class='el-input__inner'/></p><br />";

					str += "<p>店主Email：<input name='merchant_email' id='merchant_email' value='"
							+ baseinfo.merchant_email
							+ "'   validateevent='true' class='el-input__inner/'></p><br />";

					str += "<p>店家营业执照：<input name='merchant_license' id='merchant_license' value='"
							+ baseinfo.merchant_license
							+ "'   validateevent='true' class='el-input__inner'/></p><br />";

					str += "<input type='button' onclick='changabaseinfo()' value='修改'/>";
					$("#baseinfo").html(str);
				}
			});
}

function changabaseinfo() {
	$.ajax({
		url : "user/updateMerchant_baseinfo.action",
		data : $("#baseinfo").serialize(),
		dataType : "JSON",
		method : "POST",
		success : function(data) {
			if (data.code == 1) {
				alert(data.msg);
			} else {
				alert(data.msg);
			}
		}
	});
}

function postJobInfo() {
	document.getElementById("job_id").value = Jobid;
	$.ajax({
		url : "user/addMerchant_wantedJob.action",
		data : $("#parrtimejob").serialize(),
		dataType : "JSON",
		method : "POST",
		success : function(data) {
			if (data.code == 1) {
				alert(data.msg);
			} else {
				alert(data.msg);
			}
		}
	});
}

function showList(id) {
	$
			.ajax({
				url : "user/findWantedJobList.action",
				data : "merchant_id=" + id,
				dataType : "JSON",
				method : "POST",
				success : function(data) {
					var list = data.obj;
					$("#showlist tr").remove();
					var str;
					for (var i = 0; i < list.length; i++) {
						$("#showlist")
								.append(
										"<tr  ><td >"
												+ list[i].title
												+ "</td><td>"
												+ list[i].posttime
												+ "</td><td><input type='button' value='修改' onclick='toshowdetail("
												+ list[i].merchant_wantedjob_id
												+ ")'></td><td><input type='button' value='查看招聘结果' onclick='toshowstudentlist("
												+ list[i].merchant_wantedjob_id
												+ ")'/></td>"
												+ "<td><input type='button' value='下架' onclick='todown("
												+ list[i].merchant_wantedjob_id
												+ ")'</td></tr>");

					}
				}
			});
}

function toshowdetail(id) {
	window.location.href = "detail.jsp?id=" + id;
}
var count = 0;
function toshowstudentlist(id) {
	count = 0;
	merchant_wantedjob_id = id;
	$
			.ajax({
				url : "user/selectStudentList.action",
				data : "merchant_wantedjob_id=" + id,
				method : "POST",
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						$("#showStudent tr").remove();
						var str;
						for (var i = 0; i < data.obj.length; i++) {
							$("#showStudent")
									.append(
											"<tr  ><td > 学生："
													+ data.obj[i].student_baseinfo.stu_name
													+ "</td><td><input type='button' value='邮件通知' onclick='sendEmail("
													+ data.obj[i].student_baseinfo.stu_email
													+ ","
													+ data.obj[i].student_baseinfo.stu_id
													+ " )'</td></tr>");
						}
						$("#showStudent").append(
								"<div id='count'class='signup'>当前已通知0人</div>");
					}
				}
			});
}
function sendEmail(email, id) {
	$.ajax({
		url : "sendEmail.action",
		data : {
			email : email,
			stu_id : id,
			merchant_wantedjob_id : merchant_wantedjob_id
		},
		dataType : "JSON",
		mothod : "POST",
		success : function(data) {
			if (data.code == 1) {
				alert("已通知该同学");
				count = count + 1;
				$("#count").html("当前已通知" + count + "人");
			}
		}
	});
}

function change(para) {
	// var job_id = document.getElementById("job_id");
	// job_id.value = para;
	Jobid = para;
	if (para == 0) {
		Jobid = null;
	}
	var lis = document.querySelectorAll("#choices li");
	if (para < lis.length) {
		for (var i = 0; i < lis.length; i++) {
			lis[i].style.color = "#999";
		}
	}
	if (minJobid != 0 && maxJobid != 0) {
		for (var i = minJobid; i <= maxJobid; i++) {
			document.getElementById("job_id" + i).style.color = "#999";
		}
	}
	openProfession(para);

	document.getElementById("job_id" + para).style.color = "#0C8";

}

function openProfession(para) {

	$
			.ajax({
				url : "profession.action",
				mothod : "GET",
				dataType : "JSON",
				data : "jobid=" + para,
				success : function(data) {
					if (data.code == 1) {
						$("#profession li").remove();
						minJobid = data.obj[0].id;
						maxJobid = data.obj[data.obj.length - 1].id;
						for (var i = 0; i < data.obj.length; i++) {
							$("#profession").append(
									"<li  id=job_id" + data.obj[i].id
											+ " onclick=change("
											+ data.obj[i].id + ")>"
											+ data.obj[i].parameter + "</li>");
						}
					}
					if (para > 0) {
						document.getElementById("choiceprofession").style.display = "block";
					} else {
						document.getElementById("choiceprofession").style.display = "none";
					}
				}
			});
}

function todown(param) {
	$.ajax({
		url : "todown.action",
		method : "POST",
		dataType : "JSON",
		data : "merchant_wantedjob_id=" + param,
		success : function(data) {
			if (data.code == 1) {
				alert(data.msg + "...跳完前一页");
				window.location.href = "merchant.jsp";
			}
		}
	});
}