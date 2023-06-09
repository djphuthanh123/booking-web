package booking.beans;

import java.time.LocalDate;
import java.util.StringJoiner;

public class Trips {
    private long id;

    private long routesId;
    private long transportId;
    private String departureTime;
    private String departureEndInFuture;
    private double price;
    private int slotAvailable;
    private LocalDate departureDate;
    private LocalDate departureEndDate;

    private String tripName;
    private String transportName;

    public Trips() {
    }


    public Trips(long id,
                 long routesId,
                 long transportId,
                 String departureTime,
                 String departureEndInFuture,
                 double price,
                 int slotAvailable,
                 LocalDate departureDate,
                 LocalDate departureEndDate,
                 String tripName,
                 String transportName) {
        this.id = id;
        this.routesId = routesId;
        this.transportId = transportId;
        this.departureTime = departureTime;
        this.departureEndInFuture = departureEndInFuture;
        this.price = price;
        this.slotAvailable = slotAvailable;
        this.departureDate = departureDate;
        this.departureEndDate = departureEndDate;
        this.tripName = tripName;
        this.transportName = transportName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getRoutesId() {
        return routesId;
    }

    public void setRoutesId(long routesId) {
        this.routesId = routesId;
    }

    public long getTransportId() {
        return transportId;
    }

    public void setTransportId(long transportId) {
        this.transportId = transportId;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getDepartureEndInFuture() {
        return departureEndInFuture;
    }

    public void setDepartureEndInFuture(String departureEndInFuture) {
        this.departureEndInFuture = departureEndInFuture;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSlotAvailable() {
        return slotAvailable;
    }

    public void setSlotAvailable(int slotAvailable) {
        this.slotAvailable = slotAvailable;
    }

    public LocalDate getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(LocalDate departureDate) {
        this.departureDate = departureDate;
    }

    public LocalDate getDepartureEndDate() {
        return departureEndDate;
    }

    public void setDepartureEndDate(LocalDate departureEndDate) {
        this.departureEndDate = departureEndDate;
    }

    public String getTripName() {
        return tripName;
    }

    public void setTripName(String tripName) {
        this.tripName = tripName;
    }

    public String getTransportName() {
        return transportName;
    }

    public void setTransportName(String transportName) {
        this.transportName = transportName;
    }

    @Override
    public String toString() {
        return new StringJoiner(",",Trips.class.getSimpleName()+"[","]")
                .add("id= "+ id)
                .add("routesId= " + routesId)
                .add("transportId= " + transportId)
                .add("departureTime= " + departureTime)
                .add("departureEndInFuture= " + departureEndInFuture)
                .add("price= " +price)
                .add("slotAvailable= " +slotAvailable)
                .add("departureDate= " +departureDate)
                .add("departureEndDate= " +departureEndDate)
                .add("tripName= " +tripName)
                .add("transportName= " +transportName)
                .toString();
    }
}
