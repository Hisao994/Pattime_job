<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/detail.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="parttimejob" class="cont_left">
	<span class="tit">工作信息</span>
	<div class="details">
		<form id="parrtimejob">
			<input type="hidden" id="merchant_wantedjob_id"
				name="merchant_wantedjob_id" value="${Merchant_wantedjob.merchant_wantedjob_id }" />
			<!-- 123 -->
			<input type="hidden" id="stu_id"
				name="stu_id" value="${student.stu_id }" />
			<br/>
			<p  >${Merchant_wantedjob.title }</p>
			<br/>
			
			<c:if test="${Merchant_wantedjob.workcleanform eq '日结' }">
				<span id="salary">薪资：</br>${Merchant_wantedjob.salary }元/日结</span>&nbsp;&nbsp; 
						</c:if>
			<c:if test="${Merchant_wantedjob.workcleanform eq '周结' }">
				<span id="salary">薪资：</br>${Merchant_wantedjob.salary }元|周结</span>&nbsp;&nbsp; 
						</c:if>
			<c:if test="${Merchant_wantedjob.workcleanform eq '月结' }">
				<span id="salary">薪资：</br>${Merchant_wantedjob.salary }元|月结</span>&nbsp;&nbsp; 
						</c:if>
			<c:if test="${Merchant_wantedjob.workcleanform eq '完工结算' }">
				<span id="salary">薪资：</br>${Merchant_wantedjob.salary }元/件|完工结算</span>&nbsp;&nbsp; 
						</c:if>
			
			<br />
			发布时间:<p id="P_workcontent" >${Merchant_wantedjob.posttime }</p>
			工作地点：<p id="P_workplace" >${fn:substring(Merchant_wantedjob.workplace,7,-1) }</p>
			工作描述：<p id="P_workdescp" >${Merchant_wantedjob.workdescp }</p>
			工作内容:<p> ${Merchant_wantedjob.workcontent }</p>
			工作要求:<p id="P_workdemand">${Merchant_wantedjob.workdemand }</p>
			<a class="signup" id="t1" href="index.jsp" >返回上一页</a>
			<input class="signup" type="button" onclick="applyinfo()" value="申请" />
		</form>
		
	</div>
	
</div>

<script type="text/javascript" src="js/indexdetail.js"></script>
</body>
</html>