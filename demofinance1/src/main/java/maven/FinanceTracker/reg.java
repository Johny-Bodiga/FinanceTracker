package maven.FinanceTracker;
import java.io.Serializable;
import javax.persistence.*;


@Entity
@Table (name="reg2")
public class reg {
	@Column(name="fname")
	private String fname;
	@Column(name="lname")
	private String lname;
	@Id
	@Column(name="mail")
	private String mail;
	@Column(name="pass")
	private String password;
	@Column(name="mobile")
	private String mobile;
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
}
