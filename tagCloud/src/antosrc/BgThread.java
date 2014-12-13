package antosrc;

import java.sql.*;
import java.util.*;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

public class BgThread extends Thread {

	Queue<String[]> wordinfo = new PriorityQueue<String[]>();
	static BgThread bgThread = null;
	static {
		bgThread = new BgThread();
		bgThread.start();
	}

	private BgThread() {

	}

	public static void add(String wordinfo, String user) {
		synchronized (bgThread.wordinfo) {
			bgThread.wordinfo.add(new String[] {wordinfo, user});
			bgThread.wordinfo.notifyAll();
		}
		System.out.println("added " + wordinfo);

	}

	public void run() {
		Connection c = antosrc.MySqlConnection.getConnection();
		System.out.println(c);
		try {
			c.setAutoCommit(true);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		while (true) {
			String[] pname=null;
			
			synchronized (bgThread.wordinfo) {
				try {
					bgThread.wordinfo.wait(5);
				} catch (Exception e) {
				}
				pname = bgThread.wordinfo.poll();
			}
			
			
			if (pname != null){
				c=antosrc.MySqlConnection.getConnection();
			//System.out.println(c);
				try {
					String[] tokens = pname[0].split(", ");
					
					for (String t : tokens) {
						
						try {
							Statement s=c.createStatement();
							ResultSet r=s.executeQuery("select count(*) from words where word='"+t+"'");
							r.next();
							String query;
							
							if(r.getInt(1)==0){
								query = "insert into words (word) values('"+ t + "')";
								s = c.createStatement();
								s.execute(query);
								System.out.println(s);
								new XMLReader(t);
							}
							query="insert into userwords (username,word) values('"+pname[1]+"','"+t+"')";
							s = c.createStatement();
							s.execute(query);
							else{
								System.out.println("\nAlready added word!!");
							}
						s.close();
						}
						finally {
							
						}
						
					}
				} catch (Exception e) {
					System.out.println(e);
				}
			}	
		}
	}

}
