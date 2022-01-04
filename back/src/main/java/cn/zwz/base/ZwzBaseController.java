package cn.zwz.base;

import cn.zwz.common.utils.PageUtil;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.vo.PageVo;
import cn.zwz.common.vo.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;
import java.util.List;

/**
 * @author 郑为中
 */
public abstract class ZwzBaseController<E, ID extends Serializable> {

    /**
     * 获取service
     * @return
     */
    @Autowired
    public abstract ZwzBaseService<E,ID> getService();

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "通过id获取")
    public Result<E> get(@PathVariable ID id){

        E entity = getService().get(id);
        return new ResultUtil<E>().setData(entity);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取全部数据")
    public Result<List<E>> getAll(){

        List<E> list = getService().getAll();
        return new ResultUtil<List<E>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "分页获取")
    public Result<Page<E>> getByPage(PageVo page){

        Page<E> data = getService().findAll(PageUtil.initPage(page));
        return new ResultUtil<Page<E>>().setData(data);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "保存数据")
    public Result<E> save(E entity){

        E e = getService().save(entity);
        return new ResultUtil<E>().setData(e);
    }

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    @ApiOperation(value = "更新数据")
    public Result<E> update(E entity){

        E e = getService().update(entity);
        return new ResultUtil<E>().setData(e);
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delByIds(@RequestParam ID[] ids){

        for(ID id:ids){
            getService().delete(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
}
