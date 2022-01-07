package cn.zwz.modules.dorm.controller;

import cn.zwz.common.utils.PageUtil;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.vo.PageVo;
import cn.zwz.common.vo.Result;
import cn.zwz.modules.base.utils.ZwzNullUtils;
import cn.zwz.modules.dorm.entity.Dormitory;
import cn.zwz.modules.dorm.service.IDormitoryService;
import cn.hutool.core.util.StrUtil;
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
@Api(description = "民宿管理接口")
@RequestMapping("/zwz/dormitory")
@Transactional
public class DormitoryController {

    @Autowired
    private IDormitoryService iDormitoryService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Dormitory> get(@PathVariable String id){

        Dormitory dormitory = iDormitoryService.getById(id);
        return new ResultUtil<Dormitory>().setData(dormitory);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<Dormitory>> getAll(){

        List<Dormitory> list = iDormitoryService.list();
        return new ResultUtil<List<Dormitory>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
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
    @ApiOperation(value = "编辑或更新数据")
    public Result<Dormitory> saveOrUpdate(Dormitory dormitory){

        if(iDormitoryService.saveOrUpdate(dormitory)){
            return new ResultUtil<Dormitory>().setData(dormitory);
        }
        return new ResultUtil<Dormitory>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iDormitoryService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
}
