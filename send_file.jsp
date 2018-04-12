<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="ElGamal.*"%>
<%	
	KeyGeneration keygen=new KeyGeneration();
		
	int y= (int)(Math.random()*500);
	String myemail=(String)session.getAttribute("myemail");
	String myname=(String)session.getAttribute("name");
	String smail=request.getParameter("smail");
	String x=null,p=null,b=null,sname=null,sc=null,myx=null;				
	Statement st4 = null;
	ResultSet rs4=null;
												
	try{
										
	Connection con4=databasecon2.getconnection();
	st4=con4.createStatement();
	String sql4="select * from profile where email='"+smail+"'";
	rs4=st4.executeQuery(sql4);
		while(rs4.next()){
			x=rs4.getString("pkey");
			session.setAttribute("x",x);
			sname=rs4.getString("name");
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
										
	Connection con=databasecon.getconnection();
	st=con.createStatement();
	String sql="select * from profile where email='"+smail+"'";
	rs=st.executeQuery(sql);
		while(rs.next()){
			p=rs.getString("primekey");
			b=rs.getString("generatorkey");
			sc=rs.getString("sc");
			session.setAttribute("p",p);
			session.setAttribute("b",b);
			session.setAttribute("sc",sc);
		}	
	}
	catch (Exception eq) 
	{
		out.println(eq.getMessage());
	}
%>
<%		
				
	Statement st1 = null;
	ResultSet rs1=null;
												
	try{
										
	Connection con1=databasecon.getconnection();
	st1=con1.createStatement();
	String sql1="select * from profile where email='"+myemail+"'";
	rs1=st1.executeQuery(sql1);
		while(rs1.next()){
			myx=rs1.getString("primekey");
			session.setAttribute("myx",myx);
			
		}	
	}
	catch (Exception eq1) 
	{
		out.println(eq1.getMessage());
	}
%>
<%
	Thread.sleep(100);
	
	String pkey = keygen.generate_Publickey(p,b,x);
	session.setAttribute("c",pkey);
	
	Thread.sleep(100);
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
				<li ><a href="search.jsp">File Share</a></li>
				<li><a href="search.jsp">File Search</a></li>
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
          <h2><a href="index.html"><font size="5" color="#660000"><strong>Sharing 
            File</strong></font></a></h2>
          <form method="post" name="contact" action="uploadfile.jsp" enctype="multipart/form-data">
            <table width="350"  >
              <tr> 
                <td><font size="4"><strong>Send To:</strong></font></td>
                <td><input type="text" name="sname" id="name" value="<%=sname%>" style="background-color:pink; color:#000000; font-size:18px; border-radius:10px;"></td>
              </tr>
              <tr> 
                <td><font size="4"><strong>Title:</strong></font></td>
                <td><input type="text" name="title" id="name" style="background-color:pink; color:#000000; font-size:18px; border-radius:10px;"></td>
              </tr>
              <tr> 
                <td><font size="4"><strong>Message Key:</strong></font></td>
                <td><input type="text" name="mkey" id="name" value="<%=y%>" style="background-color:pink; color:#000000; font-size:18px; border-radius:10px;"></td>
              </tr>
              <tr> 
                <td><font size="4"><strong>File:</strong></font></td>
                <td><input type="file" name="myfile" id="name"></td>
              </tr>
              <tr> 
                <td><input type="submit"  name="submit" id="submit" value="Login" style="background-color:pink; color:#000000; font-size:18px; border-radius:10px;"/></td>
                <td> <input type="reset"  name="reset" id="reset" value="Reset" style="background-color:pink; color:#000000; font-size:18px; border-radius:10px;" /></td>
              </tr>
            </table>
          </form>
        </div>
      </li>
      <li> 
        <div> 
         
          <h2>Public Keys of <%=sname%> </h2>
          <p> 
          <h5>Prime Number: </h5>
          <h4> <%=p%> </h4></p>
          <p> 
          <h5>Generator: </h5>
          <h4> <%=b%> </h4></p>
          <p> 
          <h5>Secret Key: </h5>
          <h4> <%=x%> </h4></p>
          <p> 
          <h5>Public Key: </h5>
          <h4> <%=pkey%> </h4></p>
          <div> </div>
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