import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

// 分页获取数据
export const getDormitoryDiscussList = (params) => {
    return getRequest('/dormitoryDiscuss/getMyDiscuss', params)
}
// 添加
export const addDormitoryDiscuss = (params) => {
    return postRequest('/dormitoryDiscuss/insertOrUpdate', params)
}
// 编辑
export const editDormitoryDiscuss = (params) => {
    return postRequest('/dormitoryDiscuss/insertOrUpdate', params)
}
// 删除
export const deleteDormitoryDiscuss = (params) => {
    return postRequest('/dormitoryDiscuss/delByIds', params)
}