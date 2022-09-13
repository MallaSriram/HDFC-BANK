<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Balance</title>
<style>
a{
font-size : 25px;
background-color : orange;
margin : 20px;
border : 2px solid black;
border-radius : 0px 10px;
text-decoration: none;
}
a:hover{background-color: pink;}

</style>

</head>
<body bgcolor= "orange">
<center>
<img src = "hdfc.png" height='120' width='230'><hr><p></p>

<a href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="newaccount.jsp">New Account</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="balance.jsp">Balance</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="deposit.jsp">Deposit</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="withdraw.jsp">Withdraw</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="transfer.jsp">Transfer</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="close.jsp">Close A/C</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="aboutus.jsp">AboutUs</a>&nbsp;&nbsp;&nbsp;&nbsp;<hr><p></p>
<h2>BALANCE FORM</h2>
<form action = "BalanceCode.jsp" method = "post">
<table>
<tr>
<td>Account No:</td>
<td><input type = "text" name = "b1"></td>
</tr>
<tr>
<td>Name:</td>
<td><input type = "text" name = "b2"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type = "password" name = "b3"></td>
</tr>
<tr>
<td><input type = "submit" value = "submit"></td>
<td><input type = "reset" value = "clear"></td>
</tr>

</table>
</form>
</center>
</body>
</html>