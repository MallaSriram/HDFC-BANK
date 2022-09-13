<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
long account_no=Long.parseLong(request.getParameter("t1"));
String name=request.getParameter("t2");
String password=request.getParameter("t3");
long trgtact=Long.parseLong(request.getParameter("t4"));
double amount=Double.parseDouble(request.getParameter("t5"));

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","krishna","krishna");

PreparedStatement ps=con.prepareStatement("select * from hdfcbank where account_no=? and name=? and password=?");

ps.setLong(1,account_no);
ps.setString(2,name);
ps.setString(3,password);

ResultSet rs=ps.executeQuery();

if(rs.next())
{    
	long balance=rs.getLong("amount");
	if(balance>=amount)
	{
try
{
	PreparedStatement ps1 = con.prepareStatement("update hdfcbank set amount=amount-? where account_no=? and name=? and password=?");
	
	ps1.setDouble(1,amount);
	ps1.setLong(2,account_no);
	ps1.setString(3,name);
	ps1.setString(4,password);
		
	int u = ps1.executeUpdate();
	if(u==1)
	{
	out.print(" Transfered Succesfully....."+"<p></P>");	
	out.print("Amount Transfered :"+amount+"<p></P>");
	
   try
   {
	PreparedStatement ps2=con.prepareStatement("update hdfcbank set amount=amount+? where account_no=?");
	
	ps2.setDouble(1,amount);
	ps2.setLong(2,trgtact);
	//ps2.setString(3,name);
	//ps2.setString(4,password);
	
	int u1 = ps2.executeUpdate();
	   if(u1==1)
	   {
	        out.print("Amount Added Successfully"+"<p></p>");
	        out.print("The target account balance is:"+amount+"<p></P>");
	   }
	    else
	    	out.print("Amount Adding Failed"+"<p></p>");
   }
   catch(Exception ex){}
	}
	else
	   out.print("Transfer Failed....");
   }
  catch(Exception ex){}
 }
 else
   {
	out.print("Insufficient Funds....");
   }
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","krishna","krishna");

	PreparedStatement ps3=con.prepareStatement("select * from hdfcbank where account_no=? and name=? and password=?");


	ps3.setLong(1,account_no);
	ps3.setString(2,name);
	ps3.setString(3,password);

	ResultSet rs1=ps3.executeQuery();
	ResultSetMetaData rsmd1=rs1.getMetaData();


	int n1=rsmd1.getColumnCount();
	%>
	<%="<table border=2>" %>
	<%="<tr>" %>

	<%
	 for (int i=1;i<=n1;i++)
	 {
	%>
	<%="<th><font color=red>"+rsmd1.getColumnName(i)+"</th>" %>

	<%
	 }
	%>
	<%="</tr>" %>

	<%
	while(rs1.next())
	{
	%>
	<%="<tr>" %>
	<%   	
		for(int i=1;i<=n1;i++)
		{
		%>
	<%="<td>"+rs1.getString(i)+"</td>" %>
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
	catch(Exception ex){}
}
	con.close();
}
	catch(Exception e)
{
out.print(e);	
}


%>