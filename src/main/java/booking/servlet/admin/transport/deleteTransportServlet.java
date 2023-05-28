package booking.servlet.admin.transport;

import booking.Service.TransportService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet(name = "deleteTransport", value = "/admin/transportManager/delete")
public class deleteTransportServlet extends HttpServlet {
    private final TransportService transportService= new TransportService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        transportService.delete(id);
        resp.sendRedirect(req.getContextPath()+"/admin/transportManager");
    }


}
