<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="es.uco.pw.data.DAO.gestionDao"%>
<%@page import="es.uco.pw.data.DAO.gestionNoticiasDao"%>
<%@page import="es.uco.pw.display.beans.gestionBean"%>
<%@page import="es.uco.pw.display.beans.customerBean"%> 
<%@page import="es.uco.pw.display.beans.gestionNoticiasBean"%> 
<%@page import="java.util.ArrayList"%>   
<%@page import="java.util.List"%>    

<%
 	String nextPage = "../vistas/errorpage.jsp";
	String jdbURL = getServletContext().getInitParameter("jdbURL");
	String jdbUsername = getServletContext().getInitParameter("jdbUsername");
	String jdbPassword = getServletContext().getInitParameter("jdbPassword");
try {
		gestionDao gestionDao = new gestionDao(jdbURL, jdbUsername, jdbPassword);
		ArrayList<gestionBean> resultado=gestionDao.getGrupos();
		request.setAttribute("resultado",resultado);
		gestionNoticiasDao gestionNoticiasDao = new gestionNoticiasDao(jdbURL, jdbUsername, jdbPassword);
		ArrayList<gestionNoticiasBean> resultNoticias=gestionNoticiasDao.getNoticias();
		request.setAttribute("result",resultNoticias);
		System.out.println("Noticias Controller: " + resultNoticias.size());
	}

catch (Exception e) {
			// TODO: handle exception
	}

//"Eliminar es el name dado en la Vista para el div"
String eliminar = request.getParameter("eliminar");
if(eliminar != null){
	gestionDao gestionDao = new gestionDao(jdbURL, jdbUsername, jdbPassword);
	gestionDao.borrarGrupo(eliminar);
	//Lo hemos borrado, pero hay que actualizar la página.
	ArrayList<gestionBean> resultado=gestionDao.getGrupos();
	request.setAttribute("resultado",resultado);
}

String eliminarNoticias = request.getParameter("delet");
if(eliminarNoticias != null){
	gestionNoticiasDao gestionNoticiasDao = new gestionNoticiasDao(jdbURL, jdbUsername, jdbPassword);
	gestionNoticiasDao.borrarNoticia(eliminarNoticias);
	//Lo hemos borrado, pero hay que actualizar la página.
	ArrayList<gestionNoticiasBean> resultNoticias=gestionNoticiasDao.getNoticias();
	request.setAttribute("result",resultNoticias);
}

%>
<jsp:forward page="../vistas/gestionView.jsp" />