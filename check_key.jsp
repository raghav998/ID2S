<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
		String myfile=request.getParameter("myfile");
		session.setAttribute("myfile",myfile);
%>

<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8" />
	<title>ID2S Password Authentication</title>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<!--[if IE 8]>
		<link rel="stylesheet" type="text/css" href="css/ie8.css" />
	<![endif]-->
	<!--[if IE 7]>
		<link rel="stylesheet" type="text/css" href="css/ie7.css" />
	<![endif]-->
	<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" href="css/ie6.css" />
	<![endif]-->
</head>
<body>
	<div id="header">
		<div>
			
    <div> 
      <div> <a href="home.html"><img src="images/logo1.png" alt="Logo"/></a> </div>
      <!--	<div>
					<div>
					<!--	<a href="signup.html">My Account</a>
						<a href="index.html">Help</a>
						<a href="signin.html" class="last">Sign in</a> 
					</div>
				<!--	<form action="#">
						<input type="text" id="search" maxlength="30" />
						<input type="submit" value="" id="searchbtn" />
					</form> 
				</div> -->
    </div>
			<ul>
				<li class="current"><a href="search.jsp">File Share</a></li>
				<li ><a href="search.jsp">File Search</a></li>
				<li><a href="home.html">Logout</a></li>
				<li><a >Welcome to</a></li>
				<li><a ><%=myname%></a></li>
				<li><a href="contact.html">&nbsp;</a></li>
			</ul>
			
    <div class="section"> <a href="index.html"><img src="images/banner1.jpg" alt="Image"/></a> 
    </div>
		</div>
	</div>
	<div id="content">
	 
  <div> 
    <h1><strong>ID2S Password Authentication</strong></h1>
    <ul>
      <li> <div> 
        <div style="bordercolor:#006600; width:450; height:400px; border:3px;"> 
          <h2><a href="index.html"><font size="5" color="#660000"><strong>Key's 
            for File Download</strong></font></a></h2>
          <form name="f" action="diffie_hellman.jsp" method="post">
            <p style=" color:#CC0000; font-size:18px">Cipher Key</p>
            <p align="center"> 
              <input type="text"  name="c1" style="height: 20px; width: 12em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="C1"  onkeypress="checkEnter(event)">
            </p>
            <p style=" color:#CC0000; font-size:18px; width:14em;">Private Key(From 
              server 2)</p>
            <p align="center"> 
              <input type="text"  name="privatekey" style="height: 20px; width: 12em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="Private Key"  onkeypress="checkEnter(event)">
            </p>
            <p align="right"> 
              <input type="submit" name="sub" value="Next" style="background-color:pink; color:#000000; font-size:20px; border-radius:10px;">
            </p>
          </form>
          <p><a href="get_key.jsp"><font style="color:#FF00FF; font-size:20px">Get 
            Cipher Key</font></a></p>
        </div>
      </li>
      <li> 
        <div> 
          <div> <img src="images/keyexchange.jpg" height="300" width="400" alt="Image" /></a> 
          </div>
        </div>
      </li>
    </ul>
  </div>
  </div>
	
	<div id="footer">
		<div class="home">	
	<marquee><font color="#003333" size="6" style="align:center;" face="Lucida Calligraphy">ID2S Password-Authenticated Key Exchange Protocols</font></marquee>
	</div>
		
		</div>
	
</body>
</html>