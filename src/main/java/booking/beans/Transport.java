package booking.beans;

import java.util.StringJoiner;

public class Transport {
    private long id;
    private String nameOfTransport;
    private String imageName;
    private String licensePlate;
    private String description;
    private int slot;


    public Transport() {
    }

    public Transport(long id,
                     String nameOfTransport,
                     String imageName,
                     String licensePlate,
                     String description,
                     int slot) {
        this.id = id;
        this.nameOfTransport = nameOfTransport;
        this.imageName = imageName;
        this.licensePlate = licensePlate;
        this.description = description;
        this.slot = slot;
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

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    @Override
    public String toString() {
        return new StringJoiner(",",Transport.class.getSimpleName()+"[","]")
                .add("id= "+ id)
                .add("nameOfTransport= " + nameOfTransport)
                .add("image= " + imageName)
                .add("licensePlate= " + licensePlate)
                .add("description= " + description)
                .add("slot= " +slot).toString();
    }
}
