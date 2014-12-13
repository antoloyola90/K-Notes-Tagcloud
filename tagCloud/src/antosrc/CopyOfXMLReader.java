package antosrc;
import java.io.*;
import java.net.*;
import java.sql.*;


public class CopyOfXMLReader{
	
	/*public XMLReader(String url){
		// System.out.print("Enter url of local for viewing html source code: ");
	    //BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	    //String url = br.readLine();
	   // String url="http://en.wikipedia.org/wiki/Apple";
	    try{
	      URL u = new URL(url);
	      HttpURLConnection uc = (HttpURLConnection) u.openConnection();
	      int code = uc.getResponseCode();
	      String response = uc.getResponseMessage();
	      System.out.println("HTTP/1.x " + code + " " + response);
	      for(int j = 1; ; j++){
	        String header = uc.getHeaderField(j);
	        String key = uc.getHeaderFieldKey(j);
	        if(header == null || key == null)
	          break;
	        System.out.println(uc.getHeaderFieldKey(j) + ": " + header);
	      }
	      InputStream in = new BufferedInputStream(uc.getInputStream());
	      Reader r = new InputStreamReader(in);
	      int c;
	      
	      OutputStream out = new FileOutputStream("C:/Users/Anto/"+url.substring(url.length()-4)+".txt");

			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) > 0){
				out.write(buf, 0, len);
			}
		
			InputStream inp = new FileInputStream("C:/Users/Anto/"+url.substring(url.length()-4)+".txt");
			   Reader rd = new InputStreamReader(inp);
			   int chr;
			   while((chr=rd.read())!=-1){
				   if((char)chr == '<')
					   if((char)(chr=rd.read()) == 'p')
						   break;
			   }

			int cnt=0;
			   while((chr = rd.read()) != -1  && cnt++<500){
				   if((char)chr != '<' && (char)chr != '>')
				   		System.out.print((char)chr);
				   if((char)chr == '<')
					   while((char)(chr = rd.read()) != '>');
				   
				   
			       
			     }
	    }
	    catch(MalformedURLException ex){
	      System.err.println(url + " is not a valid URL.");
	    }
	    catch(IOException ie){
	      System.out.println("Input/Output Error: " + ie.getMessage());
	    }
	}*/
	public CopyOfXMLReader(String url){
		// System.out.print("Enter url of local for viewing html source code: ");
	    //BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	    //String url = br.readLine();
	   // String url="http://en.wikipedia.org/wiki/Apple";
	    try{
	      URL u = new URL(url);
	      HttpURLConnection uc = (HttpURLConnection) u.openConnection();
	      int code = uc.getResponseCode();
	      String response = uc.getResponseMessage();
	      System.out.println("HTTP/1.x " + code + " " + response);
	      for(int j = 1; ; j++){
	        String header = uc.getHeaderField(j);
	        String key = uc.getHeaderFieldKey(j);
	        if(header == null || key == null)
	          break;
	        System.out.println(uc.getHeaderFieldKey(j) + ": " + header);
	      }
	      System.out.println("\n\n"+url+"\n\n");
	      InputStream in = new BufferedInputStream(uc.getInputStream());
	     	      
	      OutputStream out = new FileOutputStream("C:/Users/Anto/Documents/"+url.substring(url.length()-2)+".txt");
	   
			
			byte[] buf= new byte[1024];
			int len=1;
			while (in.read(buf) > 0){
				out.write(buf);
			}
			
		
			InputStream inp = new FileInputStream("C:/Users/Anto/Documents/"+url.substring(url.length()-2)+".txt");
			   Reader rd = new InputStreamReader(inp);
			   int chr;
			   while((chr=rd.read())!=-1){
				  System.out.print((char)chr);
			   }
			   

			
	    }
	    catch(MalformedURLException ex){
	      System.err.println(url + " is not a valid URL.");
	    }
	    catch(IOException ie){
	      System.out.println("Input/Output Error: " + ie.getMessage());
	    }
	}

  public static void main (String[] args) throws IOException, SQLException{
	  Connection c=antosrc.MySqlConnection.getConnection();
		System.out.println(c);
	
		String url="http://www.google.com/search?btnI&q=10000+bc+movie+site:en.wikipedia.org/wiki/";
		
		
		new CopyOfXMLReader(url);
			//url=r1.getString(2);
		}
	
		
}

