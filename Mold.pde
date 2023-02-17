private final ParentNode root = new ParentNode(250, 250, 7, true);

public void setup() {
    size(500, 500);
    frameRate(10);
}

public void draw() {
    background(255);
    root.tick();
    root.show();
}