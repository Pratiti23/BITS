package dao;
import model.Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import oracle.jdbc.*;
public class Dao {
	static Connection con=null;
	static{
		try
	{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con =DriverManager.getConnection("jdbc:oracle:thin:system/evosys123@192.168.1.166:1521:REP");
			}
	catch(Exception e)
	{
		e.printStackTrace();
	}}

public static int register(String sql,Model m) throws SQLException
{
	PreparedStatement ps = con.prepareStatement(sql);
	int i= ps.executeUpdate();
	con.commit();
	return i;
	
	
}
public static ResultSet validate(String sql,Model m) throws SQLException

{
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs= ps.executeQuery();
	return rs;
}
public static int UploadFile(String sql,Model m) throws SQLException
{
	PreparedStatement ps = con.prepareStatement(sql);
	int i= ps.executeUpdate();
	return i;
	
	
}
public static Connection connect() throws SQLException, ClassNotFoundException
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con =DriverManager.getConnection("jdbc:oracle:thin:system/evosys123@192.168.1.166:1521:REP");
	return con;
}
public static ResultSet lov(int i) throws SQLException, ClassNotFoundException
{
	 CallableStatement stmt =con.prepareCall("BEGIN lov(?,?); END; ");
	 stmt.setInt(1,i);
	   stmt.registerOutParameter(2, OracleTypes.CURSOR);
	   stmt.execute();
	   ResultSet rs = ((OracleCallableStatement)stmt).getCursor(2);
	 return rs;
}
}

