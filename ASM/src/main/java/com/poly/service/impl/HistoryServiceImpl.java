package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDao;
import com.poly.dao.impl.HistoryDaoImpl;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl implements HistoryService {

	private HistoryDao dao;
	private VideoService videoService = new VideoServiceImpl();
	
	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}
	
	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}

	@Override
	public List<History> findUserAndIsLiked(String username) {
		// TODO Auto-generated method stub
		return dao.findUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		// TODO Auto-generated method stub
		History extstHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if (extstHistory == null) {
			extstHistory = new History();
			extstHistory.setUser(user);
			extstHistory.setVideo(video);
			extstHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
			extstHistory.setIsLiked(Boolean.FALSE);
			return dao.create(extstHistory);
		}
		

		return extstHistory;
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String videoHref) {
		// TODO Auto-generated method stub
		Video video = videoService.findByHref(videoHref);
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if (existHistory.getIsLiked() == Boolean.FALSE) {
			existHistory.setIsLiked(Boolean.TRUE);
			existHistory.setLikedDate(new Timestamp(System.currentTimeMillis()));
		} else {
			existHistory.setIsLiked(Boolean.FALSE);
			existHistory.setLikedDate(null);
		}
		History updatedHistory = dao.update(existHistory);
		
		return updatedHistory != null ? true : false;
	}

	
}
