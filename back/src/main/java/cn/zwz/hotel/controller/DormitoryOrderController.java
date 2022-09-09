package cn.zwz.hotel.controller;

import cn.hutool.core.date.DateUtil;
import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.basics.utils.SecurityUtil;
import cn.zwz.data.entity.User;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.hotel.entity.Dormitory;
import cn.zwz.hotel.entity.DormitoryOrder;
import cn.zwz.hotel.service.IDormitoryOrderService;
import cn.zwz.hotel.service.IDormitoryService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "民宿预订单")
@RequestMapping("/zwz/dormitoryOrder")
@Transactional
public class DormitoryOrderController {

    @Autowired
    private IDormitoryOrderService iDormitoryOrderService;

    @Autowired
    private IDormitoryService iDormitoryService;

    @Autowired
    private SecurityUtil securityUtil;

    @RequestMapping(value = "/addMyOrder", method = RequestMethod.POST)
    @ApiOperation(value = "新建民宿预订单")
    public Result<Object> addMyOrder(@RequestParam String id,@RequestParam String date){
        Dormitory dormitory = iDormitoryService.getById(id);
        if(dormitory == null) {
            return ResultUtil.error("民宿不存在");
        }
        QueryWrapper<DormitoryOrder> qw = new QueryWrapper<>();
        qw.eq("dormitory_id",id);
        qw.eq("order_date",date);
        long count = iDormitoryOrderService.count(qw);
        if(count > 0) {
            return ResultUtil.error("民宿当日已被预定");
        }
        User currUser = securityUtil.getCurrUser();
        DormitoryOrder order = new DormitoryOrder();
        order.setUserId(currUser.getId());
        order.setUserName(currUser.getNickname());
        order.setOrderTime(DateUtil.now());
        order.setPayFlag("否");
        order.setDormitoryId(dormitory.getId());
        order.setPrice(dormitory.getPrice());
        order.setRemark("");
        order.setDormitoryName(dormitory.getTitle());
        order.setOrderDate(date);
        iDormitoryOrderService.saveOrUpdate(order);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条民宿预订单")
    public Result<DormitoryOrder> get(@RequestParam String id){
        return new ResultUtil<DormitoryOrder>().setData(iDormitoryOrderService.getById(id));
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部民宿预订单")
    public Result<List<DormitoryOrder>> getAll(){
        return new ResultUtil<List<DormitoryOrder>>().setData(iDormitoryOrderService.list());
    }

    @RequestMapping(value = "/getCount", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部民宿预订单个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iDormitoryOrderService.count());
    }

    @RequestMapping(value = "/getMyPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询我的民宿预订单")
    public Result<IPage<DormitoryOrder>> getMyPage(@ModelAttribute DormitoryOrder order,@ModelAttribute PageVo page){
        User currUser = securityUtil.getCurrUser();
        QueryWrapper<DormitoryOrder> qw = new QueryWrapper<>();
        qw.eq("user_id",currUser.getId());
        if(!ZwzNullUtils.isNull(order.getDormitoryId())) {
            qw.eq("dormitory_id",order.getDormitoryId());
        }
        if(!ZwzNullUtils.isNull(order.getUserName())) {
            qw.eq("user_name",order.getUserName());
        }
        IPage<DormitoryOrder> data = iDormitoryOrderService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<DormitoryOrder>>().setData(data);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询民宿预订单")
    public Result<IPage<DormitoryOrder>> getByPage(@ModelAttribute DormitoryOrder order,@ModelAttribute PageVo page){
        QueryWrapper<DormitoryOrder> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(order.getDormitoryId())) {
            qw.eq("dormitory_id",order.getDormitoryId());
        }
        if(!ZwzNullUtils.isNull(order.getUserId())) {
            qw.eq("user_id",order.getUserId());
        }
        if(!ZwzNullUtils.isNull(order.getUserName())) {
            qw.eq("user_name",order.getUserName());
        }
        IPage<DormitoryOrder> data = iDormitoryOrderService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<DormitoryOrder>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改民宿预订单")
    public Result<DormitoryOrder> saveOrUpdate(DormitoryOrder dormitoryOrder){
        if(iDormitoryOrderService.saveOrUpdate(dormitoryOrder)){
            return new ResultUtil<DormitoryOrder>().setData(dormitoryOrder);
        }
        return new ResultUtil<DormitoryOrder>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增民宿预订单")
    public Result<DormitoryOrder> insert(DormitoryOrder dormitoryOrder){
        if(iDormitoryOrderService.saveOrUpdate(dormitoryOrder)){
            return new ResultUtil<DormitoryOrder>().setData(dormitoryOrder);
        }
        return new ResultUtil<DormitoryOrder>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑民宿预订单")
    public Result<DormitoryOrder> update(DormitoryOrder dormitoryOrder){
        if(iDormitoryOrderService.saveOrUpdate(dormitoryOrder)){
            return new ResultUtil<DormitoryOrder>().setData(dormitoryOrder);
        }
        return new ResultUtil<DormitoryOrder>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除民宿预订单")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iDormitoryOrderService.removeById(id);
        }
        return ResultUtil.success();
    }

    @RequestMapping(value = "/payOrder", method = RequestMethod.POST)
    @ApiOperation(value = "民宿预订单付款")
    public Result<Object> payOrder(@RequestParam String id){
        DormitoryOrder order = iDormitoryOrderService.getById(id);
        if(!order.getPayFlag().equals("是")) {
            order.setPayFlag("是");
            iDormitoryOrderService.saveOrUpdate(order);
            return ResultUtil.success();
        }
        return ResultUtil.error("已付款,请勿重复支付");
    }
}
