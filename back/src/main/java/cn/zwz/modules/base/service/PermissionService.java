package cn.zwz.modules.base.service;

import cn.zwz.base.ZwzBaseService;
import cn.zwz.modules.base.entity.Permission;

import java.util.List;

/**
 * 权限接口
 * @author 郑为中
 */
public interface PermissionService extends ZwzBaseService<Permission,String> {

    /**
     * 通过层级查找
     * 默认升序
     * @param level
     * @return
     */
    List<Permission> findByLevelOrderBySortOrder(Integer level);

    /**
     * 通过parendId查找
     * @param parentId
     * @return
     */
    List<Permission> findByParentIdOrderBySortOrder(String parentId);

    /**
     * 通过类型和状态获取
     * @param type
     * @param status
     * @return
     */
    List<Permission> findByTypeAndStatusOrderBySortOrder(Integer type, Integer status);

    /**
     * 通过名称获取
     * @param title
     * @return
     */
    List<Permission> findByTitle(String title);

    /**
     * 模糊搜索
     * @param title
     * @return
     */
    List<Permission> findByTitleLikeOrderBySortOrder(String title);
}