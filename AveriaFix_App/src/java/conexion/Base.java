package conexion;

import java.sql.*;

public class Base {

    private String usrBD;
    private String passBD;
    private String urlBD;
    private String driverClassName;
    private Connection conn = null;

    public Base() {

        this.usrBD = "root";
        this.passBD = "bebidas500IIi11";
        this.urlBD = "jdbc:mysql://127.0.0.1:3306/Averia_Fix";
        this.driverClassName = "com.mysql.cj.jdbc.Driver";
    }

    public String getUsrBD() {
        return usrBD;
    }

    public void setUsrBD(String usrBD) {
        this.usrBD = usrBD;
    }

    public String getPassBD() {
        return passBD;
    }

    public void setPassBD(String passBD) {
        this.passBD = passBD;
    }

    public String getUrlBD() {
        return urlBD;
    }

    public void setUrlBD(String urlBD) {
        this.urlBD = urlBD;
    }

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void conectar() {
        try {
            Class.forName(this.driverClassName).newInstance();
            this.conn = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);
        } catch (Exception error) {
            System.out.println("Error " + error.getMessage());
        }
    }

    public void cierraConexion() throws SQLException {
        this.conn.close();
    }

    public ResultSet consultaUser(int no_user, String password) throws SQLException {

        if (this.conn == null || this.conn.isClosed()) {
            throw new SQLException("No hay conexión a la base de datos.");
        }

        CallableStatement stmt = this.conn.prepareCall("{CALL Log_In(?, ?)}");
        stmt.setInt(1, no_user);
        stmt.setString(2, password);

        return stmt.executeQuery();
    }

    public ResultSet informePerfil(int no_user, String password) throws SQLException {

        if (this.conn == null || this.conn.isClosed()) {
            throw new SQLException("No hay conexión a la base de datos.");
        }

        CallableStatement stmt = this.conn.prepareCall("{CALL info_Perfil(?,?)}");
        stmt.setInt(1, no_user);
        stmt.setString(2, password);

        return stmt.executeQuery();
    }

    public int editaPerfil(int no_user, String oldPassword, String newPassword) throws SQLException {

        if (this.conn == null || this.conn.isClosed()) {
            throw new SQLException("No hay conexión a la base de datos.");
        }

        int rowsAffected = 0;

        try (CallableStatement stmt = this.conn.prepareCall("{CALL editar_Perfil(?, ?, ?)}")) {

            stmt.setInt(1, no_user);
            stmt.setString(2, oldPassword);
            stmt.setString(3, newPassword);

            rowsAffected = stmt.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error al ejecutar el procedimiento almacenado editar_Perfil", e);
        }

        return rowsAffected;
    }

    public ResultSet altaAveria(int noPdc, String estacion, String linea, Date fecha, Time hora, String descripcion, String idUsrReporte, String idUsrRecibe) throws SQLException {
        if (this.conn == null || this.conn.isClosed()) {
            throw new SQLException("No hay conexión a la base de datos.");
        }

        CallableStatement stmt = this.conn.prepareCall("{CALL Alta_Averia(?, ?, ?, ?, ?, ?, ?, ?)}");

        // Establecer los parámetros de entrada
        stmt.setInt(1, noPdc);
        stmt.setString(2, estacion);
        stmt.setString(3, linea);
        stmt.setDate(4, fecha);
        stmt.setTime(5, hora);
        stmt.setString(6, descripcion);
        stmt.setString(7, idUsrReporte);
        stmt.setString(8, idUsrRecibe);

    
        return stmt.executeQuery();
    }
}
