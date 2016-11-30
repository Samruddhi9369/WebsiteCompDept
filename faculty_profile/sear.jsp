<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">	<head>	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" /><title>Cummins College of Engineering for Women</title><link rel="stylesheet" type="text/css" href="css/style.css" /><link rel="stylesheet" type="text/css" href="css/brown.css" /></head><body text=A52A2A><div id="outline">	<div id="wrapper">	<!-- START HEADER --><div id="header">
<div id="headerBox"><p style="font-size:50px;"></p></div></div><!-- END HEADER --><center><b>
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
       
                 String id1=request.getParameter("username");
		if(id1=="")
		{	response.sendRedirect("search.html");
		}
		else
		{
                  rs1=stm.executeQuery("select * from finfo where sno="+Integer.parseInt(id1)+"  ");
							
                  while(rs1.next())
		           { flag=1;
		           %>
			       <table>
			        <tr><td>Sr No         :
			        
                                <% 				
				out.println(rs1.getInt("sno"));%>
				<br/><br/></td></tr>
                           
				
			        <tr><td>Name          :
				<%out.print(rs1.getString("Name"));
				 %><br/><br/></td></tr>

                                <tr><td>DOB           :<%
				out.println(rs1.getString("dob"));
				%><br/><br/></td></tr>
                                
                                <tr><td>Address       :<%
				out.println(rs1.getString("addr"));
				%><br/><br/></td></tr>

                                <tr><td>Phone Number  :<%
				out.println(rs1.getInt("pno"));
				%><br/><br/></td></tr>

                                <tr><td>Email ID      :<%
				out.println(rs1.getString("emailid"));
				%><br/><br/></td></tr>

                                <tr><td>Exam          :<%
				out.println(rs1.getString("exam"));
				%><br/><br/></td></tr>

                                <tr><td>University    :<%
				out.println(rs1.getString("uni"));
				%><br/><br/></td></tr>

                                <tr><td>Year          :<%
				out.println(rs1.getInt("year"));
				%><br/><br/></td></tr>

                                <tr><td>Percentage    :<%
				out.println(rs1.getInt("per"));
                        	%><br/><br/></td></tr>

	  
                                <tr><td>Class         :<%
				out.println(rs1.getString("class"));
                        		               


		           }		
		

}


con.close();
%>
<br/><br/></td></tr>
</table>
<%
  if(flag==1)
 {
%>
<a href="adminfunc.html">
<input type="submit" name="submit" value="back"></a>
</b>
<%
 }
%>

<% if (flag==0)
   {
%>
<h3> User not found </h3>
<a href="adminfunc.html">
<input type="submit" name="submit" value="back"></a>
<%
   }
%>
</body>
</html>