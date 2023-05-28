package booking.dao;

import booking.beans.Transport;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.customizer.Define;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;
import java.util.Optional;
@RegisterBeanMapper(Transport.class)
public interface TransportDAO extends DAO<Transport> {
    @SqlUpdate("INSERT INTO transport (id, nameOfTransport, brand, imageName, description, createAt, totalSeat)  " +
            "VALUES (default, :nameOfTransport, :brand, :imageName, :description, :createAt, :totalSeat)")
    @GetGeneratedKeys("id")
    long insert(@BindBean Transport transport);

    @Override
    @SqlUpdate("UPDATE transport SET nameOfTransport = :nameOfTransport, " +
            "brand = :brand, imageName = :imageName, " +
            "description = :description, " +
            "createAt = :createAt, " +
            "totalSeat = :totalSeat " +
            "WHERE (id = :id) ")
    void update(@BindBean Transport transport);

    @Override
    @SqlUpdate("DELETE FROM transport WHERE id = :id")
    void delete(@Bind("id") long id);

    @Override
    @SqlQuery("SELECT * FROM Transport WHERE id = :id")
    Optional<Transport> getById(@Bind("id") long id);

    @Override
    @SqlQuery("SELECT * FROM Transport")
    List<Transport> getAll();

    @Override
    @SqlQuery("SELECT * FROM Transport LIMIT :limit OFFSET :offset")
    List<Transport> getPart(@Bind("limit") int limit, @Bind("offset") int offset);

    @Override
    @SqlQuery("SELECT * FROM Transport ORDER BY <orderBy> <orderDir> LIMIT :limit OFFSET :offset")
    List<Transport> getOrderedPart(@Bind("limit") int limit, @Bind("offset") int offset,
                                   @Define("orderBy") String orderBy, @Define("orderDir") String orderDir);

    //    @SqlQuery("SELECT c.* FROM product_category pc JOIN category c ON pc.categoryId = c.id WHERE productId = :productId")
//    Optional<Transport> getByTripsId(@Bind("productId") long productId);
//
    @SqlQuery("SELECT COUNT(id) FROM Transport")
    int count();
}
