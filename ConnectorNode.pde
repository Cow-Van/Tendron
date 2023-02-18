public class ConnectorNode implements Node {
    private final float startX;
    private final float startY;
    private final float endX;
    private final float endY;
    private final float direction;
    private final float maxDeviation;
    private final float length;
    private final int nodesLeft;
    private final int currentDepth;

    private Node child = null;

    public ConnectorNode(float startX, float startY, float direction, float maxDeviation, float length, int nodesLeft, int currentDepth) {
        this.startX = startX;
        this.startY = startY;
        
        float newDirection = direction + random(maxDeviation) - (maxDeviation / 2);

        this.endX = startX + (sin(newDirection) * length);
        this.endY = startY - (cos(newDirection) * length);

        this.direction = direction;
        this.maxDeviation = maxDeviation;
        this.length = length;
        this.nodesLeft = nodesLeft;
        this.currentDepth = currentDepth;
    }

    public void tick() {
        if (child == null) {
            createChild();
        } else {
            child.tick();
        }
    }

    public void show() {
        line(startX, startY, endX, endY);
        
        if (child != null) {
            child.show();
        }
    }

    private void createChild() {
        if (nodesLeft < 1) {
            child = new ParentNode(endX, endY, 10, NODES_PER_PARENT, currentDepth, direction, PARENT_MAX_DEVIATION);
        } else {
            child = new ConnectorNode(endX, endY, direction, maxDeviation, length, nodesLeft - 1, currentDepth);
        }
    }
}