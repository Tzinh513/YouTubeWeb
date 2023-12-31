package com.poly.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.poly.dao.AbstractDao;
import com.poly.dao.StatsDao;
import com.poly.dto.VideoLikedInfo;



public class StatsDaoImpl extends AbstractDao<Object[]> implements StatsDao{

	@Override
	public List<VideoLikedInfo> findVideoLikedInfo() {
		// TODO Auto-generated method stub
		String sql = "select v.id, v.title, v.href, sum(CAST(h.isLiked as int)) as totalLike "
				+ "from video v left join history h on v.id = h.videoId "
				+ "where v.isActive=1 "
				+ "group by v.id, v.title, v.href "
				+ "order by sum(CAST(h.isLiked as int)) desc";
		List<Object[]> objects = super.findManyByNativeQuery(sql);
		List<VideoLikedInfo> result = new ArrayList<>();
		objects.forEach(object ->{
			VideoLikedInfo videoLikeInfo = setDataVideoLikeInfo(object);
//			videoLikeInfo.setVideoId((Integer)object[0]);
//			videoLikeInfo.setTitle((String) object[1]);
//			videoLikeInfo.setHref((String) object[2]);
//			videoLikeInfo.setTotalLike((Integer) object[3]);
			result.add(videoLikeInfo);
		});
		return result;
	}
	
	private VideoLikedInfo setDataVideoLikeInfo(Object[] object) {
		VideoLikedInfo videoLikeInfo = new VideoLikedInfo();
		videoLikeInfo.setVideoId((Integer)object[0]);
		videoLikeInfo.setTitle((String) object[1]);
		videoLikeInfo.setHref((String) object[2]);
		videoLikeInfo.setTotalLike(object[3] == null ? 0 : (Integer) object[3]);
		return videoLikeInfo;
	}
}
