package freemarker.examples.jsp;

public class SimpleBean {
    private static String[] arr = {"a", "b", "c", "d"};
    private String theString = "Hello from " + toString();

    public String getString() {
        return theString;
    }

    public void setString(String foo) {
        theString = foo;
    }

    public String[] getArray() {
        return arr;
    }
}
