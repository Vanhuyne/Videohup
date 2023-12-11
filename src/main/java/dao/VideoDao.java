package dao;

import java.util.List;

import entity.Video;

public interface VideoDao {
	Video findByID(Integer id);

	Video findByHref(String href);

	List<Video> findAll();

	List<Video> findAll(int pageNumber, int pageSize);

	Video create(Video entity);

	Video update(Video entity);

	Video delete(Video entity);
}
