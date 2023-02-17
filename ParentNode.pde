public class ParentNode implements Node {
    private final ArrayList<ConnectorNode> children = new ArrayList();
    
    private final float x;
    private final float y;
    private final int childrenCount;
    private final boolean root;

    public ParentNode(float x, float y, int childrenCount) {
        return new ParentNode(x, y, childrenCount, false);
    }

    public ParentNode(float x, float y, int childrenCount, boolean root) {
        this.x = x;
        this.y = y;
        this.childrenCount = childrenCount;
        this.root = root;
    }

    public void tick() {
        for (int i = 0; i < children.size(); i++) {
            children.get(i).tick();
        }
    }

    public void show() {
        ellipse(x, y, 10, 10);
    }
}