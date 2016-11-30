<%@page import="java.sql.*"%>
<%

int cnt;
ResultSet rs1; 
String name;
name=request.getParameter("username");
//int i=Integer.parseInt(id);

if(name=="")
{
 response.sendRedirect("deleteidnt.html");
}
else
{

int id=Integer.parseInt(name);
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     
String database = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\examples\\jsp\\sdtl.mdb"; 
String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + database + "";
Connection con = DriverManager.getConnection(url);
Statement stm=con.createStatement();
  
		   cnt=stm.executeUpdate("delete from userlogin where userid="+id+"");
		   if(cnt==1)
			response.sendRedirect("deleteyes.html");
		   else
	                response.sendRedirect("deleteno.html");
}
			
%>
