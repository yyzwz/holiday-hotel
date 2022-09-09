package cn.zwz.hotel.controller;

import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.hotel.entity.Dormitory;
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
@Api(tags = "民宿管理")
@RequestMapping("/zwz/dormitory")
@Transactional
public class DormitoryController {

    @Autowired
    private IDormitoryService iDormitoryService;

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ApiOperation(value = "查询单个民宿")
    public Result<Dormitory> get(@RequestParam String id){
        return new ResultUtil<Dormitory>().setData(iDormitoryService.getById(id));
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部民宿")
    public Result<List<Dormitory>> getAll(){
        return new ResultUtil<List<Dormitory>>().setData(iDormitoryService.list());
    }

    @RequestMapping(value = "/getByTitle", method = RequestMethod.GET)
    @ApiOperation(value = "根据标题查询民宿")
    public Result<List<Dormitory>> getByTitle(@RequestParam String title){
        QueryWrapper<Dormitory> qw = new QueryWrapper<>();
        qw.like("title",title);
        return new ResultUtil<List<Dormitory>>().setData(iDormitoryService.list(qw));
    }

    @RequestMapping(value = "/getCount", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部民宿个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iDormitoryService.count());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询民宿")
    public Result<IPage<Dormitory>> getByPage(@ModelAttribute Dormitory dormitory,@ModelAttribute PageVo page){
        QueryWrapper<Dormitory> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(dormitory.getTitle())) {
            qw.like("title",dormitory.getTitle());
        }
        if(!ZwzNullUtils.isNull(dormitory.getType())) {
            qw.eq("type",dormitory.getType());
        }
        if(!ZwzNullUtils.isNull(dormitory.getBreakfast())) {
            qw.eq("breakfast",dormitory.getBreakfast());
        }
        IPage<Dormitory> data = iDormitoryService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<Dormitory>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增加民宿")
    public Result<Dormitory> saveOrUpdate(Dormitory dormitory){
        if(iDormitoryService.saveOrUpdate(dormitory)){
            return new ResultUtil<Dormitory>().setData(dormitory);
        }
        return new ResultUtil<Dormitory>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增民宿")
    public Result<Dormitory> insert(Dormitory dormitory){
        if(iDormitoryService.saveOrUpdate(dormitory)){
            return new ResultUtil<Dormitory>().setData(dormitory);
        }
        return new ResultUtil<Dormitory>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑民宿")
    public Result<Dormitory> update(Dormitory dormitory){
        if(iDormitoryService.saveOrUpdate(dormitory)){
            return new ResultUtil<Dormitory>().setData(dormitory);
        }
        return new ResultUtil<Dormitory>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除民宿")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iDormitoryService.removeById(id);
        }
        return ResultUtil.success();
    }
}
