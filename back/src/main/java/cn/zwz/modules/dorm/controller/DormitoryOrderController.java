package cn.zwz.modules.dorm.controller;

import cn.hutool.core.date.DateUtil;
import cn.zwz.common.utils.PageUtil;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.utils.SecurityUtil;
import cn.zwz.common.vo.PageVo;
import cn.zwz.common.vo.Result;
import cn.zwz.modules.base.entity.User;
import cn.zwz.modules.base.utils.ZwzNullUtils;
import cn.zwz.modules.dorm.entity.Dormitory;
import cn.zwz.modules.dorm.entity.DormitoryOrder;
import cn.zwz.modules.dorm.service.IDormitoryOrderService;
import cn.hutool.core.util.StrUtil;
import cn.zwz.modules.dorm.service.IDormitoryService;
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
@Api(description = "民宿订单管理接口")
@RequestMapping("/zwz/dormitoryOrder")
@Transactional
public class DormitoryOrderController {

    @Autowired
    private IDormitoryOrderService iDormitoryOrderService;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private IDormitoryService iDormitoryService;

    @RequestMapping(value = "/addMyOrder", method = RequestMethod.POST)
    @ApiOperation(value = "新建订单")
    public Result<Object> addMyOrder(@RequestParam String id,@RequestParam String date){
        Dormitory dormitory = iDormitoryService.getById(id);
        if(dormitory == null) {
            return ResultUtil.error("民宿不存在");
        }
        QueryWrapper<DormitoryOrder> qw = new QueryWrapper<>();
        qw.eq("dormitory_id",id);
        qw.eq("order_date",date);
        long count = iDormitoryOrderService.count();
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

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<DormitoryOrder> get(@PathVariable String id){

        DormitoryOrder dormitoryOrder = iDormitoryOrderService.getById(id);
        return new ResultUtil<DormitoryOrder>().setData(dormitoryOrder);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<DormitoryOrder>> getAll(){

        List<DormitoryOrder> list = iDormitoryOrderService.list();
        return new ResultUtil<List<DormitoryOrder>>().setData(list);
    }

    @RequestMapping(value = "/getMyPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
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
    @ApiOperation(value = "分页获取")
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
    @ApiOperation(value = "编辑或更新数据")
    public Result<DormitoryOrder> saveOrUpdate(DormitoryOrder dormitoryOrder){

        if(iDormitoryOrderService.saveOrUpdate(dormitoryOrder)){
            return new ResultUtil<DormitoryOrder>().setData(dormitoryOrder);
        }
        return new ResultUtil<DormitoryOrder>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iDormitoryOrderService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }

    @RequestMapping(value = "/payOrder", method = RequestMethod.POST)
    @ApiOperation(value = "订单付款")
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
