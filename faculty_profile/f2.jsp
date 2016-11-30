
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.lang.*" %>

<% 

PreparedStatement pst;
Connection con;
ResultSet rs;

String upwd,ueid;
upwd=request.getParameter("pwd");
ueid=request.getParameter("eid");

if(upwd=="" || ueid=="")
{
  response.sendRedirect("allfields.html");
}

else if(upwd.length()< 8 || upwd.length() > 8)
{
   response.sendRedirect("pwdlen.html");
}
else
{

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
String database="C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\examples\\jsp\\sdtl.mdb";
String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + database + "";
con=DriverManager.getConnection(url);

pst = con.prepareStatement("insert into userlogin(passwd,emailid)values(?,?)");

pst.setString(1, upwd);
pst.setString(2, ueid);
pst.executeUpdate();

response.sendRedirect("insert1.html");

con.close();
}
%>

