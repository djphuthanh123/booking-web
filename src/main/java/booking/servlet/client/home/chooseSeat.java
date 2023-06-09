package booking.servlet.client.home;


import booking.Service.SeatService;
import booking.Service.TransportService;
import booking.Service.TripsService;
import booking.Utils.Validator;
import booking.beans.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "chooseSeat", value = "/client/home/chooseSeat")

public class chooseSeat extends HttpServlet {

    private final TripsService tripsService = new TripsService();
    private final TransportService transportService = new TransportService();
    private final SeatService seatService = new SeatService();
//    private final BillService billService = new BillService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        Optional<Trips> tripFromServer = tripsService.getById(id);
        String tripName = tripFromServer.get().getTripName();

        List<Transport> transportFromServer = transportService.getAll();
        //get Seat
        List<Seat> seatFromServer = seatService.getAll();
        List<Integer> listSeatNumber = new ArrayList<>();

        for(Seat seat: seatFromServer){
            if(seat.getTripsId() == id){
            listSeatNumber.add(seat.getSeatNumber());
            }
        }
        req.setAttribute("listSeatNumber", listSeatNumber);
        req.setAttribute("tripId", id);


        for(Transport transport: transportFromServer) {
            if(transport.getId() == tripFromServer.get().getTransportId()){
                req.setAttribute("transport", transport);
            }
        }

        req.setAttribute("tripName", tripName);
        req.getRequestDispatcher("/WEB-INF/views/chooseSeat.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Bill bill = new Bill();
        Seat seat = new Seat();
        //SET Seat data
        seat.setSeatNumber(Integer.parseInt(req.getParameter("seatNumber")));
        seat.setTripsId( Long.parseLong(req.getParameter("tripId")));
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");
        seat.setUserId( user.getId());

//        Optional<Trips> tripFromServer = tripsService.getById(seat.getTripsId());
//        //SET bill data
//        bill.setTripName(tripFromServer.get().getTripName());
//        bill.setPrice(tripFromServer.get().getPrice());
//        bill.setStatusPay(0);
//        bill.setSeatID(seat.getId());
//        bill.setUserID(user.getId());
//        System.out.println(seat);
        //Validation
        Map<String, List<String>> violations = new HashMap<>();
        violations.put("seatNumber", Validator.of(seat.getSeatNumber())
                .toList());
        violations.put("tripId",Validator.of(seat.getTripsId())
                .toList());

        int sumOfViolation = violations.values().stream().mapToInt(List::size).sum();

        if (sumOfViolation == 0){
            seatService.insert(seat);
//            billService.insert(bill);
            resp.sendRedirect("billServlet");
//            req.getRequestDispatcher("/WEB-INF/views/billView.jsp").forward(req,resp);
        }else {
            req.setAttribute("violations", violations);
            req.getRequestDispatcher("/WEB-INF/views/admin401View.jsp").forward(req,resp);
        }

    }
}
