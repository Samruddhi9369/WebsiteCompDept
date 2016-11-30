<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<html>
<head>
<title>Update Page</title>
</head>

<body>
<table>

<tr><td><center>Sr No:</center></td><td><center>
<input type="text" name="srno"></center></td></tr>

<tr><td>Name:</td><td><input type="text" name="fname"></td></tr>

<tr><td>Date Of Birth</td><td><input type="text" name="dob"></td></tr>

<tr><td>Address:</td><td><input type="text" name="addr"></td></tr>

<tr><td>Phone No:</td><td><input type="text" name="pno">

</td></tr>

<tr><td>Email_id:</td><td><input type="text" name="eid">

</td></tr>

<tr><td>Examination:</td><td><input type="text" name="exam">

</td></tr>
<tr><td>University:</td><td><input type="text" name="univ">

</td></tr>
<tr><td>Year:</td><td><input type="text" name="year">

</td></tr>
<tr><td>Percentage:</td><td><input type="text" name="per">


</td></tr>
<tr><td>Class:</td><td><input type="text" name="class">

</td></tr>
<tr><td></td><td><input type="submit" value="Submit"></td></tr>

</table>

<% 




int flag=0;
Connection con;
PreparedStatement pst;
ResultSet rs1;






	            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           
                String database = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\examples\\jsp\\sdtl.mdb"; 

                String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + database + " ";

                con = DriverManager.getConnection(url);

                 Statement stm=con.createStatement();
       
                 
                  rs1=stm.executeQuery("select * from finfo where sno="+2+"  ");
							
                  while(rs1.next())
		           {
		           %>
			        Sr No:
			        <% 				
				out.println(rs1.getInt("sno"));%>
				<br/><br/>
				Name:
				<%out.print(rs1.getString("Name"));
				 %><br/><br/>
                                                                 DOB:<%
				out.println(rs1.getString("dob"));
				%><br/><br/>Address:<%
				out.println(rs1.getString("addr"));
				%><br/><br/>Phone Number:<%
				out.println(rs1.getInt("pno"));
				%><br/><br/>Email ID:<%
				out.println(rs1.getString("eid"));
				%><br/><br/>Exam:<%
				out.println(rs1.getString("exam"));
				%><br/><br/>University:<%
				out.println(rs1.getString("uni"));
				%><br/><br/>Year: <%
				out.println(rs1.getInt("year"));
				%><br/><br/>
                Percentage:<%
				out.println(rs1.getInt("per"));
                        			%><br/><br/>

	
				Class:<%
				out.println(rs1.getString("class"));
                        		               

		           }		
		



con.close();
%>

</body>
</html>