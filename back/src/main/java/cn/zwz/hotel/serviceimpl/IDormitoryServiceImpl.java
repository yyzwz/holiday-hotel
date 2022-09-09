package cn.zwz.hotel.serviceimpl;

import cn.zwz.hotel.mapper.DormitoryMapper;
import cn.zwz.hotel.entity.Dormitory;
import cn.zwz.hotel.service.IDormitoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 民宿接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IDormitoryServiceImpl extends ServiceImpl<DormitoryMapper, Dormitory> implements IDormitoryService {

}