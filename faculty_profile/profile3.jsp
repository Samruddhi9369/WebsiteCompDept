<%-- 
    Document   : adduser
    Created on : 23 march 2012, 9:45:05 PM
    Author     : nishi
--%>

<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.awt.Dialog" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>E-SLAM BOOK</title>
<link href="style4.css" rel="stylesheet" type="text/css" />
</head>

<body>
 <div id="topheader">
	<div class="logo">
	<div class="tagline">
		<font color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Now get your Slambook filled online...</font><br />
	</div>
	</div>
	<div class="menu_area"> <a href="#" class="ideas">Home </a> <a href="#" class="links">Edit</a> <a href="profile.html" class="info">Profile </a> <a href="slamquest.html" class="works">Slambook </a>
	</div>
	<div class="logout"> 
		<font color="black"> Welcome 
		</font>
	</div>
</div>
	<div id="body_area">
		<div class="left">
			<div class="left_menu_area">
				<div align="right">
					<img src="images/download.jpg"></img>
					<a href="index1.html" class="left_menu">Home</a><br />
					<a href="myslam.html" class="left_menu">Instant Slams</a><br />
					<a href="viewprofile.html" class="left_menu">My Profile</a><br />
					<a href="profileindex.html" class="left_menu">Create Profile</a><br />
					<a href="createslam.html" class="left_menu">Create Slambook</a><br />
					<a href="viewslam.html" class="left_menu">View Slambook</a><br />
					<a href="invite.html" class="left_menu">Invite Friends </a><br />
					<a href="index2.html" class="left_menu">Logout</a><br />
				</div>
			</div>
		</div>
	
	
		<div class="midarea1">
			<div class="head">Hi!</div>
			
				<div align="justify">
					
				

				<p style="text-align:center;"></p>	
				</div>
		
		<p style="text-align:center;"> 
	
	

<% 
int flag=0;
Connection con;
PreparedStatement pst;
ResultSet reset;
ResultSet rs1;
try
{
	String fname,lname,gender,email,add,occ,abtme,status,country,uid,unm;
	Integer mno,flg=0;
	Date dob;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:reg1");
	Statement stm=con.createStatement();
	rs1=stm.executeQuery("select * from Cur");
	if(rs1.next())
	{
		unm=rs1.getString("UNm");
		reset=stm.executeQuery("select * from User_Profile");
		while(reset.next())
		{	
			if(unm.equals(reset.getString("UserID")))
			{
				flg=1;%>
			Email adderss:
				<%out.println(reset.getString("Email"));%>
				<br/><br/>
				First Name:
				<%out.print(reset.getString("FirstName"));
				%><br/><br/>Last Name:<%
				out.println(reset.getString("LastName"));
				%><br/><br/>Gender:<%
				out.println(reset.getString("Gender"));
				%><br/><br/>DOB:<%
				out.println(reset.getString("BirthDate"));
				%><br/><br/>I am:<%
				out.println(reset.getString("Status"));
				%><br/><br/>Occupation:<%
				out.println(reset.getString("Occupation"));
				%><br/><br/>Address:<%
				out.println(reset.getString("Address"));
				%><br/><br/>Country: <%
				out.println(reset.getString("Country"));
				%><br/><br/><Mobile:<%
				out.println(reset.getString("MobilePhone"));	
			}
		}
		if(flg==0)
				out.println("Profile not created yet...");
		}
    con.close();
}

catch(Exception e)
{
    out.println("account creation failed due to "+e);
}


%>
</table>		
		</p>
		</div>
		</div>
		<div class="right">
			<img src="images/slambook.jpg"></img>
		</div>
		<div id="fotter">
			<div class="fotter_links">
				<div align="center"><a href="#" class="fotterlink">Home</a>  |  <a href="#" class="fotterlink">About Us</a>  |  <a href="#" class="fotterlink">Contact Us</a></div>
			</div>
			<div class="fotter_designed">
				<div align="center">Designed By : <a href="#" class="fotter_designedlink">E-Slam</a></div>
			</div>
		</div>   
 <center>

</center>
    </body>
</html>