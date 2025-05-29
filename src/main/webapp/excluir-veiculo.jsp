<%@page import="dao.VeiculoDao"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
VeiculoDao.excluir(id);
response.sendRedirect("./consulta-veiculo.jsp");
%>
