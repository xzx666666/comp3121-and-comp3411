package example;

import java.time.LocalDate;
import java.util.Date;

public class Lecturer extends StaffMember{
	private String academic_status;
	private String school;
	public Lecturer(String name, int salary, LocalDate hireDate, LocalDate endDate,String academic_status,String school) {
		super(name, salary, hireDate, endDate);
		setAcademic_status(academic_status);
		setSchool(school);
	}

	public String getAcademic_status() {
		return academic_status;
	}

	public void setAcademic_status(String academic_status) {
		this.academic_status = academic_status;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}
	
	@Override
	public String toString() {
		return super.toString()+" School:" + this.school+" Acadmic Level:"+this.academic_status;
	}
	
	@Override
	public boolean equals(Object s1) {
		if(s1!= this) return false;
		if (!(s1 instanceof Lecturer)) {
			return false;
		}
		Lecturer s = (Lecturer) s1;
		
		return (s.getSalary() == super.getSalary() && s.getName() == super.getName() 
				&& s.getHireDate() == super.getHireDate() && super.getEndDate() == s.getEndDate()
				&&this.getAcademic_status() == s.getAcademic_status()&&this.getEndDate()== s.getEndDate());
		
	}

}
