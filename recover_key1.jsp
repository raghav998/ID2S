<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>

<%
		String myname=(String)session.getAttribute("myname");
		String myfile=(String)session.getAttribute("myfile");
		String mym=request.getParameter("mym");
		String filename =null;
		String m=null;
		
		Statement st = null;
		ResultSet rs1=null;
		int count=0;
		
	try{
		
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select * from share where title='"+myfile+"' ";
			rs1=st.executeQuery(sql1);
			if(rs1.next()){
				m=rs1.getString("message_key");
				filename=rs1.getString("file_name");
				session.setAttribute("filename",filename);
				if(mym.equals(m)){
					response.sendRedirect("userfileview.jsp");
				}
				else{
					out.println("Enter Correct Key");
				}
				
			}	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
		
	
 %>

</body>
</html>