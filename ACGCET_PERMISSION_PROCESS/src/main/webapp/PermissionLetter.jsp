<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=${encoding}"></head>

<%@page import="java.io.File"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>


<%@page import="com.itextpdf.io.image.ImageData,
com.itextpdf.io.image.ImageDataFactory,
 com.itextpdf.kernel.geom.PageSize,
 com.itextpdf.kernel.pdf.PdfDocument,
 com.itextpdf.kernel.pdf.PdfWriter,
 com.itextpdf.layout.Document,
com.itextpdf.layout.element.Image,
 com.itextpdf.layout.element.Paragraph,
 com.itextpdf.layout.property.TextAlignment"%>

<%@ page language="java" contentType="application/pdf; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String permission_letter_no=request.getParameter("permission_no");

//get cookies to check if current user is logged in or not
String login_key="";
Cookie cookies[]=request.getCookies();
for(Cookie c:cookies){
	if(c.getName().equals("student_login_key")){
		login_key=c.getValue();
	}
}


String path = "C:/Users/hp/eclipse-workspace/ACGCET_PERMISSION_PROCESS/permissionletter.pdf";       
PdfWriter writer = new PdfWriter(path); 

// Creating a PdfDocument       
PdfDocument pdfDoc = new PdfDocument(writer);              

// Adding a new page 
pdfDoc.addNewPage();               

// Creating a Document        
Document document = new Document(pdfDoc,PageSize.A4); 

ImageData data = ImageDataFactory.create("C:/Users/hp/eclipse-workspace/ACGCET_PERMISSION_PROCESS/t.jpg");              

// Creating an Image object        
Image image = new Image(data);                        

// Adding image to the document       
document.add(image); 

Paragraph emptyline = new Paragraph (); 
document.add(emptyline);
document.add(emptyline); 
document.add(emptyline);

Paragraph title = new Paragraph ("PERMISSION LETTER"); 
title.setBold();
title.setTextAlignment(TextAlignment.CENTER);
title.setUnderline();
document.add(title);

document.add(emptyline);

Paragraph place = new Paragraph ("PLACE  :  KARAIKUDI"); 
place.setTextAlignment(TextAlignment.RIGHT);
document.add(place);

Paragraph date = new Paragraph  ("DATE  : 19 / 05 / 2021"); 
date.setTextAlignment(TextAlignment.RIGHT);
document.add(date);

document.add(emptyline);

Paragraph from = new Paragraph ("FROM"); 
from.setBold();
from.setFirstLineIndent(15);
document.add(from);

Paragraph from_content = new Paragraph ("THAMIZHSELVAN T,");
from_content.setFirstLineIndent(40);
document.add(from_content);

Paragraph from_content1 = new Paragraph (permission_letter_no);
from_content1.setFirstLineIndent(40);
document.add(from_content1);

Paragraph from_content2 = new Paragraph ("CSE,");
from_content2.setFirstLineIndent(40);
document.add(from_content2);

Paragraph from_content3= new Paragraph ("PLACEMENT COORDINATOR,");
from_content3.setFirstLineIndent(40);
document.add(from_content3);

Paragraph from_content4 = new Paragraph ("ACGCET, KARAIKUDI.");
from_content4.setFirstLineIndent(40);
document.add(from_content4);

document.add(emptyline);
document.add(emptyline);
document.add(emptyline);


Paragraph to = new Paragraph ("TO"); 
to.setBold();
to.setFirstLineIndent(15);
document.add(to);

Paragraph to_content = new Paragraph ("GALLERY HALL INCHARGE,");
to_content.setFirstLineIndent(40);
document.add(to_content);


Paragraph to_content1 = new Paragraph ("ACGCET,");
to_content1.setFirstLineIndent(40);
document.add(to_content1);

Paragraph to_content2 = new Paragraph ("KARAIKUDI.");
to_content2.setFirstLineIndent(40);
document.add(to_content2);

document.add(emptyline);
document.add(emptyline);
document.add(emptyline);

// Closing the document  
document.close();  

    response.reset();
    response.setContentType("application/pdf");
    File file = new File("C:/Users/hp/eclipse-workspace/ACGCET_PERMISSION_PROCESS/permissionletter.pdf");
    response.setHeader("Content-Type", "application/pdf");
    response.setHeader("Content-Disposition",
            "inline;filename=PemissionLetter.pdf");
    response.setContentLength((int) file.length());
    response.setHeader("Content-Type",
            getServletContext().getMimeType(file.getName()));
    response.setHeader("Content-Length", String.valueOf(file.length()));
    //OPen an input stream to the file and post the file contents thru the
    //servlet output stream to the browser
    FileInputStream in = new FileInputStream(file);
    ServletOutputStream outs = response.getOutputStream();
    response.setContentLength(in.available());
    byte[] buf = new byte[8192];
    int c = 0;
    try {
        while ((c = in.read(buf, 0, buf.length)) > 0) {
            //System.out.println("size:"+c);
            outs.write(buf, 0, c);
            out.write(outs.toString());
        }

    } catch (IOException ioe) {
        ioe.printStackTrace(System.out);
    } finally {
        outs.flush();
        outs.close();
        in.close();
    }
%>
</html>