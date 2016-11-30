<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%




Connection con = null;
Statement statement = null;
ResultSet rs = null;
ResultSet rs1=null;


Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
String database="C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\examples\\jsp\\sdtl.mdb";
String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + database + "";
con=DriverManager.getConnection(url);

int stid=0;
String stat="login";
statement = con.createStatement();
rs = statement.executeQuery("SELECT * FROM userlogin");

String ss=request.getParameter("username");

int flag=0;
int flag1=0;
String pw1=request.getParameter("password");

if(ss=="" || pw1=="")
{
	response.sendRedirect("faclog.html");
}
else
{

int id1=Integer.parseInt(ss);

while (rs.next()) {
	int id=rs.getInt(1);
	String pw=rs.getString(2);
	if(id==id1)
	{
		if(pw.equals(pw1))
		{
			stid=id;			
			flag=1;
                        break;
		}
                
	}


}
if(flag==1)
{
	 statement.executeUpdate("update userlogin set status='"+stat+"' where userid="+stid+" ");
         rs1=statement.executeQuery("SELECT * FROM finfo");
         while(rs1.next()) {
         int num=rs1.getInt(1);
         String num2=rs1.getString(12);
         if(id1==num)
          {
            if(num2.equals("old"))
            {
               flag1=1;
               break;
            }
          }
          
         }
}
if(flag==0)
{
       response.sendRedirect("faclogfail.html");
}

if(flag1==0)
{
   response.sendRedirect("addf.html");  
}

if(flag1==1)
{
   response.sendRedirect("facfunc.html"); 
}  
}
con.close();
%>
