package booking.servlet.client.listRoute;

import booking.Service.RouteService;
import booking.Service.TripsService;
import booking.beans.Route;
import booking.beans.Trips;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "listRoute", value = "/client/listRoute")

public class listRoute extends HttpServlet {
    private final TripsService tripsService = new TripsService();
    private final RouteService routeService = new RouteService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Trips> tripsFromServer = tripsService.getAll();
        List<Route> routesFromServer = routeService.getAll();
        List<Trips> listTrips = new ArrayList<>();

        // neu nhan vo 2 ID
        // chay trong route route 4 thoa man
        int startPoint = Integer.parseInt(req.getParameter("startPoint"));
        int endPoint = Integer.parseInt(req.getParameter("endPoint"));

        String tripName = "";

        for(Route route: routesFromServer){
            if(route.getPickUpPoint()==startPoint && route.getDropOffPoint() == endPoint){
                tripName = route.getName();
            }
        }
        //get Date
        String dateStart = req.getParameter("dateStart");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateDeparture = LocalDate.parse(dateStart, formatter);
        // Check đk inorder to create new List TRIP
        for(Trips trip: tripsFromServer){
            if(trip.getTripName().equals(tripName) && trip.getDepartureDate().equals(dateDeparture)){
                listTrips.add(trip);
            }
        }
        req.setAttribute("listTrips", listTrips);
        req.getRequestDispatcher("/WEB-INF/views/listTrips.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        

        req.getRequestDispatcher("/WEB-INF/views/admin401View.jsp").forward(req,resp);
    }
}
