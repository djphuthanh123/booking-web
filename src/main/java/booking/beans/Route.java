    package booking.beans;

    import java.util.StringJoiner;

    public class Route {
        private long id;
            private String name;
                private long pickUpPoint;
                    private long dropOffPoint;
                        private double distance;

        public Route(long id,
                     String name,
                     long pickUpPoint,
                     long dropOffPoint,
                     double distance) {
            this.id = id;
            this.name = name;
            this.pickUpPoint = pickUpPoint;
            this.dropOffPoint = dropOffPoint;
            this.distance = distance;
        }

        public Route() {
        }

        public long getId() {
            return id;
        }

        public void setId(long id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public long getPickUpPoint() {
            return pickUpPoint;
        }

        public void setPickUpPoint(long pickUpPoint) {
            this.pickUpPoint = pickUpPoint;
        }

        public long getDropOffPoint() {
            return dropOffPoint;
        }

        public void setDropOffPoint(long dropOffPoint) {
            this.dropOffPoint = dropOffPoint;
        }

        public double getDistance() {
            return distance;
        }

        public void setDistance(double distance) {
            this.distance = distance;
        }

        @Override
        public String toString() {
            return new StringJoiner(",",Route.class.getSimpleName()+"[","]")
                    .add("id= "+ id)
                    .add("name= "+ name)
                    .add("pickUpPoint= " + pickUpPoint)
                    .add("dropOffPoint= " + dropOffPoint)
                    .add("distance= " + distance).toString();
        }
    }
