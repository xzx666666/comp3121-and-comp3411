package example;

import java.time.LocalDate;
import java.util.Date;

/**
 * A staff member
 * @author Robert Clifton-Everest
 *
 */
public class StaffMember {
	private String name;
	private int salary;
	private LocalDate hireDate;
	private LocalDate endDate;
	public StaffMember(String name,int salary,LocalDate hireDate,LocalDate endDate) {
		setName(name);
		setSalary(salary);
		setHireDate(hireDate);
		setEndDate(endDate);
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public LocalDate getHireDate() {
		return hireDate;
	}
	public void setHireDate(LocalDate hireDate) {
		this.hireDate = hireDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	
	
	@Override
	public String toString() {
		return " Name:"+this.name + " Salary:" + this.salary + " HireDate:" + this.hireDate.toString() + " EndDate:" +this.endDate.toString();
	}
	
	
	@Override
	public boolean equals(Object s1) {
		if(s1!= this) return false;
		if (!(s1 instanceof StaffMember)) {
			return false;
		}
		StaffMember s = (StaffMember) s1;
		
		return (s.getSalary() == this.salary && s.getName() == this.getName() 
				&& s.getHireDate() == this.hireDate && this.getEndDate() == s.getEndDate());
		
	}
	
}
