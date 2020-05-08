/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package liga_mahasiswa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

/**
 *
 * @author ASUS
 */
public class conection {
    private static Connection mysqlkonek;
    
    public static void main(String[] args) throws SQLException{
        koneksiDB();
    }
    
    public static Connection koneksiDB() throws SQLException {
        if(mysqlkonek==null){
            try {
                String DB="jdbc:mysql://localhost:3306/project_uas_1"; // tabungan_haji database
                String user="root"; // user database
                String pass=""; // password database
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                mysqlkonek = (Connection) DriverManager.getConnection(DB,user,pass);
                
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null,"Koneksi Gagal", "Pesan", JOptionPane.INFORMATION_MESSAGE, new ImageIcon("icons8-access-denied-48.png"));
            }
        }
        return mysqlkonek;
    }

    static Statement createStatement() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
