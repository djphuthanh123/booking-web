package booking.beans;

import java.time.LocalDateTime;
import java.util.StringJoiner;

public class Bill {
    private long id;
    private String tripName;
    private double price;
    private int statusPay;
    private int seatNumber;

    private LocalDateTime createAt;

    private long seatID;
    private long userID;


    public Bill() {
    }

    public Bill(long id, String tripName, double price, int statusPay,int seatNumber ,LocalDateTime createAt , long seatID, long userID) {
        this.id = id;
        this.tripName = tripName;
        this.price = price;
        this.statusPay = statusPay;
        this.seatNumber = seatNumber;
        this.createAt = createAt;
        this.seatID = seatID;
        this.userID = userID;
    }

    public Bill(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTripName() {
        return tripName;
    }

    public void setTripName(String tripName) {
        this.tripName = tripName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatusPay() {
        return statusPay;
    }

    public void setStatusPay(int statusPay) {
        this.statusPay = statusPay;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public long getSeatID() {
        return seatID;
    }

    public void setSeatID(long seatID) {
        this.seatID = seatID;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String toString() {
        return new StringJoiner(",",Bill.class.getSimpleName()+"[","]")
                .add("id= "+ id)
                .add("tripName= " + tripName)
                .add("price= " + price)
                .add("statusPay= " + statusPay)
                .add("seatNumber= " + seatNumber)
                .add("createAt= " + createAt)
                .add("seatID= " + seatID)
                .add("userId= " + userID)
                .toString();
    }
}
