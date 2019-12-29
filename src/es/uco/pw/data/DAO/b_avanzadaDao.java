package es.uco.pw.data.DAO;

import java.sql.*;
import java.util.ArrayList;

import es.uco.pw.data.BD.DBConexion;
import es.uco.pw.display.beans.b_avanzadaBean;

public class b_avanzadaDao {
	
	private DBConexion con;
	private Connection connection;

	public  b_avanzadaDao(String jdbURL, String jdbUsername, String jdbPassword) throws SQLException {
		System.out.println(jdbURL+jdbUsername);
		con = new DBConexion(jdbURL, jdbUsername, jdbPassword);
		}
	
	
		public ArrayList<b_avanzadaBean> getbusqueda(){
		ArrayList<b_avanzadaBean> resultado=new ArrayList<b_avanzadaBean>();  
				
				try {
					String sql = "SELECT idUsuario, nombre, apellidos, correoElectronico FROM Usuario WHERE nombre like ? or apellidos like ?";
					con.conectar();
					connection = con.getJdbcConnection();
					System.out.println(connection);
				
					PreparedStatement statement = connection.prepareStatement(sql);
					
					ResultSet rs=statement.executeQuery();

					while(rs.next()){
						//System.out.println("Entro si o si");
						b_avanzadaBean result=new b_avanzadaBean();  
						
						result.setNombre(rs.getString("nombre"));  
						result.setApellidos(rs.getString("apellidos"));  
						resultado.add(result);

					}
					
					statement.close();
					con.desconectar();
					
				}catch(Exception e){}
				
				return resultado;
			}
	
}
