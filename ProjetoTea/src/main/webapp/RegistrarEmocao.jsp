<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelos.FolderSentimento"%>
<%@ page import="Controler.SentimentoController"%>
<!DOCTYPE html>
<html>
<%
	String emocao = request.getParameter("emocao");
	FolderSentimento sent = new FolderSentimento();
	sent.setFkUsuarioId(Integer.parseInt(session.getAttribute("Idusuario").toString()));
	sent.setTipoEmocao(emocao);
%>
</html>