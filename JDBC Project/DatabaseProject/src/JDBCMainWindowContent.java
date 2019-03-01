import java.awt.*;
import java.awt.event.*;
import java.io.FileWriter;
import java.io.PrintWriter;
import javax.swing.*;
import javax.swing.border.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import java.sql.*;

@SuppressWarnings("serial")
public class JDBCMainWindowContent extends JInternalFrame implements ActionListener
{	
	String cmd = null;

	// DB Connectivity Attributes
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	private Container content;

	private JPanel detailsPanel;
	private JPanel exportButtonPanel;
	//private JPanel exportConceptDataPanel;
	private JScrollPane dbContentsPanel;

	private Border lineBorder;

	private JLabel IDLabel=new JLabel("ID:                 ");
	private JLabel FirstNameLabel=new JLabel("Title");
	private JLabel LastNameLabel=new JLabel("Description");
	private JLabel lblyear=new JLabel("Release Year");
	private JLabel GenderLabel=new JLabel("View Duration");
	private JLabel PositionLabel=new JLabel("Rental Rate");
	private JLabel DepartmentLabel=new JLabel("Rating");
	private JLabel lblSpecialFeatures=new JLabel("Special Features");
	private JLabel Last=new JLabel("Last Update");

	private JTextField IDTF= new JTextField(10);
	private JTextField TitleTF=new JTextField(10);
	private JTextField DescriptionTF=new JTextField(10);
	private JTextField YearTF=new JTextField(10);
	private JTextField DurationTF=new JTextField(10);
	private JTextField RateTF=new JTextField(10);
	private JTextField UpdateTF=new JTextField(10);


	private static QueryTableModel TableModel = new QueryTableModel();
	//Add the models to JTabels
	private JTable TableofDBContents=new JTable(TableModel);
	//Buttons for inserting, and updating members
	//also a clear button to clear details panel
	private JButton updateButton = new JButton("Update");
	private JButton insertButton = new JButton("Insert");
	private JButton exportButton  = new JButton("Export");
	private JButton deleteButton  = new JButton("Delete");
	private JButton clearButton  = new JButton("Clear");

	private JButton  exportavgRating = new JButton("Average Earning Rating Wise");
	private JTextField avgRating  = new JTextField(12);
	private JButton exportavgFeature  = new JButton("Average Earning Feature Wise");
	private JTextField avgFeature  = new JTextField(12);
	private JButton movieEarningsYear  = new JButton("Export Movie Earnings Per Year");
	private JButton ratingViews  = new JButton("Export Rating Wise Views");
	private JTextField RatingTF;
	private JTextField FeaturesTF;
	private JTextField LengthTF;



