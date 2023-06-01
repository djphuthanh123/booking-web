package booking.beans;

import org.jetbrains.annotations.Nullable;

import java.time.LocalDateTime;
import java.util.StringJoiner;

public class Transport {
    private long id;
    private String nameOfTransport;
    private String brand;
    private String description;
    private int totalSeat;
    private String imageName;
    private LocalDateTime createAt;

    public Transport() {
    }

    public Transport(long id,
                     String nameOfTransport,
                     String brand,
                     String description,
                     int totalSeat,
                     String imageName,
                     LocalDateTime createAt) {
        this.id = id;
        this.nameOfTransport = nameOfTransport;
        this.brand = brand;
        this.description = description;
        this.totalSeat = totalSeat;
        this.imageName = imageName;
        this.createAt = createAt;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNameOfTransport() {
        return nameOfTransport;
    }

    public void setNameOfTransport(String nameOfTransport) {
        this.nameOfTransport = nameOfTransport;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTotalSeat() {
        return totalSeat;
    }

    public void setTotalSeat(int totalSeat) {
        this.totalSeat = totalSeat;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }
    @Nullable
    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }


    @Override
    public String toString() {
        return new StringJoiner(",",Transport.class.getSimpleName()+"[","]")
                .add("id= "+ id)
                .add("nameOfTransport= " + nameOfTransport)
                .add("brand= " + brand)
                .add("description= " + description)
                .add("imageName= "+imageName)
                .add("totalSeat= " + totalSeat)
                .add("createAt= " +createAt).toString();
    }
}
