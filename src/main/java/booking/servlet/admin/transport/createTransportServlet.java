package booking.servlet.admin.transport;

import booking.Service.TransportService;
import booking.Utils.ImageUD;
import booking.Utils.Validator;
import booking.beans.Transport;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@WebServlet(name = "createTransport", value = "/admin/transportManager/create")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 5, // 5 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class createTransportServlet extends HttpServlet {
    private final TransportService transportService = new TransportService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/transportCreateView.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Transport transport = new Transport();
        transport.setNameOfTransport(req.getParameter("nameOfTransport"));
        transport.setLicensePlate(req.getParameter("licensePlate").isEmpty() ? String.valueOf(111111) :req.getParameter("licensePlate"));
        transport.setDescription(req.getParameter("description").trim());
        transport.setSlot(Integer.parseInt(req.getParameter("slot")));
        Map<String, List<String>> violations = new HashMap<>();
        violations.put("nameOfViolation", Validator.of(transport.getNameOfTransport())
                .isNotNullAndEmpty()
                .isNotBlankAtBothEnds()
                .isAtMostOfLength(100)
                .toList());
        violations.put("description",Validator.of(transport.getDescription())
                .isAtMostOfLength(350)
                .toList());

        int sumOfViolation = violations.values().stream().mapToInt(List::size).sum();
        String successMessage = "Thêm thành công";
        String errorMessage = "Thêm thất bại ";
        if (sumOfViolation == 0){
            ImageUD.upload(req).ifPresent(transport::setImageName);
            try {
                transportService.insert(transport);
                req.setAttribute("successMessage", successMessage);
            }
            catch(Exception e) {
                req.setAttribute("transport", transport);
                req.setAttribute("errorMessage", errorMessage);
            }

            req.getRequestDispatcher("/WEB-INF/views/transportCreateView.jsp").forward(req,resp);
        }else {
            req.setAttribute("transport", transport);
            req.setAttribute("violations", violations);
            req.getRequestDispatcher("/WEB-INF/views/transportCreateView.jsp").forward(req,resp);
        }
    }
}
