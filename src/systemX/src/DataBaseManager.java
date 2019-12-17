import java.sql.*;

public class DataBaseManager implements DataBasesMethods {

    private static final String createTableStatement = "CREATE TABLE `%s` (%s, %s);";
    private static final String primaryKeyStatement = "PRIMARY KEY (%s)";

    private Connection connection;
    private Statement stmt;

    public DataBaseManager() throws ClassNotFoundException, SQLException {
        // String driverName = "com.jnetdirect.jsql.JSQLDriver";
        Class.forName("com.mysql.cj.jdbc.Driver");

        //String serverName = "data_management_system";
        String portNumber = "3358";
        String mydatabase = "127.0.0.1" + ":" + portNumber + "/data_management_system";
        String url = "jdbc:mysql://" + mydatabase;
        String username = "root";
        String password = "root";

        connection = DriverManager.getConnection(url, username, password);
        this.stmt = connection.createStatement();
    }


    public void addEntity(String name, String tableName, Column[] cols, String primaryKeyColumn) throws SQLException, ClassNotFoundException {

        String[] sCols = new String[cols.length];
        for (int i = 0; i < cols.length; i++) {
            sCols[i] = cols[i].toString();
        }
        String columnsStatement = String.join(",\n", sCols);

        String sql = String.format(createTableStatement, tableName, columnsStatement, String.format(primaryKeyStatement, primaryKeyColumn));
        //     Column Name          SQLServer Type           Java Type
        /*String sql = String.format("CREATE TABLE `%s`("
                + "col_boolean          BIT, "                // boolean
                + "col_byte             TINYINT, "            // byte
                + "col_short            SMALLINT, "           // short
                + "col_int              INTEGER, "            // int
                + "col_bigdecimal       DECIMAL(13,0), "      // BigDecimal; can also be NUMERIC(p,s)
                + "col_string           VARCHAR(254))", tableName) ;*/      // String


        stmt.executeUpdate(sql);
    }


    public void addConcept(String name, String abbr, String desc) throws SQLException {

        String sql = "insert into concept (`name`, `abbr`, `desc`)"
                + " values (?,?,?)";

        PreparedStatement pstmt = this.connection.prepareStatement(sql,
                Statement.RETURN_GENERATED_KEYS);

        pstmt.setString(1, name);
        pstmt.setString(2, abbr);
        pstmt.setString(3, desc);
        pstmt.executeUpdate();
    }

    public void addDataPoint(String name, String tableName, int entity, Column[] cols, String primaryKeyColumn)
            throws SQLException {
        String sql = "insert into datapoint(`name`, `table_name`, `entity_id`)"
                + " values (?,?,?)";

        PreparedStatement pstmt = this.connection.prepareStatement(sql,
                Statement.RETURN_GENERATED_KEYS);

        pstmt.setString(1, name);
        pstmt.setString(2, tableName);
        pstmt.setInt(3, entity);
        pstmt.executeUpdate();


        String[] sCols = new String[cols.length];
        for (int i = 0; i < cols.length; i++) {
            sCols[i] = cols[i].toString();
        }
        String columnsStatement = String.join(",\n", sCols);

        String sql1 = String.format(createTableStatement, tableName, columnsStatement, String.format(primaryKeyStatement, primaryKeyColumn));
        stmt.executeUpdate(sql1);
    }

    @Override
    public void addInclude(String fieldName, int concept, int dataPoint) throws  SQLException{
        String sql = "insert into includes(`field_name`, `concept_id`, `datapoint_id`)"
                + " values (?,?,?)";

        PreparedStatement pstmt = this.connection.prepareStatement(sql,
                Statement.RETURN_GENERATED_KEYS);

        pstmt.setString(1, fieldName);
        pstmt.setInt(2, concept);
        pstmt.setInt(3, dataPoint);
        pstmt.executeUpdate();
    }
}
