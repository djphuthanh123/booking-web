package booking.servlet.client.home;

import booking.Service.BillService;
import booking.beans.Bill;
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

@WebServlet(name = "storageCart", value = "/client/home/storageCart")
public class storageCart extends HttpServlet {
    private final BillService billService = new BillService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Bill> listBillFromServer = billService.getAll();
        List<Bill> listBill = new ArrayList<>();


        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");
        //        if(IsAdmin)
        for(Bill bill: listBillFromServer){
            if(bill.getUserID() == user.getId()){
                listBill.add(bill);
            }
        }
        //end here lam sau doi co user da
        LocalDateTime currentDateTime = LocalDateTime.now();

//        if(user)
//        for(Bill bill: listBillFromServer){
//            if(bill.getUserID() == user.getId() && bill.getCreateAt().equals(currentDateTime)){
//                listBill.add(bill);
//            }
//        }

        double totalBill = billService.count();
        int totalMoney = 0;
        for(Bill bill: listBill){
            totalMoney+=bill.getPrice();
        }

        req.setAttribute("totalBill", totalBill);
        req.setAttribute("totalMoney", totalMoney);
        req.setAttribute("listBill",listBill);

        req.getRequestDispatcher("/WEB-INF/views/billView.jsp").forward(req,resp);
    }
}
