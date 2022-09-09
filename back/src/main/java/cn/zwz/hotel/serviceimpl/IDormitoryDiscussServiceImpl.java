package cn.zwz.hotel.serviceimpl;

import cn.zwz.hotel.mapper.DormitoryDiscussMapper;
import cn.zwz.hotel.entity.DormitoryDiscuss;
import cn.zwz.hotel.service.IDormitoryDiscussService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 民宿评论接口实现
 * @author 郑为中
 */
@Service
@Transactional
public class IDormitoryDiscussServiceImpl extends ServiceImpl<DormitoryDiscussMapper, DormitoryDiscuss> implements IDormitoryDiscussService {

}