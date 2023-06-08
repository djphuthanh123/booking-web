package booking.servlet.client.home;

import booking.Service.CitiesService;
import booking.Service.TripsService;
import booking.beans.Cities;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "home", value = "/client/home")

public class Home extends HttpServlet {
    private final CitiesService citiesService = new CitiesService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cities> listCities = citiesService.getAll();

        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        req.setAttribute("currentDate",formattedDate );

        req.setAttribute("listCities",listCities);
        req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req,resp);
    }

}
