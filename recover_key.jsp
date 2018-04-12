<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="ElGamal.*"%>
<%
	Elgamal_Decryption elgam=new Elgamal_Decryption();

	String myname=(String)session.getAttribute("myname");
	String myfile=(String)session.getAttribute("myfile");

	String myc2=request.getParameter("c2");
	String ckey=request.getParameter("ckey");

	String c2=null,p=null,k1=null,sname=null,c1=null,myx=null,fname=null;
	Statement st4 = null;
	ResultSet rs4=null;
	Connection con=databasecon.getconnection();
	try{


	st4=con.createStatement();
	String sql4="select * from profile where name='"+myname+"'";
	rs4=st4.executeQuery(sql4);
		while(rs4.next()){
			p=rs4.getString("primekey");
			session.setAttribute("p",p);
			//out.println(p);
		}
	}
	catch (Exception eq4)
	{
		out.println(eq4.getMessage());
	}
%>
<%

	Statement st = null;
	ResultSet rs=null;

	try{


	st=con.createStatement();
	String sql="select * from share where title='"+myfile+"'";
	rs=st.executeQuery(sql);
		while(rs.next()){
			k1=rs.getString("k");
			c1=rs.getString("c1");
			c2=rs.getString("c2");
			sname=rs.getString("share_from");
			fname=rs.getString("file_name");
			//out.println(k1);
		}
	}
	catch (Exception eq)
	{
		out.println(eq.getMessage());
	}
%>

<%
	Thread.sleep(100);

	String m = elgam.decrypt(ckey,myc2,p);

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
          <h2><a href="index.html"><font size="5" color="#660000"><strong>File
            Name: <%=fname%></strong></font></a></h2>
          <form name="f" action="recover_key1.jsp" method="post">
            <p style=" color:#CC0000; font-size:18px">Recovered Key</p>
            <p><font style="color:#FF00FF; font-size:20px"><blink> <%=m%> </blink></font></p>
            <br>
            <p style=" color:#CC0000; font-size:18px">Enter Recovered Key:</p>
            <p align="center">
              <input type="text"  name="mym" value="" style="height: 20px; width: 12em; color:#000000; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1"  onkeypress="checkEnter(event)">
            </p>

            <p align="right">
              <input type="submit" name="sub" value="Download File" style="background-color:pink; border-radius:10px; font-size:18px; color:#000000;">
            </p>
          </form>
        </div>
      </li>
      <li>
        <div>
          <h2>Authenticated Key Exchange</h2>
          <div> <img src="images/file.png" height="300" width="400" alt="Image" /></a>
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
