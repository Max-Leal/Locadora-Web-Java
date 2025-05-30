<%@page import="dao.LocacaoDao"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
LocacaoDao.excluir(id);
response.sendRedirect("./consulta-locacao.jsp");
%>
