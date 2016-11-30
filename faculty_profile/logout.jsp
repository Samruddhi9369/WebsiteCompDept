<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.lang.*" %>

<% 

Statement st;
Connection con;
ResultSet rs=null;
String stat1="login";
String stat2="logout";
String stat3="old";
int id=0;
int ss=0;

int flag=0;

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
String database="C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\examples\\jsp\\sdtl.mdb";
String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + database + "";
con=DriverManager.getConnection(url);
st=con.createStatement();
rs=st.executeQuery("select * from userlogin");
while(rs.next())
{
	id=rs.getInt("userid");
	ss=id;
	String s=rs.getString("passwd");
	String s1=rs.getString("status");
	if(s1.equals(stat1))
	{   flag=1;
		
		break;
	}

}
if(flag==1)
{
  st.executeUpdate("update userlogin set status='"+stat2+"' where userid="+ss+" ");
  response.sendRedirect("layout-3.html");	
}


con.close();

%>