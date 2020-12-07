package reservation.model.vo;
import java.io.Serializable;
import java.sql.Date;
public class Reservation implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String reservationId;
	private String tourInfoId;
	private String tourStaffNo;
	private String memberNo;
	private int adultAmount;
	private int childAmount;
	private String totalPrice;
	private String tourDateTime;
	private Date reservationDate;
	private String pay;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(String reservationId, String tourInfoId, String tourStaffNo, String memberNo, int adultAmount,
			int childAmount, String totalPrice, String tourDateTime, Date reservationDate, String pay) {
		super();
		this.reservationId = reservationId;
		this.tourInfoId = tourInfoId;
		this.tourStaffNo = tourStaffNo;
		this.memberNo = memberNo;
		this.adultAmount = adultAmount;
		this.childAmount = childAmount;
		this.totalPrice = totalPrice;
		this.tourDateTime = tourDateTime;
		this.reservationDate = reservationDate;
		this.pay = pay;
	}
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	public String getTourInfoId() {
		return tourInfoId;
	}
	public void setTourInfoId(String tourInfoId) {
		this.tourInfoId = tourInfoId;
	}
	public String getTourStaffNo() {
		return tourStaffNo;
	}
	public void setTourStaffNo(String tourStaffNo) {
		this.tourStaffNo = tourStaffNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public int getAdultAmount() {
		return adultAmount;
	}
	public void setAdultAmount(int adultAmount) {
		this.adultAmount = adultAmount;
	}
	public int getChildAmount() {
		return childAmount;
	}
	public void setChildAmount(int childAmount) {
		this.childAmount = childAmount;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getTourDateTime() {
		return tourDateTime;
	}
	public void setTourDateTime(String tourDateTime) {
		this.tourDateTime = tourDateTime;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Reservation [reservationId=" + reservationId + ", tourInfoId=" + tourInfoId + ", tourStaffNo="
				+ tourStaffNo + ", memberNo=" + memberNo + ", adultAmount=" + adultAmount + ", childAmount="
				+ childAmount + ", totalPrice=" + totalPrice + ", tourDateTime=" + tourDateTime + ", reservationDate="
				+ reservationDate + ", pay=" + pay + "]";
	}
}