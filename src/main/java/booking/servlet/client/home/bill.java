package booking.servlet.client.home;

import java.time.LocalDate;

import booking.Service.BillService;
import booking.Service.SeatService;
import booking.Service.TripsService;
import booking.beans.Bill;
import booking.beans.Seat;
import booking.beans.Trips;
import booking.beans.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "billServlet", value = "/client/home/billServlet")

public class bill  extends HttpServlet {

    private final TripsService tripsService = new TripsService();
    private final SeatService seatService = new SeatService();
    private final BillService billService = new BillService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Seat> listSeatFromServer= seatService.getAll();

        List<Seat> listSeat = new ArrayList<>();
        Bill bill = new Bill();
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        LocalDate currentDate = LocalDate.now();

        // Check dk trip for who? and date current to future
        for(Seat s: listSeatFromServer){
            if(s.getUserId()==user.getId() ){
                long tripId = s.getTripsId();
                Optional<Trips> tripFromServer = tripsService.getById(tripId);
                if(tripFromServer.get().getDepartureDate().isAfter(currentDate)
                        || tripFromServer.get().getDepartureDate().equals(currentDate)){
                    listSeat.add(s);
                }
            }
        }
        //ADD to bill
        LocalDateTime currentDateTime = LocalDateTime.now();


        if(listSeat.size() <= 1){
            long tripId = listSeat.get(0).getTripsId();
            Optional<Trips> tripFromServer = tripsService.getById(tripId);
            bill.setTripName( tripFromServer.get().getTripName());
            bill.setPrice(tripFromServer.get().getPrice());
            bill.setStatusPay(0); // 0 is not yet pay  <> 1 is pay
            bill.setSeatNumber(listSeat.get(0).getSeatNumber());
            bill.setCreateAt(currentDateTime);
            bill.setSeatID(listSeat.get(0).getId());
            bill.setUserID(user.getId());
            billService.insert(bill);
        }else{
            long tripId = listSeat.get(listSeat.size()-1).getTripsId();
            Optional<Trips> tripFromServer = tripsService.getById(tripId);
            bill.setTripName( tripFromServer.get().getTripName());
            bill.setPrice(tripFromServer.get().getPrice());
            bill.setStatusPay(0); // 0 is not yet pay  <> 1 is pay
            bill.setSeatNumber(listSeat.get(listSeat.size()-1).getSeatNumber());
            bill.setCreateAt(currentDateTime);
            bill.setSeatID(listSeat.get(listSeat.size()-1).getId());
            bill.setUserID(user.getId());
            billService.insert(bill);
        }
        //Validation later
        resp.sendRedirect("storageCart");
    }
}
