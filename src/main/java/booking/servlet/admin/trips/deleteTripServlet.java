package booking.servlet.admin.trips;

import booking.Service.TripsService;
import booking.beans.Trips;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "deleteTrip", value = "/admin/tripsManage/deleteTrip")
public class deleteTripServlet extends HttpServlet {
    private final TripsService tripsService = new TripsService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        Optional<Trips> tripFromServer = tripsService.getById(id);
        if (tripFromServer.isPresent()) {
            tripsService.delete(tripFromServer.get().getId());
            resp.sendRedirect("tripsManage");
        }
    }
}
