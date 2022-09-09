package cn.zwz.hotel.controller;

import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.hotel.entity.DormitoryNews;
import cn.zwz.hotel.service.IDormitoryNewsService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "民宿新闻")
@RequestMapping("/zwz/dormitoryNews")
@Transactional
public class DormitoryNewsController {

    @Autowired
    private IDormitoryNewsService iDormitoryNewsService;

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条民宿新闻")
    public Result<DormitoryNews> get(@RequestParam String id){
        DormitoryNews DormitoryNews = iDormitoryNewsService.getById(id);
        return new ResultUtil<DormitoryNews>().setData(DormitoryNews);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部民宿新闻")
    public Result<List<DormitoryNews>> getAll(){

        List<DormitoryNews> list = iDormitoryNewsService.list();
        return new ResultUtil<List<DormitoryNews>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询民宿新闻")
    public Result<IPage<DormitoryNews>> getByPage(@ModelAttribute DormitoryNews dormitoryNews,@ModelAttribute PageVo page){
        QueryWrapper<DormitoryNews> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(dormitoryNews.getNewTitle())) {
            qw.like("new_title",dormitoryNews.getNewTitle());
        }
        if(!ZwzNullUtils.isNull(dormitoryNews.getNewDescribe())) {
            qw.like("new_describe",dormitoryNews.getNewDescribe());
        }
        if(!ZwzNullUtils.isNull(dormitoryNews.getPeriodTime())) {
            qw.like("period_time",dormitoryNews.getPeriodTime());
        }
        if(!ZwzNullUtils.isNull(dormitoryNews.getIsPublic())) {
            qw.like("is_public",dormitoryNews.getIsPublic());
        }
        if(!ZwzNullUtils.isNull(dormitoryNews.getIsTop())) {
            qw.like("is_top",dormitoryNews.getIsTop());
        }
        IPage<DormitoryNews> data = iDormitoryNewsService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<DormitoryNews>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改民宿新闻")
    public Result<DormitoryNews> saveOrUpdate(DormitoryNews DormitoryNews){
        if(iDormitoryNewsService.saveOrUpdate(DormitoryNews)){
            return new ResultUtil<DormitoryNews>().setData(DormitoryNews);
        }
        return new ResultUtil<DormitoryNews>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增民宿新闻")
    public Result<DormitoryNews> insert(DormitoryNews DormitoryNews){
        if(iDormitoryNewsService.saveOrUpdate(DormitoryNews)){
            return new ResultUtil<DormitoryNews>().setData(DormitoryNews);
        }
        return new ResultUtil<DormitoryNews>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "增改民宿新闻")
    public Result<DormitoryNews> update(DormitoryNews DormitoryNews){
        if(iDormitoryNewsService.saveOrUpdate(DormitoryNews)){
            return new ResultUtil<DormitoryNews>().setData(DormitoryNews);
        }
        return new ResultUtil<DormitoryNews>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除民宿新闻")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iDormitoryNewsService.removeById(id);
        }
        return ResultUtil.success();
    }

    @RequestMapping(value = "/set_top_by_id", method = RequestMethod.POST)
    @ApiOperation(value = "置顶民宿新闻")
    public Result<Boolean> setTopById(@RequestParam String id){
        DormitoryNews appDynamicNew=iDormitoryNewsService.getById(id);
        if(appDynamicNew==null) {
            return ResultUtil.error("该民宿新闻不存在");
        }
        if(Objects.equals("yes",appDynamicNew.getIsTop())) {
            appDynamicNew.setIsTop("no");
        }
        else {
            appDynamicNew.setIsTop("yes");
        }
        if(!iDormitoryNewsService.saveOrUpdate(appDynamicNew)) {
            return ResultUtil.error("设置失败");
        }
        return ResultUtil.success("设置成功");
    }

    @RequestMapping(value = "/set_public_by_id", method = RequestMethod.POST)
    @ApiOperation(value = "公开民宿新闻")
    public Result<Boolean> setPublicById(@RequestParam String id){
        DormitoryNews appDynamicNew=iDormitoryNewsService.getById(id);
        if(appDynamicNew==null) {
            return ResultUtil.error("该民宿新闻不存在");
        }
        if(Objects.equals("yes",appDynamicNew.getIsPublic())) {
            appDynamicNew.setIsPublic("no");
        } else {
            appDynamicNew.setIsPublic("yes");
        }
        if(!iDormitoryNewsService.saveOrUpdate(appDynamicNew)) {
            return ResultUtil.error("设置失败");
        }
        return ResultUtil.success("设置成功");
    }
}
