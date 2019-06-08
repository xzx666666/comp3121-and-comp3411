package staff.test;

import java.time.LocalDate;
import java.time.Month;
import java.util.Date;

import example.Lecturer;
import example.StaffMember;

public class StaffTest {
	
	public static void main(String[] args) {
		LocalDate hire1= LocalDate.of(2018, Month.JANUARY, 10);
		LocalDate hire2= LocalDate.of(2020, Month.FEBRUARY, 10);
		LocalDate end1= LocalDate.of(2015, Month.APRIL, 10);
		LocalDate end2= LocalDate.of(2018, Month.AUGUST, 10);
		
		StaffMember staff1 = new StaffMember("cindy",1000,hire1,end1);
		Lecturer lecture1 = new Lecturer("pp",100,hire2,end2,"A","CSE"); 
		printStaffDetails(staff1.toString());
		printStaffDetails(lecture1.toString());
		StaffMember staff2 = new StaffMember("cindy",1000,hire1,end1);
		Lecturer lecture2 = new Lecturer("pp",100,hire2,end2,"A","CSE"); 
		
		assert(staff1.equals(staff2));
		assert(lecture1.equals(lecture2));
		
	}
	
	public static void printStaffDetails(String s) {
		System.out.println(s+ "\n");
		
	}


}
