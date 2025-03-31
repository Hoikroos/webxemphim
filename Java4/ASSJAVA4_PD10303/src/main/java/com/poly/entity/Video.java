package com.poly.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Video")
@NamedQueries({ @NamedQuery(name = "Video.findAll", query = "SELECT v FROM Video v"),
		@NamedQuery(name = "Video.findAllActive", query = "SELECT v FROM Video v WHERE v.active = true"),
		@NamedQuery(name = "Video.findAllWithLikeCount", query = "SELECT v.title, COUNT(f) AS likeCount, MIN(f.likeDate) AS firstLikeDate, MAX(f.likeDate) AS lastLikeDate "
				+ "FROM Video v LEFT JOIN Favorite f ON v.id = f.video.id " + "GROUP BY v.id, v.title"),

		@NamedQuery(name = "Video.findByTitleWithLikeCount", query = "SELECT v.title, COUNT(f) AS likeCount, v.active "
				+ "FROM Video v LEFT JOIN Favorite f ON v.id = f.video.id " + "WHERE v.title LIKE :title "
				+ "GROUP BY v.id, v.title, v.active"),
		@NamedQuery(name = "Video.findLikedVideosByUserId", query = "SELECT v FROM Favorite f JOIN f.video v WHERE f.user.id = :userId") })
public class Video {
	@Id
	private String id;
	private String title;
	private String poster;
	private String description;
	private boolean active;
	private int views;
	private String nationals;
	private String director;
	private String performer;
	private Integer years;
	private String videoFile;
	@OneToMany(mappedBy = "video")
	private List<Favorite> favorite;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CategoryId", nullable = false)
	private Category category;

	public Video() {
	}

	
	public Video(String id, String title, String poster, String description, boolean active, int views,
			String nationals, String director, String performer, Integer years, String videoFile,
			List<Favorite> favorite, Category category) {
		super();
		this.id = id;
		this.title = title;
		this.poster = poster;
		this.description = description;
		this.active = active;
		this.views = views;
		this.nationals = nationals;
		this.director = director;
		this.performer = performer;
		this.years = years;
		this.videoFile = videoFile;
		this.favorite = favorite;
		this.category = category;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPoster() {
		return poster;
	}


	public void setPoster(String poster) {
		this.poster = poster;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public int getViews() {
		return views;
	}


	public void setViews(int views) {
		this.views = views;
	}


	public String getNationals() {
		return nationals;
	}


	public void setNationals(String nationals) {
		this.nationals = nationals;
	}


	public String getDirector() {
		return director;
	}


	public void setDirector(String director) {
		this.director = director;
	}


	public String getPerformer() {
		return performer;
	}


	public void setPerformer(String performer) {
		this.performer = performer;
	}


	public Integer getYears() {
		return years;
	}


	public void setYears(Integer years) {
		this.years = years;
	}


	public String getVideoFile() {
		return videoFile;
	}


	public void setVideoFile(String videoFile) {
		this.videoFile = videoFile;
	}


	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Favorite> getFavorite() {
		return favorite;
	}

	public void setFavorite(List<Favorite> favorite) {
		this.favorite = favorite;
	}

}