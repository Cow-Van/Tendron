public class ParentNode implements Node {
    private final ArrayList<ConnectorNode> children = new ArrayList();
    
    private final float x;
    private final float y;
    private final float size;
    private final boolean root;

    public ParentNode(float x, float y, float size, int childrenCount, int currentDepth, float direction, float maxDeviation) {
        this(x, y, size, childrenCount, currentDepth, direction, maxDeviation, false);
    }

    public ParentNode(float x, float y, float size, int childrenCount, int currentDepth, float direction, float maxDeviation, boolean root) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.root = root;

        if (currentDepth <= 1) {
            for (int i = 0; i < childrenCount; i++) {
                float childDirection = direction - maxDeviation / 2 + i * (maxDeviation) / childrenCount;
                float childX = x + sin(childDirection) * size / 2;
                float childY = y - cos(childDirection) * size / 2;
                children.add(new ConnectorNode(childX, childY, childDirection, TWO_PI / childrenCount, 20, 5, currentDepth + 1));
            }
        }
    }

    public void tick() {
        for (int i = 0; i < children.size(); i++) {
            children.get(i).tick();
        }
    }

    public void show() {
        ellipse(x, y, size, size);
        
        for (int i = 0; i < children.size(); i++) {
            children.get(i).show();
        }
    }
}