import java.sql.SQLException;

public interface DataBasesMethods {
    void addEntity(String name, String tableName, Column[] columns, String primaryKeyColumn) throws SQLException, ClassNotFoundException;
    void addConcept(String name, String abbr, String desc) throws SQLException;
    void addDataPoint(String name, String tableName, int entity, Column[] columns, String primaryKeyColumn) throws SQLException;
    void  addInclude(String fieldName, int concept, int dataPoint) throws SQLException;
}
