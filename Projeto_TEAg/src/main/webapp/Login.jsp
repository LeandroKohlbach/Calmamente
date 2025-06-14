<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="modelos.Usuario, Dao.DaoUsuario" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<%
// Coleta os parâmetros do formulário de login
String email = request.getParameter("email");
String senha = request.getParameter("senha");


if (email == null || email.trim().isEmpty()) {

    out.println("<script> alert('Erro: O campo Email não pode ser vazio.'); window.location.href='./Login.html'; </script>");
    return; 
}

if (senha == null || senha.trim().isEmpty()) {
   
    out.println("<script> alert('Erro: O campo Senha não pode ser vazio.'); window.location.href='./Login.html'; </script>");
    return; 
}


Usuario usu = DaoUsuario.validarUsuario(email, senha);

if (usu != null) { 
    out.println("<script> alert('Login realizado com sucesso!'); </script>");
    session.setAttribute("usuarioLogado", usu.getNome()); 
    response.sendRedirect("./HomeLogado.jsp");
} else { 
    out.println("<script> alert('Erro: Usuário ou senha inválidos.'); </script>");
    response.sendRedirect("Login.html?erro=1");
}
%>

</body>
</html>