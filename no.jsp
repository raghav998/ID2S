<%@page import="com.oreilly.servlet.*,java.sql.*,java.math.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import="ElGamal.*"%>
<html>
<head>
</head>
<body>

<%
		//Key Generation
		KeyGeneration keygen=new KeyGeneration();
		
		String bint = keygen.generate_Primekey();
		String temp[]=bint.split(",",3);
		BigInteger b1=new BigInteger(temp[0]);
		BigInteger b2=new BigInteger(temp[1]);
		String sc=temp[2];
					
		System.out.println("bint1"+b1);
		System.out.println("bint2"+b2);
		
		int y= (int)(Math.random()*200);
		
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
			Connection con1=databasecon.getconnection();
			st=con1.createStatement();
			String sql1="select max(id) from profile";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
				
		String name=null,gender=null,email=null,password=null,status="Allow",image=null,mobile=null,location=null;
		
		name=request.getParameter("name");
		email=request.getParameter("email");
		password=request.getParameter("password");
		
		location=request.getParameter("location");
		
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		
			
		
		try {
			
			
			Connection con=databasecon.getconnection(); 

			PreparedStatement ps=con.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?,?)");
				
               	ps.setInt(1,id);
				ps.setString(2,name);	
       			ps.setString(3,email);
       			ps.setString(4,password);
			    ps.setString(5,location);
			    ps.setString(6,temp[0]);
				ps.setString(7,temp[1]);
				ps.setString(8,temp[2]);
				
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("home.html?message=Successfully Registered");
			}
			else
			{
				response.sendRedirect("home.html?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
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