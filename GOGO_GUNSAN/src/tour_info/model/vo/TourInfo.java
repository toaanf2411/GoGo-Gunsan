package tour_info.model.vo;

import java.io.Serializable;

public class TourInfo implements Serializable{
	
	private String tourInfoId;
	private String tourInfoName;
	private String categoryId;
	private String serviceType;
	private char hasTicket;
	private String adultPrice;
	private String childPrice;
	private double lat;
	private double longitude;
	private String imgServiceOriginalFileName;
	
	public TourInfo() {
		super();
		
	}

	public TourInfo(String tourInfoId, String tourInfoName, String categoryId, String serviceType,
			char hasTicket, String adultPrice, String childPrice, double lat, double longitude,
			String imgServiceOriginalFileName) {
		super();
		this.tourInfoId = tourInfoId;
		this.tourInfoName = tourInfoName;
		this.categoryId = categoryId;
		this.serviceType = serviceType;
		this.hasTicket = hasTicket;
		this.adultPrice = adultPrice;
		this.childPrice = childPrice;
		this.lat = lat;
		this.longitude = longitude;
		this.imgServiceOriginalFileName = imgServiceOriginalFileName;
	}


	public String getTourInfoId() {
		return tourInfoId;
	}

	public void setTourInfoId(String tourInfoId) {
		this.tourInfoId = tourInfoId;
	}

	public String getTourInfoName() {
		return tourInfoName;
	}

	public void setTourInfoName(String tourInfoName) {
		this.tourInfoName = tourInfoName;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public char getHasTicket() {
		return hasTicket;
	}

	public void setHasTicket(char hasTicket) {
		this.hasTicket = hasTicket;
	}

	public String getAdultPrice() {
		return adultPrice;
	}

	public void setAdultPrice(String adultPrice) {
		this.adultPrice = adultPrice;
	}

	public String getChildPrice() {
		return childPrice;
	}

	public void setChildPrice(String childPrice) {
		this.childPrice = childPrice;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getImgServiceOriginalFileName() {
		return imgServiceOriginalFileName;
	}

	public void setImgServiceOriginalFileName(String imgServiceOriginalFileName) {
		this.imgServiceOriginalFileName = imgServiceOriginalFileName;
	}

	@Override
	public String toString() {
		return "TourInfo [tourInfoId=" + tourInfoId + ", tourInfoName=" + tourInfoName
				+ ", categoryId=" + categoryId + ", serviceType=" + serviceType + ", hasTicket=" + hasTicket
				+ ", adultPrice=" + adultPrice + ", childPrice=" + childPrice + ", lat=" + lat + ", longitude="
				+ longitude + ", imgServiceOriginalFileName=" + imgServiceOriginalFileName + "]";
	}

	
	
	
	
	
}
