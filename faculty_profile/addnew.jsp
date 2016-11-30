
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
String pn,name1,dob1,addr1,eid1,exam1,uni1,year1,per1,class1,uid1;
int ye1,pno1,pe1;

int id=0;
int ss=0;
name1=request.getParameter("fname");
dob1=request.getParameter("dob");
addr1=request.getParameter("addr");
pn=request.getParameter("pno");
pno1=Integer.parseInt(pn);

eid1=request.getParameter("eid");
exam1=request.getParameter("exam");
uni1=request.getParameter("univ");
year1=request.getParameter("year");
ye1=Integer.parseInt(year1);
per1=request.getParameter("per");
pe1=Integer.parseInt(per1);
class1=request.getParameter("class");
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
st.executeUpdate("insert into finfo values("+id+",'"+name1+"','"+dob1+"','"+addr1+"',"+pno1+",'"+eid1+"','"+exam1+"','"+uni1+"',"+ye1+","+pe1+",'"+class1+"','"+stat3+"')");	
response.sendRedirect("addf1.html");

}



con.close();

%>

