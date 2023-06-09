package booking.Service;
import booking.beans.Trips;
import booking.dao.TripsDAO;

public class TripsService extends Service<Trips, TripsDAO> implements TripsDAO {
    public TripsService() {
        super(TripsDAO.class);
    }


    @Override
    public int count() {
        return jdbi.withExtension(TripsDAO.class,TripsDAO::count);
    }
}
