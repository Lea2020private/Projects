package com.zoho;


import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
* Servlet to handle File upload request from Client
* @author Javin Paul
*/
public class upload extends HttpServlet {
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private final String UPLOAD_DIRECTORY = "E:/Thamizh";
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
     
       //process only if its multipart content
	   String path="";
       if(ServletFileUpload.isMultipartContent(request)){
           try {
               List<FileItem> multiparts = new ServletFileUpload(
                                        new DiskFileItemFactory()).parseRequest(request);
             
               for(FileItem item : multiparts){
                   if(!item.isFormField()){
                       String name = new File(item.getName()).getName();
                       item.write( new File(UPLOAD_DIRECTORY +"/"+ name));
                       path=UPLOAD_DIRECTORY + "/" + name;
                   }
               }
          
              //File uploaded successfully
              System.out.println("File Uploaded Successfully"+path);
           } catch (Exception ex) {
        	   System.out.println(ex.getMessage());
           }          
        
       }else{
    	   System.out.println("nooo");
       }
   
  
    
   }
 
}