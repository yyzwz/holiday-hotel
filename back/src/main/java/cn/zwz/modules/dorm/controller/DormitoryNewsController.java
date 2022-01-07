package cn.zwz.modules.dorm.controller;

import cn.zwz.common.utils.PageUtil;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.vo.PageVo;
import cn.zwz.common.vo.Result;
import cn.zwz.modules.dorm.entity.DormitoryNews;
import cn.zwz.modules.dorm.service.IDormitoryNewsService;
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
@RequestMapping("/zwz/dormitoryNews")
@Transactional
public class DormitoryNewsController {

    @Autowired
    private IDormitoryNewsService iDormitoryNewsService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<DormitoryNews> get(@PathVariable String id){

        DormitoryNews DormitoryNews = iDormitoryNewsService.getById(id);
        return new ResultUtil<DormitoryNews>().setData(DormitoryNews);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<DormitoryNews>> getAll(){

        List<DormitoryNews> list = iDormitoryNewsService.list();
        return new ResultUtil<List<DormitoryNews>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<DormitoryNews>> getByPage(PageVo page){

        IPage<DormitoryNews> data = iDormitoryNewsService.page(PageUtil.initMpPage(page));
        return new ResultUtil<IPage<DormitoryNews>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<DormitoryNews> saveOrUpdate(DormitoryNews DormitoryNews){

        if(iDormitoryNewsService.saveOrUpdate(DormitoryNews)){
            return new ResultUtil<DormitoryNews>().setData(DormitoryNews);
        }
        return new ResultUtil<DormitoryNews>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iDormitoryNewsService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }

    @RequestMapping(value = "/set_top_by_id", method = RequestMethod.POST)
    @ApiOperation(value = "设置置顶")
    public Result<Boolean> setTopById(@RequestParam String id){
        DormitoryNews appDynamicNew=iDormitoryNewsService.getById(id);
        if(appDynamicNew==null) {
            return ResultUtil.error("该动态信息不存在");
        }
        if(appDynamicNew.getIsTop().equals("yes")) {
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
    @ApiOperation(value = "设置公开")
    public Result<Boolean> setPublicById(@RequestParam String id){
        DormitoryNews appDynamicNew=iDormitoryNewsService.getById(id);
        if(appDynamicNew==null) {
            return ResultUtil.error("该动态信息不存在");
        }
        if(appDynamicNew.getIsPublic().equals("yes")) {
            appDynamicNew.setIsPublic("no");
        }
        else {
            appDynamicNew.setIsPublic("yes");
        }
        if(!iDormitoryNewsService.saveOrUpdate(appDynamicNew)) {
            return ResultUtil.error("设置失败");
        }
        return ResultUtil.success("设置成功");
    }
}
