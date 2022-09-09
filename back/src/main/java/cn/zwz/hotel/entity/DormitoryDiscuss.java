package cn.zwz.hotel.entity;

import cn.zwz.basics.baseClass.ZwzBaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author 郑为中
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "a_dormitory_discuss")
@TableName("a_dormitory_discuss")
@ApiModel(value = "民宿评论")
public class DormitoryDiscuss extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "宿舍ID")
    private String dormitoryId;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "宿舍名称")
    private String dormitoryName;

    @ApiModelProperty(value = "评论时间")
    private String discussTime;

    @ApiModelProperty(value = "评论内容")
    private String content;

    @ApiModelProperty(value = "评论人")
    private String userName;

    @ApiModelProperty(value = "评论人ID")
    private String userId;

    @ApiModelProperty(value = "回复ID")
    private String reply;
}