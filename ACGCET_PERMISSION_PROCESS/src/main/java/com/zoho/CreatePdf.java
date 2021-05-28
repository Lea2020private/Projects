package com.zoho;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.property.TextAlignment;  

public class CreatePdf {    
   public static void main(String args[]) throws Exception {              
      // Creating a PdfWriter       
      String dest = "sample.pdf";       
      PdfWriter writer = new PdfWriter(dest); 
   
      // Creating a PdfDocument       
      PdfDocument pdfDoc = new PdfDocument(writer);              
   
      // Adding a new page 
      pdfDoc.addNewPage();               
   
      // Creating a Document        
      Document document = new Document(pdfDoc,PageSize.A4); 
      
      ImageData data = ImageDataFactory.create("t.jpg");              
      
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
      
      Paragraph from_content1 = new Paragraph ("1815048,");
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
      
      Paragraph to_content2 = new Paragraph ("KARAIKUDI,");
      to_content2.setFirstLineIndent(40);
      document.add(to_content2);
      
      document.add(emptyline);
      document.add(emptyline);
      document.add(emptyline);
      
     
      
      
      // Closing the document  
      document.close();              
      System.out.println("PDF Created");    
   } 
} 