	public JDBCMainWindowContent( String aTitle)
	{	
		//setting up the GUI
		super(aTitle, false,false,false,false);
		setEnabled(true);

		initiate_db_conn();
		//add the 'main' panel to the Internal Frame
		content=getContentPane();
		content.setLayout(null);
		content.setBackground(Color.lightGray);
		lineBorder = BorderFactory.createEtchedBorder(15, Color.red, Color.black);

		//setup details panel and add the components to it
		detailsPanel=new JPanel();
		detailsPanel.setBackground(Color.lightGray);
		detailsPanel.setBorder(BorderFactory.createTitledBorder(lineBorder, "CRUD Actions"));
		detailsPanel.setLayout(null);
		IDLabel.setBounds(6, 17, 174, 25);

		detailsPanel.add(IDLabel);
		IDTF.setBounds(180, 17, 174, 25);
		detailsPanel.add(IDTF);
		FirstNameLabel.setBounds(6, 42, 174, 25);
		detailsPanel.add(FirstNameLabel);
		TitleTF.setBounds(180, 42, 174, 25);
		detailsPanel.add(TitleTF);
		LastNameLabel.setBounds(6, 67, 174, 25);
		detailsPanel.add(LastNameLabel);
		DescriptionTF.setBounds(180, 67, 174, 25);
		detailsPanel.add(DescriptionTF);
		lblyear.setBounds(6, 92, 174, 25);
		detailsPanel.add(lblyear);
		YearTF.setBounds(180, 92, 174, 25);
		detailsPanel.add(YearTF);
		GenderLabel.setBounds(6, 117, 174, 25);
		detailsPanel.add(GenderLabel);
		DurationTF.setBounds(180, 117, 174, 25);
		detailsPanel.add(DurationTF);
		PositionLabel.setBounds(6, 142, 174, 25);
		detailsPanel.add(PositionLabel);
		RateTF.setBounds(180, 142, 174, 25);
		detailsPanel.add(RateTF);
		DepartmentLabel.setBounds(6, 196, 174, 25);
		detailsPanel.add(DepartmentLabel);
		lblSpecialFeatures.setBounds(6, 219, 174, 25);
		detailsPanel.add(lblSpecialFeatures);
		Last.setBounds(6, 244, 174, 25);
		detailsPanel.add(Last);
		UpdateTF.setBounds(180, 244, 174, 25);
		detailsPanel.add(UpdateTF);

		//setup details panel and add the components to it
		exportButtonPanel=new JPanel();
		exportButtonPanel.setLayout(new GridLayout(3,2));
		exportButtonPanel.setBackground(Color.lightGray);
		exportButtonPanel.setBorder(BorderFactory.createTitledBorder(lineBorder, "Export Data"));
		exportButtonPanel.add(exportavgRating);
		exportButtonPanel.add(avgRating);
		exportButtonPanel.add(exportavgFeature);
		exportButtonPanel.add(avgFeature);
		exportButtonPanel.add(movieEarningsYear);
		exportButtonPanel.add(ratingViews);
		exportButtonPanel.setSize(500, 200);
		exportButtonPanel.setLocation(3, 300);
		content.add(exportButtonPanel);

		insertButton.setSize(100, 30);
		updateButton.setSize(100, 30);
		exportButton.setSize (100, 30);
		deleteButton.setSize (100, 30);
		clearButton.setSize (100, 30);

		insertButton.setLocation(370, 10);
		updateButton.setLocation(370, 110);
		exportButton.setLocation (370, 160);
		deleteButton.setLocation (370, 60);
		clearButton.setLocation (370, 210);

		insertButton.addActionListener(this);
		updateButton.addActionListener(this);
		exportButton.addActionListener(this);
		deleteButton.addActionListener(this);
		clearButton.addActionListener(this);

		this.movieEarningsYear.addActionListener(this);
		this.exportavgRating.addActionListener(this);
		this.ratingViews.addActionListener(this);
		this.exportavgFeature.addActionListener(this);

		content.add(insertButton);
		content.add(updateButton);
		content.add(exportButton);
		content.add(deleteButton);
		content.add(clearButton);


		TableofDBContents.setPreferredScrollableViewportSize(new Dimension(900, 300));
		
		dbContentsPanel=new JScrollPane(TableofDBContents,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		dbContentsPanel.setBackground(Color.lightGray);
		dbContentsPanel.setBorder(BorderFactory.createTitledBorder(lineBorder,"Database Content"));

		detailsPanel.setSize(360, 300);
		detailsPanel.setLocation(3,0);
		dbContentsPanel.setSize(700, 300);
		dbContentsPanel.setLocation(477, 0);

		content.add(detailsPanel);
		
		RatingTF = new JTextField(10);
		RatingTF.setBounds(180, 196, 174, 25);
		detailsPanel.add(RatingTF);
		
		FeaturesTF = new JTextField(10);
		FeaturesTF.setBounds(180, 219, 174, 25);
		detailsPanel.add(FeaturesTF);
		
		LengthTF = new JTextField(10);
		LengthTF.setBounds(180, 171, 174, 25);
		detailsPanel.add(LengthTF);
		
		JLabel lblLength = new JLabel("Length");
		lblLength.setBounds(6, 171, 174, 25);
		detailsPanel.add(lblLength);
		content.add(dbContentsPanel);

		setSize(982,645);
		setVisible(true);
		TableofDBContents.getSelectionModel().addListSelectionListener(new ListSelectionListener(){
	        public void valueChanged(ListSelectionEvent e) {
	        	 int index = e.getFirstIndex();
	             if(index >= 0 && index <= TableModel.getRowCount()) {
	       IDTF.setText(TableofDBContents.getValueAt(index, 0).toString());
	           TitleTF.setText(TableModel.getValueAt(index, 1).toString());
	           DescriptionTF.setText(TableModel.getValueAt(index, 2).toString());
	           YearTF.setText(TableModel.getValueAt(index, 3).toString());
	           DurationTF.setText(TableModel.getValueAt(index, 4).toString());
	          
	           RateTF.setText(TableModel.getValueAt(index, 5).toString()); 
	           LengthTF.setText(TableModel.getValueAt(index, 6).toString());
	           RatingTF.setText(TableModel.getValueAt(index, 7).toString());
	           FeaturesTF.setText(TableModel.getValueAt(index, 8).toString());
	           UpdateTF.setText(TableModel.getValueAt(index, 9).toString());
	             }
	        }
	    });
		TableModel.refreshFromDB(stmt);
	}

	public void initiate_db_conn()
	{
		try
		{
			// Load the JConnector Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Specify the DB Name
			String url="jdbc:mysql://localhost:3306/dbproject";
			// Connect to DB using DB URL, Username and password
			con = DriverManager.getConnection(url, "root", "admin");
			//Create a generic statement which is passed to the TestInternalFrame1
			stmt = con.createStatement();
		}
		catch(Exception e)
		{
			System.out.println("Error: Failed to connect to database\n"+e.getMessage());
		}
	}

	//event handling 
	public void actionPerformed(ActionEvent e)
	{
		Object target=e.getSource();
		if (target == clearButton)
		{
			IDTF.setText("");
			TitleTF.setText("");
			DescriptionTF.setText("");
			YearTF.setText("");
			DurationTF.setText("");
			RateTF.setText("");
			LengthTF.setText("");
			UpdateTF.setText("");
			FeaturesTF.setText("");
			RatingTF.setText("");

		}

		if (target == insertButton)
		{		 
			try
			{
				String insertTemp ="Call insert_film(\""+TitleTF.getText()+"\",\""+DescriptionTF.getText()+"\",\""+YearTF.getText()+"\",\""+DurationTF.getText()+"\",\""+RateTF.getText()+"\",\""+LengthTF.getText()+"\",\""+RatingTF.getText()+"\",\""+FeaturesTF.getText()+"\");";
                
				stmt.executeUpdate(insertTemp);
				System.out.println(insertTemp+"\nSuccess");

			}
			catch (SQLException sqle)
			{
				sqle.printStackTrace();
			}
			finally
			{
				TableModel.refreshFromDB(stmt);
			}
		}
		if (target == deleteButton)
		{
			TableofDBContents.clearSelection();

			try
			{
				String updateTemp ="Call delete_film("+IDTF.getText()+")"; 
				stmt.executeUpdate(updateTemp);
				
			}
			catch (SQLException sqle)
			{
				System.err.println("Error with delete:\n"+sqle.toString());
			}
			finally
			{
				TableModel.refreshFromDB(stmt);
			}
		}
		if (target == updateButton)
		{	 	
			try
			{ 			
				String updateTemp ="Call update_film(\""+IDTF.getText()+"\",\""+TitleTF.getText()+"\",\""+DescriptionTF.getText()+"\",\""+YearTF.getText()+"\",\""+DurationTF.getText()+"\",\""+RateTF.getText()+"\",\""+LengthTF.getText()+"\",\""+RatingTF.getText()+"\",\""+FeaturesTF.getText()+"\");";
                

				stmt.executeUpdate(updateTemp);
				//these lines do nothing but the table updates when we access the db.
				rs = stmt.executeQuery("SELECT * from film ");
				rs.next();
				rs.close();	
			}
			catch (SQLException sqle){
				sqle.printStackTrace();
			}
			finally{
				TableModel.refreshFromDB(stmt);
			}
		}

		/////////////////////////////////////////////////////////////////////////////////////
		//I have only added functionality of 2 of the button on the lower right of the template
		///////////////////////////////////////////////////////////////////////////////////

		if(target == this.movieEarningsYear){

			cmd = "select * from earning_per_year;";

			try{					
				rs= stmt.executeQuery(cmd); 	
				
				writeToFile(rs,"EarningPerYear");
				rs.next();
				rs.close();	
			}
			catch(Exception e1){e1.printStackTrace();}

		}
		if(target == this.ratingViews){

			cmd = "select * from views_per_rating;";
			System.out.println(cmd);
			try{					
				rs= stmt.executeQuery(cmd);
				
				writeToFile(rs,"ViewsPerRating");
				rs.next();
				rs.close();	
			}
			catch(Exception e1){e1.printStackTrace();}

		}
		if(target == this.exportavgRating){

			cmd = "select average_earning_per_rating(\""+avgRating.getText()+"\");";

			try{					
				rs= stmt.executeQuery(cmd); 	
				
				writeToFile(rs,"AvgEarningRating");
				rs.next();
				rs.close();	
			}
			catch(Exception e1){e1.printStackTrace();}

		}
		if(target == this.exportavgFeature){
			

			cmd = "select average_earning_per_feature(\""+avgFeature.getText()+"\");";

			System.out.println(cmd);
			try{					
				rs= stmt.executeQuery(cmd); 	
				
				writeToFile(rs,"AvgEarningFeature");
				rs.next();
				rs.close();	
			}
			catch(Exception e1){e1.printStackTrace();}

		} 
if(target == this.exportButton){
			

			cmd = "select * from film";

			System.out.println(cmd);
			try{					
				rs= stmt.executeQuery(cmd); 
				
				writeToFile(rs,"AllData");
				rs.next();
				rs.close();	
			}
			catch(Exception e1){e1.printStackTrace();}

		} 

	}
	///////////////////////////////////////////////////////////////////////////

	private void writeToFile(ResultSet rs,String File){
		try{
			System.out.println("In writeToFile");
			FileWriter outputFile = new FileWriter(File+".csv");
			PrintWriter printWriter = new PrintWriter(outputFile);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numColumns = rsmd.getColumnCount();

			for(int i=0;i<numColumns;i++){
				printWriter.print(rsmd.getColumnLabel(i+1)+",");
			}
			printWriter.print("\n");
			while(rs.next()){
				for(int i=0;i<numColumns;i++){
					printWriter.print(rs.getString(i+1)+",");
				}
				printWriter.print("\n");
				printWriter.flush();
			}
			printWriter.close();
		}
		catch(Exception e){e.printStackTrace();}
	}
}
