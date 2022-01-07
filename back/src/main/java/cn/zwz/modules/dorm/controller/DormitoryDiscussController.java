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
import cn.zwz.modules.dorm.entity.DormitoryDiscuss;
import cn.zwz.modules.dorm.service.IDormitoryDiscussService;
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
@Api(description = "民宿评论管理接口")
@RequestMapping("/zwz/dormitoryDiscuss")
@Transactional
public class DormitoryDiscussController {

    @Autowired
    private IDormitoryDiscussService iDormitoryDiscussService;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private IDormitoryService iDormitoryService;

    @RequestMapping(value = "/addMyDiscuss", method = RequestMethod.POST)
    @ApiOperation(value = "新增评论")
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
        return ResultUtil.success("OK");
    }

    @RequestMapping(value = "/getAllDiscuss", method = RequestMethod.GET)
    @ApiOperation(value = "查询评论")
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
    @ApiOperation(value = "分页获取")
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

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<DormitoryDiscuss> get(@PathVariable String id){

        DormitoryDiscuss dormitoryDiscuss = iDormitoryDiscussService.getById(id);
        return new ResultUtil<DormitoryDiscuss>().setData(dormitoryDiscuss);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<DormitoryDiscuss>> getAll(){

        List<DormitoryDiscuss> list = iDormitoryDiscussService.list();
        return new ResultUtil<List<DormitoryDiscuss>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
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
    @ApiOperation(value = "编辑或更新数据")
    public Result<DormitoryDiscuss> saveOrUpdate(DormitoryDiscuss dormitoryDiscuss){

        if(iDormitoryDiscussService.saveOrUpdate(dormitoryDiscuss)){
            return new ResultUtil<DormitoryDiscuss>().setData(dormitoryDiscuss);
        }
        return new ResultUtil<DormitoryDiscuss>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iDormitoryDiscussService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
}
