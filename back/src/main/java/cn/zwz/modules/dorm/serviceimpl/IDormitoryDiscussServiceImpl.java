package cn.zwz.modules.dorm.serviceimpl;

import cn.zwz.modules.dorm.mapper.DormitoryDiscussMapper;
import cn.zwz.modules.dorm.entity.DormitoryDiscuss;
import cn.zwz.modules.dorm.service.IDormitoryDiscussService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 民宿评论接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IDormitoryDiscussServiceImpl extends ServiceImpl<DormitoryDiscussMapper, DormitoryDiscuss> implements IDormitoryDiscussService {

    @Autowired
    private DormitoryDiscussMapper dormitoryDiscussMapper;
}