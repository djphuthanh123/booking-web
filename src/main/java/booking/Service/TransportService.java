package booking.Service;

import booking.beans.Transport;
import booking.dao.TransportDAO;
import jakarta.servlet.http.HttpServlet;

public class TransportService extends Service<Transport, TransportDAO> implements TransportDAO {
    public TransportService() {
        super(TransportDAO.class);
    }

    @Override
    public int count() {
        return 0;
    }
}
