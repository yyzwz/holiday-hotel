package cn.zwz.hotel.entity;

import cn.zwz.basics.baseClass.ZwzBaseEntity;
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
@Table(name = "a_dormitory_order")
@TableName("a_dormitory_order")
@ApiModel(value = "民宿订单")
public class DormitoryOrder extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "宿舍ID")
    private String dormitoryId;

    @ApiModelProperty(value = "宿舍")
    private String dormitoryName;

    @ApiModelProperty(value = "预定日期")
    private String orderDate;

    @ApiModelProperty(value = "下单时间")
    private String orderTime;

    @ApiModelProperty(value = "下单人")
    private String userName;

    @ApiModelProperty(value = "下单人ID")
    private String userId;

    @ApiModelProperty(value = "价格")
    private BigDecimal price;

    @ApiModelProperty(value = "是否付款")
    private String payFlag;

    @ApiModelProperty(value = "下单备注")
    private String remark;
}