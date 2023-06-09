package booking.servlet.admin.trips;

import booking.Service.TripsService;
import booking.beans.Trips;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "tripsManage", value = "/admin/tripsManage")
public class tripsManager extends HttpServlet {
    private final TripsService tripsService = new TripsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Trips> tripsList = tripsService.getAll();
        req.setAttribute("tripsList", tripsList);
        req.getRequestDispatcher("/WEB-INF/views/tripsManagerView.jsp").forward(req,resp);
    }
}
