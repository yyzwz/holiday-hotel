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
import cn.zwz.hotel.entity.DormitoryDiscuss;
import cn.zwz.hotel.service.IDormitoryDiscussService;
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
@Api(tags = "民宿评论")
@RequestMapping("/zwz/dormitoryDiscuss")
@Transactional
public class DormitoryDiscussController {

    @Autowired
    private IDormitoryDiscussService iDormitoryDiscussService;

    @Autowired
    private IDormitoryService iDormitoryService;

    @Autowired
    private SecurityUtil securityUtil;

    @RequestMapping(value = "/addMyDiscuss", method = RequestMethod.POST)
    @ApiOperation(value = "新增民宿评论")
    public Result<Object> addMyDiscuss(@RequestParam String id,@RequestParam String reply,@RequestParam String text){
        Dormitory dormitory = iDormitoryService.getById(id);
        if(dormitory == null) {
            return ResultUtil.error("民宿不存在");
        }
        User currUser = securityUtil.getCurrUser();
        DormitoryDiscuss discuss = new DormitoryDiscuss();
        discuss.setUserId(currUser.getId());
        discuss.setUserName(currUser.getNickname());
        discuss.setReply(reply);
        discuss.setDormitoryId(dormitory.getId());
        discuss.setDiscussTime(DateUtil.now());
        discuss.setContent(text);
        iDormitoryDiscussService.saveOrUpdate(discuss);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/getAllDiscuss", method = RequestMethod.GET)
    @ApiOperation(value = "查询民宿评论")
    public Result<List<DormitoryDiscuss>> getAllDiscuss(@ModelAttribute DormitoryDiscuss discuss){
        QueryWrapper<DormitoryDiscuss> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(discuss.getDormitoryId())) {
            qw.eq("dormitory_id",discuss.getDormitoryId());
        }
        if(!ZwzNullUtils.isNull(discuss.getReply())) {
            qw.eq("reply",discuss.getReply());
        }
        List<DormitoryDiscuss> list = iDormitoryDiscussService.list(qw);
        return new ResultUtil<List<DormitoryDiscuss>>().setData(list);
    }

    @RequestMapping(value = "/getMyDiscuss", method = RequestMethod.GET)
    @ApiOperation(value = "查询我的民宿评论")
    public Result<IPage<DormitoryDiscuss>> getMyDiscuss(@ModelAttribute DormitoryDiscuss discuss,@ModelAttribute PageVo page){
        User currUser = securityUtil.getCurrUser();
        QueryWrapper<DormitoryDiscuss> qw = new QueryWrapper<>();
        qw.eq("user_id",currUser.getId());
        if(!ZwzNullUtils.isNull(discuss.getDormitoryId())) {
            qw.eq("dormitory_id",discuss.getDormitoryId());
        }
        if(!ZwzNullUtils.isNull(discuss.getContent())) {
            qw.like("content",discuss.getContent());
        }
        IPage<DormitoryDiscuss> data = iDormitoryDiscussService.page(PageUtil.initMpPage(page),qw);
        for (DormitoryDiscuss dis : data.getRecords()) {
            Dormitory dormitory = iDormitoryService.getById(dis.getDormitoryId());
            if(dormitory != null) {
                dis.setDormitoryName(dormitory.getTitle());
            }
        }
        return new ResultUtil<IPage<DormitoryDiscuss>>().setData(data);
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条民宿评论")
    public Result<DormitoryDiscuss> get(@RequestParam String id){
        return new ResultUtil<DormitoryDiscuss>().setData(iDormitoryDiscussService.getById(id));
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部民宿评论")
    public Result<List<DormitoryDiscuss>> getAll(){
        return new ResultUtil<List<DormitoryDiscuss>>().setData(iDormitoryDiscussService.list());
    }

    @RequestMapping(value = "/getCount", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部民宿评论个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iDormitoryDiscussService.count());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询民宿评论")
    public Result<IPage<DormitoryDiscuss>> getByPage(@ModelAttribute DormitoryDiscuss discuss,@ModelAttribute PageVo page){
        QueryWrapper<DormitoryDiscuss> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(discuss.getDormitoryId())) {
            qw.eq("dormitory_id",discuss.getDormitoryId());
        }
        if(!ZwzNullUtils.isNull(discuss.getReply())) {
            qw.eq("reply",discuss.getReply());
        }
        IPage<DormitoryDiscuss> data = iDormitoryDiscussService.page(PageUtil.initMpPage(page),qw);
        for (DormitoryDiscuss dis : data.getRecords()) {
            Dormitory dormitory = iDormitoryService.getById(dis.getDormitoryId());
            if(dormitory != null) {
                dis.setDormitoryName(dormitory.getTitle());
            }
        }
        return new ResultUtil<IPage<DormitoryDiscuss>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改民宿评论")
    public Result<DormitoryDiscuss> saveOrUpdate(DormitoryDiscuss dormitoryDiscuss){
        if(iDormitoryDiscussService.saveOrUpdate(dormitoryDiscuss)){
            return new ResultUtil<DormitoryDiscuss>().setData(dormitoryDiscuss);
        }
        return new ResultUtil<DormitoryDiscuss>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增民宿评论")
    public Result<DormitoryDiscuss> insert(DormitoryDiscuss dormitoryDiscuss){
        if(iDormitoryDiscussService.saveOrUpdate(dormitoryDiscuss)){
            return new ResultUtil<DormitoryDiscuss>().setData(dormitoryDiscuss);
        }
        return new ResultUtil<DormitoryDiscuss>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑民宿评论")
    public Result<DormitoryDiscuss> update(DormitoryDiscuss dormitoryDiscuss){
        if(iDormitoryDiscussService.saveOrUpdate(dormitoryDiscuss)){
            return new ResultUtil<DormitoryDiscuss>().setData(dormitoryDiscuss);
        }
        return new ResultUtil<DormitoryDiscuss>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除民宿评论")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iDormitoryDiscussService.removeById(id);
        }
        return ResultUtil.success();
    }
}
