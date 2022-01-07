package cn.zwz.modules.dorm.entity;

import cn.zwz.base.ZwzBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * @author 郑为中
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "t_dormitory")
@TableName("t_dormitory")
@ApiModel(value = "民宿")
public class Dormitory extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "民宿名称")
    private String title;

    @ApiModelProperty(value = "面积")
    private String areaSize;

    @ApiModelProperty(value = "房间类型")
    private String type;

    @ApiModelProperty(value = "早餐情况")
    private String breakfast;

    @ApiModelProperty(value = "价格")
    private BigDecimal price;

    @ApiModelProperty(value = "备注")
    private String remark;
}