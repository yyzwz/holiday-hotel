package cn.zwz.hotel.serviceimpl;

import cn.zwz.hotel.mapper.DormitoryNewsMapper;
import cn.zwz.hotel.entity.DormitoryNews;
import cn.zwz.hotel.service.IDormitoryNewsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 民宿新闻接口实现
 * @author 郑为中
 */
@Service
@Transactional
public class IDormitoryNewsServiceImpl extends ServiceImpl<DormitoryNewsMapper, DormitoryNews> implements IDormitoryNewsService {
}