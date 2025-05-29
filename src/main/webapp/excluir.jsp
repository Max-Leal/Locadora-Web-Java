<%@page import="dao.ClienteDao"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
ClienteDao.excluir(id);
response.sendRedirect("./consulta.jsp");
%>
