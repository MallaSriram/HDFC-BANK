<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
long account_no=Long.parseLong(request.getParameter("c1"));
String name=request.getParameter("c2");
String password=request.getParameter("c3");


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","krishna","krishna");
	PreparedStatement ps = con.prepareStatement("select * from hdfcbank where account_no=? and name=? and password=?");
	
	ps.setLong(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);
	
	//ResultSet rs= ps.executeQuery();
	int i = ps.executeUpdate();
	
	out.print("Welcome "+name+"Your Account    "+"'"+i+"'"+"    has Closed...");
	con.close();
}
catch(Exception ex)
{
	out.print(ex);
}
%>