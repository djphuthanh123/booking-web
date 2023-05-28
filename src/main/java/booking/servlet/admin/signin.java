package booking.servlet.admin;

import booking.Service.UserService;
import booking.Utils.Validator;
import booking.beans.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "SigninServlet", value = "/admin/signin")
public class signin extends HttpServlet {
    private final UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/signinAdminView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> values = new HashMap<>();
        values.put("username", request.getParameter("username"));
        values.put("password", request.getParameter("password"));
        Map<String, List<String>> violations = new HashMap<>();
        Optional<User> userFromServer = userService.getByUsername(values.get("username"));
        violations.put("usernameViolations", Validator.of(values.get("username"))
                .isNotNullAndEmpty()
                .isNotBlankAtBothEnds()
                .isExistent(userFromServer.isPresent(), "Tên đăng nhập")
                .toList());
        violations.put("passwordViolations", Validator.of(values.get("password"))
                .isNotNullAndEmpty()
                .isNotBlankAtBothEnds()
                .isAtMostOfLength(1)
                .isEqualTo(userFromServer.map(User::getPassword).orElse(""), "Mật khẩu")
                .toList());
        System.out.println(Optional.of(userFromServer));
        int sumOfViolations = violations.values().stream().mapToInt(List::size).sum();
        if (sumOfViolations == 0 && userFromServer.isPresent()) {
            User user = userFromServer.get();
            if (Arrays.asList("ADMIN", "EMPLOYEE").contains(user.getRole())) {
                request.getSession().setAttribute("currentUser", user);
                response.sendRedirect("http://localhost:8080/demo1_war_exploded/index.jsp");
            }
        } else {
            request.setAttribute("values", values);
            request.setAttribute("violations", violations);
            request.getRequestDispatcher("/WEB-INF/views/signinAdminView.jsp").forward(request, response);
        }
    }
}
