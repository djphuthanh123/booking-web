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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "createRoute", value = "/admin/routeManager/create")
public class createRouteServlet extends HttpServlet {
    private final RouteService routeService = new RouteService();
    private final CitiesService citiesService = new CitiesService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cities> cityFromServer = citiesService.getAll();
        System.out.println(cityFromServer.toString());
        req.setAttribute("cityFromServer",cityFromServer);
        req.getRequestDispatcher("/WEB-INF/views/routeCreateView.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Route route = new Route();
        route.setName(req.getParameter("name"));
        route.setPickUpPoint(Long.parseLong(req.getParameter("pickUpPoint")));
        route.setDropOffPoint(Long.parseLong(req.getParameter("dropOffPoint")));

        //------------------------Validation Time !------------------------------------//
        Map<String, List<String>> violations = new HashMap<>();
        violations.put("name",Validator.of(route.getName()).toList());
        violations.put("pickUpPoint",Validator.of(route.getPickUpPoint()).toList());
        violations.put("dropOffPoint",Validator.of(route.getDropOffPoint()).toList());
        int sumOfViolation = violations.values().stream().mapToInt(List::size).sum();
        //------------------------- End -----------------------------------//
        if (sumOfViolation > 0){
            routeService.insert(route);
            req.setAttribute("route", route);
            req.getRequestDispatcher("/WEB-INF/views/routeCreateView.jsp").forward(req,resp);
        }else {
            req.setAttribute("route", route);
            req.setAttribute("violations", violations);
            req.getRequestDispatcher("/WEB-INF/views/routeCreateView.jsp").forward(req,resp);
        }
    }
}
