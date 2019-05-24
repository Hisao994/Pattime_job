var minJobid = 0;
var maxJobid = 0;
var Jobid;
var workcleanform;
var workplace;
var pages = 1;
var pageSize = 3;
var orderby;
var workplace="999";
$(function() {
	workplace=document.getElementById("school").value;
	if(workplace=="999"){
		workplace = document.getElementById("city").value;
	}
	
	findWanteedJobList();
})
function findWanteedJobList(data) {
	if(workplace==null){
		workplace = document.getElementById("school").value;
	}
	if(workplace=="999"){
		workplace = document.getElementById("city").value;
	}
	
	if (data != null) {
		pages = data;
	}
	$.ajax({
		url : "findJobList.action",
		mothod : "GET",
		dataType : 'HTML',
		data : {
			job_id : Jobid,
			workcleanform : workcleanform,
			pages : pages,
			pageSize : pageSize,
			workplace: workplace,
			orderby:orderby
		},
		success : function(data) {
			$("#part0").html(data);
		}
	})
}
function change(para) {
//	var job_id = document.getElementById("job_id");
//	job_id.value = para;
	pages = 1;
	if (para == 0) {
		Jobid = null;
		regain();
		findWanteedJobList();
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
	Jobid = para;
	document.getElementById("job_id" + para).style.color = "#0C8";
	if (para >=lis.length) {
		findWanteedJobList();
	}
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

function choice1(para) {
	pages = 1;
	var PTPX = "普通排序";
	var LWZJ = "离我最近";
	var ZXFB = "最新发布";
	var RMJZ = "热门兼职";
	var XZZG = "薪资最高";
	var CZ = para.innerHTML;
	 if ("普通排序" == CZ) {
		workplace = null;
		findWanteedJobList();
	}else if ("离我最近" == CZ) {
		workplace = document.getElementById("city").value;
		findWanteedJobList();
	} else if ("最新发布" == CZ) {
		orderby = "posttime";
		findWanteedJobList();
	} else if ("热门兼职" == CZ) {
		workplace = para.innerHTML;
		sort1.style.display = "none";
		$
				.ajax({
					url : "sortList.action",
					mothod : "POST",
					dataType : 'HTML',
					data : {
						orderby : workplace,
					},
					success : function(data) {
						document.getElementsByClassName("ways")[0].innerHTML = para.innerHTML;
						$("#part0").html(data);
					}
				})
	} else if ("薪资最高" == CZ) {
		orderby = "salary";
		findWanteedJobList();
	}
	document.getElementsByClassName("ways")[0].innerHTML = para.innerHTML;
	sort1.style.display = "none";
}
function choice2(data) {
	pages = 1;
	var a = "不限";
	var b = data.innerHTML;
	if (a == b) {
		workcleanform = null;
	} else {
		workcleanform = data.innerHTML;
	}
	document.getElementsByClassName("ways")[1].innerHTML = data.innerHTML;
	sort2.style.display = "none";

	
}
function regain() {
	workcleanform = null;
	workplace = null;
	document.getElementsByClassName("ways")[0].innerHTML = "默认排序";
	document.getElementsByClassName("ways")[1].innerHTML = "结算方式";
}

function get(id) {
	return document.getElementById(id);
}

var sort1 = get("sort1");
var sort2 = get("sort2");
var onoff = true;
document.getElementsByClassName("sort")[0].onclick = function() {
	if (onoff) {
		sort1.style.display = "block";
		sort2.style.display = "none";
	} else {
		sort1.style.display = "none";
	}
	onoff = !onoff;
}

document.getElementsByClassName("sort")[1].onclick = function() {
	if (onoff) {
		sort2.style.display = "block";
		sort1.style.display = "none";
	} else {
		sort2.style.display = "none";
	}
	onoff = !onoff;
}



