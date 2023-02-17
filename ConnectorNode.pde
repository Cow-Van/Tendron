public class ConnectorNode implements Node {
    private final Node child;
    private final float startX;
    private final float startY;
    private final float endX;
    private final float endY

    public ConnectorNode(float startX, float startY, float direction, float maxDeviation, float length, int nodesLeft) {
        // TODO
        
        if (nodesLeft < 1) {
            child = new ParentNode(endX, endY, 7);
        }
    }

    public void tick() {

    }

    public void show() {
        line(startX, startY, endX, endY);
    }
}