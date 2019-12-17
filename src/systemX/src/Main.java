import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        DataBaseManager db = new DataBaseManager();
        Column[] cols = {new Column("id", "INT"), new Column("str", "varchar(255)")};
//        db.addEntity("str", "str", cols, "id");
//        db.addConcept("1", "2","3");
//        db.addDataPoint("1", "2", 1,cols, "id");
        db.addInclude("2", 1, 1);
    }
}
