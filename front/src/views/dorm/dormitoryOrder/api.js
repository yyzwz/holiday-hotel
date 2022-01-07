import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

// 分页获取数据
export const getDormitoryOrderList = (params) => {
    return getRequest('/dormitoryOrder/getByPage', params)
}
// 添加
export const addDormitoryOrder = (params) => {
    return postRequest('/dormitoryOrder/insertOrUpdate', params)
}
// 编辑
export const editDormitoryOrder = (params) => {
    return postRequest('/dormitoryOrder/insertOrUpdate', params)
}
// 删除
export const deleteDormitoryOrder = (params) => {
    return postRequest('/dormitoryOrder/delByIds', params)
}
export const payOrder = (params) => {
    return postRequest('/dormitoryOrder/payOrder', params)
}