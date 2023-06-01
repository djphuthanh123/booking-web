package booking.servlet.admin.route;

import booking.Service.CitiesService;
import booking.Service.RouteService;
import booking.Utils.Validator;
import booking.beans.Cities;
import booking.beans.Route;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "managerRoute", value = "/admin/routeManager")
public class routeManager extends HttpServlet {
    private final RouteService routeService = new RouteService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Route> routeFromServer = routeService.getAll();
        req.setAttribute("routeFromServer",routeFromServer);
        req.getRequestDispatcher("/WEB-INF/views/routeManagerView.jsp").forward(req,resp);
    }

}
