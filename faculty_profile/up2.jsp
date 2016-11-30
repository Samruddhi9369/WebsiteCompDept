
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.lang.*" %>

<% 

Statement st;
Connection con;
ResultSet rs=null;

int id=0;
int ss=0;
int uid;
String stat1="login";
String stat2="logout";
String stat3="old";
String pn;
int pno1;
int flag=0;

pn=request.getParameter("pno");
pno1=Integer.parseInt(pn);


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
st.executeUpdate("update finfo set pno="+pno1+" where sno="+ss+" ");
response.sendRedirect("register1.html");
}

con.close();
%>