//选择职位分类
var minJobid = 0;
var maxJobid = 0;
var Jobid;
//选择页面
$(function() {
	$(".message .button").click(function() {
		$("#content .cont_left").css("display", "none");
		$("#content .cont_left").eq($(this).index()).css("display", "block");
	});
});

//学生意向提交
function studentjob() {
	document.getElementById("job_id").value = Jobid;
	$.ajax({
		url : "Studentjob.action",
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

//职位选择
function change(para) {
//	var job_id = document.getElementById("job_id");
//	job_id.value = para;
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



function showList(id) {
	$
			.ajax({
				url : "findApplyJob.action",
				dataType : "JSON",
				method : "POST",
				success : function(data) {
					if(data.code == 1){
						var list = data.obj;
						$("#showList tr").remove();
						var str;
						$("#showList")
						.append("<tr><td>主题</td><td>工作内容</td><td>薪资</td>" +
								"	<td>工作地点</td><td>申请时间</td><td>状态</td></tr>");
						for (var i = 0; i < list.length; i++) {
							if(list[i].status==0){
								str="<tr><td>"+list[i].merchant_wantedjob.title+"</td>" +
								"<td>"+list[i].merchant_wantedjob.workcontent +"</td>" +
								"<td>"+list[i].merchant_wantedjob.salary +"/"+ list[i].merchant_wantedjob.workcleanform+"</td>" +
								"<td>"+list[i].merchant_wantedjob.workplace.substring(7)+"</td>" +
								"<td>"+list[i].date+"</td>" +
								"<td>已完成</td></tr>";
							}else{
								str="<tr><td>"+list[i].merchant_wantedjob.title+"</td>" +
								"<td>"+list[i].merchant_wantedjob.workcontent +"</td>" +
								"<td>"+list[i].merchant_wantedjob.salary +"/"+ list[i].merchant_wantedjob.workcleanform+"</td>" +
								"<td>"+list[i].merchant_wantedjob.workplace.substring(7)+"</td>" +
								"<td>"+list[i].date+"</td>" +
								"<td>未完成</td></tr>";
							}
							$("#showList")
							.append(str);
													
							
							
						}
					}
				}	
			});
}

function tochangeBaseinfo(Merchant_username) {
	$
			.ajax({
				url : "Student_update.action",
				data : $("#updateinfo").serialize(),
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

