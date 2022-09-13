<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
String account_no=request.getParameter("a1");
String name=request.getParameter("a2");
String password=request.getParameter("a3");
String confirm_psw=request.getParameter("a4");
double amount=Double.parseDouble(request.getParameter("a5"));
String address=request.getParameter("a6");
long mobile_no=Long.parseLong(request.getParameter("a7"));

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","krishna","krishna");
	PreparedStatement ps = con.prepareStatement("insert into hdfcbank values(?,?,?,?,?,?,?)");
	ps.setString(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);
	ps.setDouble(4,amount);
	ps.setString(5,address);
	ps.setLong(6,mobile_no);
	ps.setString(7,confirm_psw);
	
	int i = ps.executeUpdate();
	out.print(i+" "+"Inserted Successfully.......");
	con.close();
}
catch(Exception e)
{
out.print(e);	
}


%>