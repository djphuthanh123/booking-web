package booking.dao;

import booking.beans.Bill;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.customizer.Define;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;
import java.util.Optional;

public interface BillDAO extends DAO<Bill>{
    @Override
    @SqlUpdate("INSERT INTO bill (id, tripName, price, statusPay,seatNumber,createAt, seatId, userId) " +
            "VALUES (default, :tripName, :price, :statusPay,:seatNumber,:createAt ,:seatID, :userID)")
    @GetGeneratedKeys("id")
    long insert(@BindBean Bill bill);

    @Override
    @SqlUpdate("")
    void update(@BindBean Bill bill);

    @Override
    @SqlUpdate("DELETE FROM bill WHERE id = :id")
    void delete(@Bind("id") long id);

    @Override
    @SqlQuery("SELECT * FROM bill WHERE id = :id")
    Optional<Bill> getById(@Bind("id") long id);

    @Override
    @SqlQuery("SELECT * FROM bill;")
    List<Bill> getAll();

    @Override
    @SqlQuery("SELECT * FROM bill LIMIT :limit OFFSET :offset")
    List<Bill> getPart(@Bind("limit") int limit, @Bind("offset") int offset);

    @Override
    @SqlQuery("SELECT * FROM bill ORDER BY <orderBy> <orderDir> LIMIT :limit OFFSET :offset")
    List<Bill> getOrderedPart(@Bind("limit") int limit, @Bind("offset") int offset,
                              @Define("orderBy") String orderBy, @Define("orderDir") String orderDir);

    @SqlQuery("SELECT COUNT(id) FROM bill")
    int count();
}
