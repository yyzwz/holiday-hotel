<template>
<div>
    <Card>
        <div slot="title">
            <div class="edit-head">
                <a @click="close" class="back-title">
                    <Icon type="ios-arrow-back" />返回
                </a>
                <div class="head-name">添加</div>
                <span></span>
                <a @click="close" class="window-close">
                    <Icon type="ios-close" size="31" class="ivu-icon-ios-close" />
                </a>
            </div>
        </div>
        <Form ref="form" :model="form" :label-width="100" :rules="formValidate" label-position="left">
            <FormItem label="民宿名称" prop="title">
                <Input v-model="form.title" clearable style="width:570px" />
            </FormItem>
            <FormItem label="面积" prop="areaSize">
                <Input v-model="form.areaSize" clearable style="width:570px" />
            </FormItem>
            <FormItem label="房间类型" prop="type">
                <Select v-model="form.type" clearable style="width:570px">
                    <Option value="单人间">单人间</Option>
                    <Option value="双人间">双人间</Option>
                    <Option value="套间">套间</Option>
                    <Option value="夫妻间">夫妻间</Option>
                </Select>
            </FormItem>
            <FormItem label="早餐情况" prop="breakfast">
                <Select v-model="form.breakfast" clearable style="width:570px">
                    <Option value="不含早餐">不含早餐</Option>
                    <Option value="含单人早餐">含单人早餐</Option>
                    <Option value="含双早">含双早</Option>
                    <Option value="其他">其他</Option>
                </Select>
            </FormItem>
            <FormItem label="价格" prop="price">
                <InputNumber v-model="form.price" min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="备注" prop="remark">
                <Input v-model="form.remark" clearable style="width:570px" />
            </FormItem>
            <Form-item class="br">
                <Button @click="handleSubmit" :loading="submitLoading" type="primary">提交并保存</Button>
                <Button @click="handleReset">重置</Button>
                <Button type="dashed" @click="close">关闭</Button>
            </Form-item>
        </Form>
    </Card>
</div>
</template>

<script>
import {
    addDormitory
} from "./api.js";
export default {
    name: "add",
    components: {},
    data() {
        return {
            submitLoading: false, // 表单提交状态
            form: { // 添加或编辑表单对象初始化数据
                title: "",
                areaSize: "",
                type: "",
                breakfast: "",
                price: 0,
                remark: "",
            },
            // 表单验证规则
            formValidate: {}
        };
    },
    methods: {
        init() {},
        handleReset() {
            this.$refs.form.resetFields();
        },
        handleSubmit() {
            this.$refs.form.validate(valid => {
                if (valid) {
                    addDormitory(this.form).then(res => {
                        this.submitLoading = false;
                        if (res.success) {
                            this.$Message.success("操作成功");
                            this.submited();
                        }
                    });
                }
            });
        },
        close() {
            this.$emit("close", true);
        },
        submited() {
            this.$emit("submited", true);
        }
    },
    mounted() {
        this.init();
    }
};
</script>

<style lang="less">
// 建议引入通用样式 具体路径自行修改 可删除下面样式代码
// @import "../../../styles/single-common.less";
.edit-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;

    .back-title {
        color: #515a6e;
        display: flex;
        align-items: center;
    }

    .head-name {
        display: inline-block;
        height: 20px;
        line-height: 20px;
        font-size: 16px;
        color: #17233d;
        font-weight: 500;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .window-close {
        z-index: 1;
        font-size: 12px;
        position: absolute;
        right: 0px;
        top: -5px;
        overflow: hidden;
        cursor: pointer;

        .ivu-icon-ios-close {
            color: #999;
            transition: color .2s ease;
        }
    }

    .window-close .ivu-icon-ios-close:hover {
        color: #444;
    }
}
</style>
