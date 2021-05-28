package com.zoho;

import java.util.Base64;

public class EncryptDecrypt {

	//normal encryption
	public String encryption(String str) {
		Base64.Encoder encoder = Base64.getEncoder(); 
		//encode the string
	    String normalstr = encoder.encodeToString(str.getBytes());  
	    StringBuffer reverseStr=new StringBuffer(normalstr);             //reverse the string and encode
	    reverseStr.reverse();
	    //again encode
	    String encryptedString=reverseStr+normalstr+reverseStr+normalstr+reverseStr+normalstr;
        return encryptedString; 
		}
	
	//normal decryption
	public String decryption(String str) {
		 // Getting decoder  
        Base64.Decoder decoder = Base64.getDecoder();  
        // Decoding string  
        String normalstr=str.substring(str.length()/6,str.length()/6+str.length()/6);
        String decryptedString = new String(decoder.decode(normalstr));  
        return decryptedString;
	}
	
	//generate a 64 letter randomly encrypted key
	public String GetRandomEncryted_key() {
		
		   // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"+"!@#$%^&*()";
  
        // create StringBuffer size of AlphaNumericString
        StringBuilder Encrypted_AlphaNumericString = new StringBuilder(64);
  
        for (int i = 0; i < 64; i++) {
  
            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index = (int)(AlphaNumericString.length() * Math.random());
  
            // add Character one by one in end of sb
            Encrypted_AlphaNumericString.append(AlphaNumericString.charAt(index));               
        }
        return Encrypted_AlphaNumericString.toString();
	}
	
	
	
}
