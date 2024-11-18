package maven.FinanceTracker;

import javax.persistence.*;

@Entity
@Table(name="history4")
public class history {
	 @Id
     @Column(name="id")
	// @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="mail")
   private String mail;
	@Column(name="purpose")
   private String purpose;
	@Column(name="amt")
   private String amount;
	@Column(name="pay")
   private String pay;
	@Column(name="other")
	private String other;
	@Column(name="dates")
	   private String date;
	@Column(name="finance")
	   private String fin;
   public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getMail() {
	return mail;
}
public void setMail(String mail) {
	this.mail = mail;
}
public String getPurpose() {
	return purpose;
}
public void setPurpose(String purpose) {
	this.purpose = purpose;
}
public String getAmount() {
	return amount;
}
public void setAmount(String amount) {
	this.amount = amount;
}
public String getPay() {
	return pay;
}
public void setPay(String pay) {
	this.pay = pay;
}
public String getOther() {
	return other;
}
public void setOther(String other) {
	this.other = other;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getFin() {
	return fin;
}
public void setFin(String fin) {
	this.fin = fin;
}

}
