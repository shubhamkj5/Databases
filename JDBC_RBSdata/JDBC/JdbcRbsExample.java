import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Date;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.FileWriter;
import java.io.PrintWriter;

class JdbcRbsExample extends JFrame implements ActionListener {

	private JButton exportButton = new JButton("Export All Data");
	private JButton alarmsperRBSButton = new JButton(
			"Export Number of Alarms Per RBS");
	private JButton allAlarmsforRBSButton = new JButton(
			"List All Alarms for RBS : ");
	private JButton alarmsAfterButton = new JButton("List Alarms After :");
	private JTextField rBSIDTF = new JTextField(12);
	private JTextField timeTF = new JTextField(12);
	private Connection con = null;
	private Statement stmt = null;

	public JdbcRbsExample(String str) {
		super(str);
		getContentPane().setLayout(new GridLayout(3, 2));
		initDBConnection();
		getContentPane().add(exportButton);
		getContentPane().add(alarmsperRBSButton);
		getContentPane().add(allAlarmsforRBSButton);
		getContentPane().add(rBSIDTF);
		getContentPane().add(alarmsAfterButton);
		getContentPane().add(timeTF);
		exportButton.addActionListener(this);
		alarmsperRBSButton.addActionListener(this);
		allAlarmsforRBSButton.addActionListener(this);
		alarmsAfterButton.addActionListener(this);
		setSize(400, 200);
		setVisible(true);
	}

	private void initDBConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/alarms";
			con = DriverManager.getConnection(url, "root", "admin");
			stmt = con.createStatement();
		} catch (Exception e) {
			System.out.print("Failed to initialise DB Connection");
		}
	}

	private void writeToFile(ResultSet rs) {
		try {
			FileWriter outputFile = new FileWriter("RBSOutput.csv");
			PrintWriter printWriter = new PrintWriter(outputFile);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numColumns = rsmd.getColumnCount();

			for (int i = 0; i < numColumns; i++) {
				printWriter.print(rsmd.getColumnLabel(i + 1) + ",");
			}
			printWriter.print("\n");
			while (rs.next()) {
				for (int i = 0; i < numColumns; i++) {
					printWriter.print(rs.getString(i + 1) + ",");
				}
				printWriter.print("\n");
				printWriter.flush();
			}
			printWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void actionPerformed(ActionEvent e) {
		Object target = e.getSource();
		ResultSet rs = null;
		String cmd = null;
				
if (target.equals(exportButton)){  		
					cmd="select * from alarms";			
	}			
				//  This is where you need to add else if target = for the other buttons
				//}


		try {
			rs = stmt.executeQuery(cmd);
			writeToFile(rs);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public static void main(String args[]) {
		new JdbcRbsExample("RBS Data Export");
	}

}
