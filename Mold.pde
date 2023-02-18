public final int NODES_PER_PARENT = 7;
public final float PARENT_MAX_DEVIATION = TWO_PI / 3;

private final ParentNode root = new ParentNode(500, 500, 10, NODES_PER_PARENT, 0, 0, TWO_PI, true);

public void setup() {
    size(1000, 1000);
    frameRate(5);
}

public void draw() {
    background(255);
    root.tick();
    root.show();
}