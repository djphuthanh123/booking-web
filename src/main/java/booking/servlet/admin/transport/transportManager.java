package booking.servlet.admin.transport;

import booking.Service.TransportService;
import booking.beans.Transport;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "transportManager", value = "/admin/transportManager")
public class transportManager extends HttpServlet {
    private final TransportService transportService = new TransportService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Transport> transportList = transportService.getAll();
        req.setAttribute("transportList", transportList);
        req.getRequestDispatcher("/WEB-INF/views/transportManagerView.jsp").forward(req,resp);
    }


}
