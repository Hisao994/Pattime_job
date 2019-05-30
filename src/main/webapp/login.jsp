<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<%@ include file="header1.jsp"%>



<script type="text/javascript">
  $(function() {
    $("#loginForm").validate({
      rules : {
        username : {
          required : true,
          phone : true
        },
        password : {
          required : true,
        }
      },
      messages : {
        username : {
          required : "手机不能为空",
        },
        password : {
          required : "密码不能为空",
        }
      }
    });
  })
</script>

<div id="d3" style="height: 400px; display: none;">
  <img src="img/3.png" class="i1" style="width: 48px; height: 48px;">
  <form class="el-form" id="regForm" action="Merchant_baseinfoReg.action" method="post">
    <div class="el-form-item">
      <div class="el-form-item__content">
        <div class="el-input">
          <input id="Merchant_username" autocomplete="off" placeholder="手机号码" type="text" id="tel" name="Merchant_username" rows="2" maxlength="11"
            validateevent="true" class="el-input__inner"
          >
        </div>
      </div>
    </div>
    <div class="el-form-item">
      <div class="el-form-item__content">
        <div class="el-input">
          <input onblur="judge(this)" autocomplete="off" placeholder="手机验证码" id="code" name="code" rows="2" validateevent="true" class="el-input__inner">
        </div>
        <span id="t1" onclick="sendNote()">获取验证码</span>
        <div class="zhu">
          <input placeholder="验证码" type="text" rows="1" name="zccode" id="zccode" maxlength="4" validateevent="true" class="el-input__inner">
          <img src="image.jsp" onclick="changeVilidateCode(this)" style="position: relative; top: -28px; left: 55px;" />
        </div>
      </div>
    </div>
    <div class="el-form-item">
      <div class="el-form-item__content" style="position: relative; top: -40px;">
        <button type="submit" class="el-button next-btn el-button--primary zhu">
          <span id="register">注册</span>
        </button>
      </div>
    </div>
    <span style="margin-top: 10px;" onClick="dl()" class="txt dll">已有账号？立即登录</span>
  </form>
</div>

<div id="d4" style="height: 500px; display: none;">
  <img src="img/3.png" class="i1" style="width: 48px; height: 48px;">
  <form class="el-form" id="regForm" action="Merchant_baseinfoReg.action" method="post">
    <div class="el-form-item">
      <div class="el-form-item__content">
        <div class="el-input">
          <input id="Merchant_username" autocomplete="off" placeholder="手机号码" type="text" id="tel" name="Merchant_username" rows="2" maxlength="11"
            validateevent="true" class="el-input__inner"
          >
        </div>
        <div class="el-input">
              <input autocomplete="off" placeholder="密码" type="password" id="merchant_password" name="merchant_password" rows="1" validateevent="true" class="el-input__inner">
        </div>
      </div>
    </div>
    <div class="el-form-item">
      <div class="el-form-item__content">
        <div class="el-input">
          <input onblur="judge(this)" autocomplete="off" placeholder="手机验证码" id="code" name="code" rows="2" validateevent="true" class="el-input__inner">
        </div>
        <span id="t1" onclick="sendNote()">获取验证码</span>
        <div class="zhu">
          <input placeholder="验证码" type="text" rows="1" name="zccode" id="zccode" maxlength="4" validateevent="true" class="el-input__inner">
          <img src="image.jsp" onclick="changeVilidateCode(this)" style="position: relative; top: -28px; left: 55px;" />
        </div>
      </div>
    </div>
    <div class="el-form-item">
      <div class="el-form-item__content" style="position: relative; top: -40px;">
        <button type="button" onclick="update()" class="el-button next-btn el-button--primary zhu">
     确定修改
    </button>
      </div>
    </div>
    <span style="margin-top: 10px;" onClick="dl()" class="txt dll">已有账号？立即登录</span>
  </form>
</div>


<div id="d2" style="height: 400px; display: block;">
  <img src="img/3.png" class="i1" style="width: 48px; height: 48px;" />
  <form class="el-form" id="loginForm">
    <input autocomplete="off" placeholder="手机号码" type="text" id="username" name="username" rows="1" maxlength="11" validateevent="true"
      class="el-input__inner"
    >
    <input autocomplete="off" placeholder="密码" type="password" id="password" name="password" rows="1" validateevent="true" class="el-input__inner">
    <button type="button" onclick="doit()" class="el-button next-btn el-button--primary">
      <span id="login">商家登录</span>
    </button>
  </form>
  <span style="margin-top: 10px;" onClick="zc()" class="txt">立即注册商家账号</span>
  <br />
  <span style="margin-top: 10px;" onClick="wjmm()" class="txt">忘记密码</span>
  <a style="margin-top: 10px;" href="studentlogin.jsp">我是学生</a>
</div>
</div>
<div style="height: 200px;"></div>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/note.js"></script>
</body>
</html>
