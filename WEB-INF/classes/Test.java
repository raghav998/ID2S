import java.sql.*;
class Test{
  public static void main(String[] args) {

    try{
      Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");

      System.out.println("Connection established");

      Statement st=con.createStatement();

      System.out.println("Statement created");
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
}
