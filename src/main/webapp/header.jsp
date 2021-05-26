<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <script>

    function idcheck()
    {
      var form = document.loginform;
      //입력값이 없으면
      console.log(form.id.value);
      if(!form.id.value)
      {
        document.querySelector('.id_no_value').style.display='block';
        return false;
      }
      else
      {
            document.querySelector('.id_no_value').style.display='none';
            return true;
      }
    }

    function pwcheck()
    {
      var form = document.loginform;
      //입력값이 없으면
      console.log(form.pw.value);
      if(!form.pw.value)
      {
        document.querySelector('.pw_no_value').style.display='block';
        return false;
      }
      else
      {
            document.querySelector('.pw_no_value').style.display='none';
            return true;
      }
    }

    function sign()
    {
      var form = document.loginform;

      if(idcheck())
      {
        if(pwcheck())
        {
          form.submit();
        }
        else {
          form.pw.focus();
        }
      }
      else {
        form.id.focus();
      }
    }


    </script>
    
<nav  width="70%" >
  <div >
  	<div>
	    <a href="/index.jsp">
	      <img src="/img/logo.jpg" width="200" height="70" class="d-inline-block align-text-top">
	    </a>
	    <form class="">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	 </div>
  </div>
  <div align="center">
  
  <%
  
  
	session = request.getSession();
	String user_id = (String)session.getAttribute("id");

  if(user_id == null){ %>
  <div class="loginbox" style="float:left;" align="left">
    <form  name="loginform" action="/login/login_check.jsp" method="post">
      <p>
        <input type="text" name="id" placeholder="아이디" class="edittext"
        onfocus="idcheck();" onblur="idcheck();">
      </p>
      <p class="id_no_value" style="color:red; display:none;">
          아이디를 입력해주세요.
      </p>
      <p>
        <input type="password" name="pw" placeholder="비밀번호" class="edittext"
          onfocus="pwcheck();" onblur="pwcheck();">
      </p>
      <p class="pw_no_value" style="color:red; display:none;">
         비밀번호를 입력해주세요.
      </p>
      </div>
      <div style="float:left;"><button class="btn" type="button" onclick="sign();" >로그인</button></div>


    </form>
  </div>
        

<br><br><hr><br>


        


      <p>
        <button class="btn" type="button" onclick="location.href='/join/agreement.jsp'">회원가입</button>
      </p>
      
      <%}else{ %>
      <p><%= user_id %>님 반갑습니다!</p>
      
      <a class="nav-link" href="/login/logout.jsp">로그아웃</a>
      
      <%} %>
  
</div>
   
</nav>

