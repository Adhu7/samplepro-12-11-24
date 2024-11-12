<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.ArtDao" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>
<%
    String artId = request.getParameter("art-id");
    String artPrice = request.getParameter("art-price");

    if (artId != null && artPrice != null) {
        ArtDao artDao = new ArtDao();
        boolean isUpdated = artDao.updateArtPrice(Integer.parseInt(artId), Double.parseDouble(artPrice));

        if (isUpdated) {
            response.sendRedirect("artworkManage.jsp?success=Price updated successfully");
        } else {
            out.println("Error updating price. Please try again.");
        }
    } else {
        out.println("Invalid input.");
    }
%>
