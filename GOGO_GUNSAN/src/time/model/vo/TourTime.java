package time.model.vo;

import java.io.Serializable;

public class TourTime implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String tourInfoId;
	private String remainingTicket;
	private String startTime;
	public TourTime() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TourTime(String tourInfoId, String remainingTicket, String startTime) {
		super();
		this.tourInfoId = tourInfoId;
		this.remainingTicket = remainingTicket;
		this.startTime = startTime;
	}
	public String getTourInfoId() {
		return tourInfoId;
	}
	public void setTourInfoId(String tourInfoId) {
		this.tourInfoId = tourInfoId;
	}
	public String getRemainingTicket() {
		return remainingTicket;
	}
	public void setRemainingTicket(String remainingTicket) {
		this.remainingTicket = remainingTicket;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "TourTime [tourInfoId=" + tourInfoId + ", remainingTicket=" + remainingTicket + ", startTime="
				+ startTime + "]";
	}
	
	
}
