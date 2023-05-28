package booking.servlet.admin.user;

import booking.Service.UserService;
import booking.beans.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "userManager",value = "/admin/userManager")
public class userManagerServlet extends HttpServlet {
    private final UserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userFromServer = userService.getAll();
        req.setAttribute("users",userFromServer);
        System.out.println(userFromServer.toString());
        req.getRequestDispatcher("/WEB-INF/views/userManagerView.jsp").forward(req,resp);
    }
}
