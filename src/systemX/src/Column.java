public class Column {
    private static final String columnStatement = "`%s` %s";

    private String name;
    private String type;

    public Column(String name, String type) {
        this.name = name;
        this.type = type;
    }

    public String toString() {
        return String.format(columnStatement, name, type);
    }
}
