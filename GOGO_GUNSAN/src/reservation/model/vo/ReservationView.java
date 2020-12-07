package reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ReservationView implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String reservationId;
	private String tourInfoId;
	private String tourInfoName;
	private String tourStaffNo;
	private String memberNo;
	private String memberName;
	private String memberPhone;
	private int adultAmount;
	private int childAmount;
	private String totalPrice;
	private String tourDateTime;
	private Date reservationDate;
	private String pay;
	public ReservationView() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationView(String reservationId, String tourInfoId, String tourStaffNo, String tourInfoName,
			String memberNo, String memberName, String memberPhone, int adultAmount, int childAmount, String totalPrice,
			String tourDateTime, Date reservationDate, String pay) {
		super();
		this.reservationId = reservationId;
		this.tourInfoId = tourInfoId;
		this.tourStaffNo = tourStaffNo;
		this.tourInfoName = tourInfoName;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
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
	public String getTourInfoName() {
		return tourInfoName;
	}
	public void setTourInfoName(String tourInfoName) {
		this.tourInfoName = tourInfoName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
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
	@Override
	public String toString() {
		return "ReservationView [reservationId=" + reservationId + ", tourInfoId=" + tourInfoId + ", tourStaffNo="
				+ tourStaffNo + ", tourInfoName=" + tourInfoName + ", memberNo=" + memberNo + ", memberName="
				+ memberName + ", memberPhone=" + memberPhone + ", adultAmount=" + adultAmount + ", childAmount="
				+ childAmount + ", totalPrice=" + totalPrice + ", tourDateTime=" + tourDateTime + ", reservationDate="
				+ reservationDate + ", pay=" + pay + "]";
	}
	

}
