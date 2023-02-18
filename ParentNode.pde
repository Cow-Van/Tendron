public class ParentNode implements Node {
    private final ArrayList<ConnectorNode> children = new ArrayList();
    
    private final float x;
    private final float y;
    private final float size;
    private final boolean root;

    private color c;

    public ParentNode(float x, float y, float size, int childrenCount, int currentDepth, float direction, float maxDeviation, color c) {
        this(x, y, size, childrenCount, currentDepth, direction, maxDeviation, c, false);
    }

    public ParentNode(float x, float y, float size, int childrenCount, int currentDepth, float direction, float maxDeviation, color c, boolean root) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.root = root;

        this.c = c;

        if (currentDepth <= 3) {
            for (int i = 0; i < childrenCount; i++) {
                float childDirection = direction - maxDeviation / 2 + i * (maxDeviation) / childrenCount;
                float childX = x + sin(childDirection) * size / 2;
                float childY = y - cos(childDirection) * size / 2;
                children.add(new ConnectorNode(childX, childY, childDirection, TWO_PI / childrenCount, 20, 5, currentDepth + 1, color(random(255), random(255), random(255))));
            }
        }
    }

    public void tick() {
        for (int i = 0; i < children.size(); i++) {
            children.get(i).tick();
        }
    }

    public void show() {
        fill(c);
        ellipse(x, y, size, size);
        
        for (int i = 0; i < children.size(); i++) {
            children.get(i).show();
            children.get(i).setColor(c);
        }
    }

    public void setColor(color c) {
        this.c = c;
    }
}