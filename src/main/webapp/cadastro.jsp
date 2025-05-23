<%@page import="controles.ClienteControler"%>
<%@page import="dao.ClienteDao"%>
<%@page import="modelos.Cliente"%>

<%
   String nome = request.getParameter("nome");
   String email = request.getParameter("email");
   String fone = request.getParameter("fone");
   
   Cliente cliente = new Cliente();
   cliente.setNome(nome);
   cliente.setEmail(email);
   cliente.setFone(fone);
   
  // ClienteDao clidao = new ClienteDao();
   //ClienteControler cliControler = new ClienteControler(clidao);
   ClienteControler cliControler = new ClienteControler();
   cliControler.salvar(cliente);
   response.sendRedirect("consulta.jsp");
%>
