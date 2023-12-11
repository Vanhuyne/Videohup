package dao;

import java.util.List;

import dto.VideoLikedInfo;
public interface StatsDAO {
	List<VideoLikedInfo> findVideoLikedInfo ();
}
