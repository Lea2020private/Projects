package com.zoho;

public class GetPermissionPriority {

	public String GetPriority(String purpose) {
		
		if(purpose.equals("cultural")){
			return "9";
		}else if(purpose.equals("symposium")){
			return "8";
		}else if(purpose.equals("clubmega_event")){
			return "7";
		}else if(purpose.equals("placement")){
			return "6";
		}else if(purpose.equals("department_workshops") || purpose.equals("club_workshops")){
			return "5";
		}else if(purpose.equals("ncc")){
			return "4";
		}else if(purpose.equals("club_event")){
			return "3";
		}else if(purpose.equals("nss")){
			return "2";
		}else if(purpose.equals("yrc")){
			return "1";
		}
		
		return "";
	}
	
	
}
