package serviceImpl;

import java.util.List;

import DaoImpl.StatsDAOImpl;
import dao.StatsDAO;
import dto.VideoLikedInfo;
import service.StatsService;

public class StatsServiceImpl implements StatsService {
	private StatsDAO statsDAO;

	public StatsServiceImpl() {
		statsDAO = new StatsDAOImpl();
	}

	@Override
	public List<VideoLikedInfo> findVideoLikedInfo() {
		//Goi ham Dao tao de su dung

		return statsDAO.findVideoLikedInfo();
	}
}
