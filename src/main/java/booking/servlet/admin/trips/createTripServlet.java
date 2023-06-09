package booking.servlet.admin.trips;

import booking.Service.RouteService;
import booking.Service.TransportService;
import booking.Service.TripsService;
import booking.Utils.Validator;
import booking.beans.Route;
import booking.beans.Transport;
import booking.beans.Trips;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "createTrip", value = "/admin/tripsManager/create")
public class createTripServlet extends HttpServlet {
    private final TripsService tripsService = new TripsService();
    private final TransportService transportService = new TransportService();
    private final RouteService routeService = new RouteService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Transport> transportFromServer = transportService.getAll();
        List<Route> routeFromServer = routeService.getAll();

        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        req.setAttribute("currentDate",formattedDate );



        req.setAttribute("transportFromServer",transportFromServer);
        req.setAttribute("routeFromServer",routeFromServer);
        req.getRequestDispatcher("/WEB-INF/views/tripsCreateView.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Trips trips = new Trips();
        List<Transport> transportFromServer = transportService.getAll();
        List<Route> routeFromServer = routeService.getAll();
        //get Route ID and transport ID
        trips.setTransportId(Integer.parseInt(req.getParameter("nameTransport")));
        trips.setRoutesId(Integer.parseInt(req.getParameter("routeName")));
        //get nameTransport and Trips Transport
        for(Transport transport:  transportFromServer){
            if(transport.getId() == (trips.getTransportId())) {
                trips.setTransportName(transport.getNameOfTransport());
            }
        }
        for(Route route:  routeFromServer){
            if(route.getId() == (trips.getRoutesId())) {
                trips.setTripName(route.getName());
            }
        }
        trips.setDepartureTime(req.getParameter("departureTime"));
        trips.setDepartureEndInFuture(req.getParameter("departureEndTime"));
        trips.setPrice(Double.parseDouble(req.getParameter("price")));

        //set Date
        String dateStart = req.getParameter("dateStart");
        String dateEnd = req.getParameter("dateEnd");

        // Parse the date string into a LocalDate object
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate dateDeparture = LocalDate.parse(dateStart, formatter);
        LocalDate dateEndDeparture = LocalDate.parse(dateEnd, formatter);
        trips.setDepartureDate(dateDeparture);
        trips.setDepartureEndDate(dateEndDeparture);
        //end set Date
        // set slot
        int slotAvailable = 0;
        for(Transport transport:  transportFromServer){
            if(transport.getId() == (trips.getTransportId())) {
                slotAvailable = transport.getSlot();
            }
        }
        trips.setSlotAvailable(slotAvailable);
        // set end slot
        System.out.println(trips);

        Map<String, List<String>> violations = new HashMap<>();
        violations.put("departureTime", Validator.of(trips.getTransportName())
                .toList());
        violations.put("departureEndTime",Validator.of(trips.getTripName())
                .toList());
        violations.put("price",Validator.of(trips.getTripName())
                .toList());

        int sumOfViolation = violations.values().stream().mapToInt(List::size).sum();

        if (sumOfViolation == 0){
            tripsService.insert(trips);
            req.getRequestDispatcher("/WEB-INF/views/tripsCreateView.jsp").forward(req,resp);
        }else {
            req.setAttribute("violations", violations);
            req.getRequestDispatcher("/WEB-INF/views/tripsCreateView.jsp").forward(req,resp);
        }
    }
}
