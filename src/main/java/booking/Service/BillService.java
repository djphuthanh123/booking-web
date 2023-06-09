package booking.Service;

import booking.beans.Bill;
import booking.dao.BillDAO;

public class BillService  extends Service<Bill, BillDAO> implements BillDAO{
    public BillService() {
        super(BillDAO.class);
    }

    @Override
    public int count() {
        return jdbi.withExtension(BillDAO.class,BillDAO::count);
    }
}
