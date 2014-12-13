package antosrc;
import java.sql.*;

public class MySqlConnection {

	static {
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		Connection conn = null;

		try {

			conn =
				DriverManager.getConnection("jdbc:mysql://localhost/tagCloud?" +
				"user=anto&password=dbms1");
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		return conn;
	}

	public static void main(String[] args) throws Exception {
		Connection c=getConnection();
		System.out.println(c);
		try {
			Statement s=c.createStatement();
			//ResultSet r=s.executeQuery("select * from anto");
			//while (r.next()) {
				//System.out.println(r.getInt(1)*20+" "+r.getString(2));
			//}
			//r.close();
			s.close();
		} finally {
			c.close();
		}
	}
}
