<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
long account_no=Long.parseLong(request.getParameter("d1"));
String name=request.getParameter("d2");
String password=request.getParameter("d3");
double amount=Double.parseDouble(request.getParameter("d4"));

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","krishna","krishna");
	PreparedStatement ps = con.prepareStatement("update hdfcbank set amount=amount+? where account_no=? and name=? and password=?");
	
	ps.setDouble(1,amount);
	ps.setLong(2,account_no);
	ps.setString(3,name);
	ps.setString(4,password);
		
	int u = ps.executeUpdate();
	out.print("Your balance is Increased"+" "+amount);
	
	PreparedStatement ts=con.prepareStatement("select amount from hdfcbank where account_no=? and name=? and password=?");
	
	
	ts.setLong(1,account_no);
	ts.setString(2,name);
	ts.setString(3,password);
	
	ResultSet rs=ts.executeQuery();
	ResultSetMetaData rsmd=rs.getMetaData();
	
	
	int n=rsmd.getColumnCount();
%>
<%="<table border=2>" %>
<%="<tr>" %>

<%
	 for (int i=1;i<=n;i++)
	 {
%>
<%="<th><font color=red>"+rsmd.getColumnName(i)+"</th>" %>

<%
	 }
%>
<%="</tr>" %>

<%
    while(rs.next())
    {
 %>
<%="<tr>" %>
<%   	
    	for(int i=1;i<=n;i++)
    	{
  	%>
<%="<td>"+rs.getString(i)+"</td>" %>
<% 
    	}
 %>
<%
    }
%>
<%="</tr>" %>
<%="</table>" %>
<%

	con.close();
}
catch(Exception e)
{
out.print(e);	
}


%>