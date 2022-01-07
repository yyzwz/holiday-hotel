package cn.zwz.modules.dorm.serviceimpl;

import cn.zwz.modules.dorm.mapper.DormitoryOrderMapper;
import cn.zwz.modules.dorm.entity.DormitoryOrder;
import cn.zwz.modules.dorm.service.IDormitoryOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 民宿订单接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IDormitoryOrderServiceImpl extends ServiceImpl<DormitoryOrderMapper, DormitoryOrder> implements IDormitoryOrderService {

    @Autowired
    private DormitoryOrderMapper dormitoryOrderMapper;
}