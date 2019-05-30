<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="css/studentjob.css" />


<div id="header">
	<div class="header-m">
		<img src="img/logo_about.png" />
		<div id="nav">
			<a href="index.jsp">首页</a>
			<a href="" class="entrance">学生：${Student.stu_name } 的个人中心</a>
		</div>
	</div>
</div>
<div id="content">
	<div class="cont_left" style="display: block;">
		<span class="tit">学生 ${Student.stu_name } 的信息</span>
		<div class="details"></div>
	</div>
	<!-- ===========================================基本信息====================================================== -->
	<div id="baseinfo" class="cont_left">
		<span class="tit">基本信息</span>
		<div class="details">
		<form id="updateinfo" style="text-align: center">
			<p><input name='stu_id' id='stu_id' value=" ${Student.stu_id }"   validateevent='true' class='el-input__inner' type="hidden"/></p>
			<p>学 生 姓 名 ：<input name='stu_name' id='stu_name' value=" ${Student.stu_name }"   validateevent='true' class='el-input__inner'/></p>
		    <p>学 生 电 话 ：<input name='stu_telephone' id='stu_telephone' value=" ${Student.stu_telephone }"   validateevent='true' class='el-input__inner'/></p>
		    <p>学 生 邮 箱 ：<input name='stu_email' id='stu_email' value=" ${Student.stu_email }"   validateevent='true' class='el-input__inner'/></p>
		    <p>身 份 证 号：<input name='stu_idcard' id='stu_idcard' value=" ${Student.stu_name }"   validateevent='true' class='el-input__inner'/></p>
            <p>学 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp; ：<input name='stu_stuidcard' id='stu_stuidcard' value="${Student.stu_stuidcard }"   validateevent='true' class='el-input__inner'/></p>
            <p>省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份&nbsp;&nbsp;：<select id="province" name="province"></select></p>
		   	<p>城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市&nbsp;&nbsp;：<select id="city" name="city"></select></p>
		   	<p>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;：<select id="school" name="school"></select></p>
		   	<br/><br/><br/>
		    <input  class="entrance" type='button' onclick='tochangeBaseinfo()' value='完善'/>
			</form>
		</div>
	</div>
	<!-- ===========================================招聘信息====================================================== -->
	<div id="jobinfo" class="cont_left">
		<span class="tit">应聘信息</span>
		<div class="details">
			<table id="showList">
			
				
			</table>
		</div>
	</div>
	<!-- ===========================================发布信息====================================================== -->
	<div id="parttimejob" class="cont_left">
		<span class="tit">求职意向</span>
		<div class="details">
			<form id="parrtimejob">
				<input type="hidden" name="stu_id" value="${stu_id }" />
				<input type="hidden" id="job_id" name="job_id" value="" />
				<!--*********************选择地区*********************-->

				<div class="choice">
					<div class="choiceC">工作区域：</div>
					<!-- --------------------------省信息-------------------------- -->
					<div class="rows">
						<div class="label">省份</div>
						<div class="divide">|</div>
						<div class="text">
							<select id="province" name="province"></select>
						</div>
					</div>
					<!-- --------------------------市信息-------------------------- -->
					<div class="rows">
						<div class="label">城市</div>
						<div class="divide">|</div>
						<div class="text">
							<select id="city" name="city"></select>
						</div>
					</div>
					<!-- -------------------------学校信息-------------------------- -->
					<div class="rows">
						<div class="label">学校</div>
						<div class="divide">|</div>
						<div class="text">
							<select id="school" name="school" ></select>
						</div>
					</div>
				</div>

				<!--*********************选择工作*********************-->
				<div class="choice">
					<div class="choiceC">职位分类：</div>
	
					<ul class="choiceB" id="choices" style="float: rigth;">
						
						<c:forEach items="${industryList }" var="job">
							<c:if test="${job.fathernode==0 }">
								<li id="job_id${job.id }" onclick="change(${job.id })">${job.parameter}</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div class="choice">
					<div id="choiceprofession">
						<div id="choiceC" class="choiceC">更多选择：</div>
						<ul class="professions" id="profession" style="width: 676px; float: right;">
						</ul>
					</div>
				</div>
				<!--*********************工资*********************-->
				期望工资：
				<input type="text" name="salary" placeholder="" />
				工资结算:
				<select name="workcleanform">
					<option>日结</option>
					<option>周结</option>
					<option>月结</option>
					<option>完工结</option>
				</select>


				<br /><br /><br />

				<input class="entrance" type="button"  onclick="studentjob()" value="提交求职意向" />
				
				
			</form>
		</div>
	</div>
	<!-- ===========================================右边====================================================== -->
	<div class="right">
		<div class="message">
			<div class="title">学生信息</div>
			<span class="button" >基本信息</span>
			<span class="button" onclick="showList()">应聘信息</span>
			<span class="button">兼职意向</span>
		</div>
	</div>

	<script type="text/javascript" src="js/studentjob.js"></script>
	<script type="text/javascript" src="js/school.js"></script>
	<script type="text/javascript" src="js/Allschool.js"></script>
	</body>
	</html>