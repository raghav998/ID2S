<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
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
				<li class="current"><a href="home.html">Home</a></li>
				<li ><a href="#">File Share</a></li>
				<li><a href="#">File Search</a></li>
				<li><a href="home.html">Logout</a></li>
				<li><a>Welcome To</a></li>
				<li><a ><%=myname%></a></li>
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
          <h2><a href="index.html"><font size="5" color="#660000"><strong>Search 
            File</strong></font></a></h2>
          <form name="f" action="search_result.jsp" method="post">
            <p align="center"> 
              <input type="text"  name="search" style="height: 2em; width: 12em; color:#000000; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="Search here"  onkeypress="checkEnter(event)">
            </p>
          </form>
          <a href="#"><img src="images/search.gif" alt="image" class="image_wrapper" width="300" height="250" /></a> 
        </div>
      </li>
      <li> 
        <div> 
          <h2>Share File</h2>
          <div> <br>
            <br>
            <ul style="text-decoration: none;">
              <%		
						
										Statement st4 = null;
										ResultSet rs4=null;
												
									try{
										
											Connection con4=databasecon.getconnection();
											st4=con4.createStatement();
											String sql4="select * from profile";
											rs4=st4.executeQuery(sql4);
											while(rs4.next()){%>
              <a href="send_file.jsp?smail=<%=rs4.getString("email")%>"> <img src="images/onebit_17.png" align="middle">&nbsp; 
              <font color="#006666" size="4" ><%=rs4.getString("name")%></font><br>
              <br>
              </a> 
              <%}	
									}
									catch (Exception eq4) 
										{
											out.println(eq4.getMessage());
										}
								 %>
            </ul>
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