package booking.Service;

import booking.beans.Transport;
import booking.dao.TransportDAO;

import java.util.List;


public class TransportService extends Service<Transport, TransportDAO> implements TransportDAO {
    public TransportService() {
        super(TransportDAO.class);
    }

    @Override
    public int count() {
        return jdbi.withExtension(TransportDAO.class,TransportDAO::count);
    }


}
