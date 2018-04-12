<%@page import="com.oreilly.servlet.*,java.sql.*,java.math.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import="ElGamal.*"%>
<html>
<head>
</head>
<body>

<%
		//Key Generation
		KeyGeneration keygen=new KeyGeneration();

		System.out.println("****************");
	        System.out.println("\n");
	        System.out.println("Server 1 Registration");
	        System.out.println("\n");
	    System.out.println("****************");

		String bint = keygen.generate_Primekey();
		String temp[]=bint.split(",",3);
		BigInteger b1=new BigInteger(temp[0]);
		BigInteger b2=new BigInteger(temp[1]);



		//System.out.println("bint1"+b1);
		//System.out.println("bint2"+b2);

		int y= (int)(Math.random()*200);

		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		Connection con1=null;

	try{

		Class.forName("com.mysql.jdbc.Driver");
		con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
			// =databasecon.getconnection();

			System.out.println("Connection established");
			System.out.println("before Statement");

			st=databasecon.getconnection().createStatement();
			String sql1="select max(id) from profile";

			System.out.println("after Statement");


			rs1=st.executeQuery(sql1);
			System.out.println("query for id is executed");

			while(rs1.next())
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;

			System.out.println("max id is "+id);

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

		 System.out.println("name "+name+" mail "+email+" password "+password+" location "+location+" date "+date+" simple date "+strDateNew);


		try {




			PreparedStatement ps=con1.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?,?)");

               	ps.setInt(1,id);
				ps.setString(2,name);
       			ps.setString(3,email);
       			ps.setString(4,password);
			    ps.setString(5,location);
			    ps.setString(6,temp[0]);
				ps.setString(7,temp[1]);
				ps.setString(8,temp[2]);

			int x=ps.executeUpdate();
			System.out.println("data updated");
			if(x!=0)
			{
				response.sendRedirect("home.html?message=SuccessfullyRegistered");
			}
			else
			{
				response.sendRedirect("home.html?message=fail");
			}

		}
		catch (Exception e)
		{
			out.println(e.getMessage()+" Error Here");
		}
	}
	catch (Exception eq)
		{
			out.println(eq.getMessage()+" Error Here too");
			eq.printStackTrace();
		}
		finally{
			System.out.println("Connection closed");
			con1.close();
		}

 %>
</body>
</html>
