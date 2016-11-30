<%
String name=request.getParameter("uname");
String password=request.getParameter("pwd");
if(name=="" || password=="")
{
	response.sendRedirect("def1.html");
}
else
{
if(name.equals("neha") && password.equals("neha"))
{
	response.sendRedirect("adminfunc.html");
}
else
{
	response.sendRedirect("def.html");
}
}
%>