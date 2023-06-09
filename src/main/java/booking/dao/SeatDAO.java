package booking.dao;

import booking.beans.Seat;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.customizer.Define;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;
import java.util.Optional;

@RegisterBeanMapper(Seat.class)
public interface SeatDAO extends DAO<Seat>{

    @Override
    @SqlUpdate("INSERT INTO seat (id, tripsId, seatNumber, userId) " +
            "VALUES (default, :tripsId, :seatNumber, :userId)")
    @GetGeneratedKeys("id")
    long insert(@BindBean Seat seat);

    @Override
    @SqlUpdate("")
    void update(@BindBean Seat seat);

    @Override
    @SqlUpdate("DELETE FROM seat WHERE id = :id")
    void delete(@Bind("id") long id);

    @Override
    @SqlQuery("SELECT * FROM seat WHERE id = :id")
    Optional<Seat> getById(@Bind("id") long id);

    @Override
    @SqlQuery("SELECT * FROM seat;")
    List<Seat> getAll();

    @Override
    @SqlQuery("SELECT * FROM seat LIMIT :limit OFFSET :offset")
    List<Seat> getPart(@Bind("limit") int limit, @Bind("offset") int offset);

    @Override
    @SqlQuery("SELECT * FROM Cities ORDER BY <orderBy> <orderDir> LIMIT :limit OFFSET :offset")
    List<Seat> getOrderedPart(@Bind("limit") int limit, @Bind("offset") int offset,
                              @Define("orderBy") String orderBy, @Define("orderDir") String orderDir);

    @SqlQuery("SELECT COUNT(id) FROM seat")
    int count();
}
