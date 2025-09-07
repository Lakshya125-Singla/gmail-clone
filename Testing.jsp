<form action="Testing.jsp">
<input type='checkbox'   name='check'  />
<input type="submit" value="submit"  name="submit">
</form>
<%
if(request.getParameter("submit")!=null){
String nm=request.getParameter("check");
 out.println(nm);
}
 %>