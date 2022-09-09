package cn.zwz.hotel.serviceimpl;

import cn.zwz.hotel.mapper.DormitoryOrderMapper;
import cn.zwz.hotel.entity.DormitoryOrder;
import cn.zwz.hotel.service.IDormitoryOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 民宿订单接口实现
 * @author 郑为中
 */
@Service
@Transactional
public class IDormitoryOrderServiceImpl extends ServiceImpl<DormitoryOrderMapper, DormitoryOrder> implements IDormitoryOrderService {

}