package booking.beans;

import java.util.StringJoiner;

public class Seat {
    private long id;
    private long tripsId;
    private int seatNumber;
    private long userId;

    public Seat() {
    }

    public Seat(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getTripsId() {
        return tripsId;
    }

    public void setTripsId(long tripsId) {
        this.tripsId = tripsId;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String toString() {
        return new StringJoiner(",",Seat.class.getSimpleName()+"[","]")
                .add("id= "+ id)
                .add("tripsId= " + tripsId)
                .add("seatNumber= " + seatNumber)
                .add("userId= " + userId)
                .toString();
    }
}
