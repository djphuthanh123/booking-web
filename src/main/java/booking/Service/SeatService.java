package booking.Service;

import booking.beans.Seat;
import booking.dao.SeatDAO;

public class SeatService extends Service<Seat, SeatDAO> implements SeatDAO {
    public SeatService() {
        super(SeatDAO.class);
    }


    @Override
    public int count() {
        return jdbi.withExtension(SeatDAO.class,SeatDAO::count);
    }
}
