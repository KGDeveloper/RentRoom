import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'
import { anyObject, AnyObject } from '../../models/HttpModel'

const request = axios.create({
  baseURL: 'http://192.168.0.52:6060',
  timeout: 10000,
  headers: {}
})

request.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 配置token参数
  return config
}, (error: AxiosError) => {
  // 错误处理
  return Promise.reject(error)
})

request.interceptors.response.use((response: AxiosResponse) => {
  if (response.data.code === 200) {
    return response.data.data
  } else {
    return Promise.reject(response.data.message)
  }
}, (error: AxiosError) => {
  return Promise.reject(error.message)
})

export class Http {
  get<T>(url: string, params?: AnyObject) {
    return request.get<anyObject, T>(url, { params })
  }

  post<T>(url: string, data?: AnyObject) {
    return request.post<anyObject, T>(url, data)
  }

  put<T>(url: string, data?: AnyObject) {
    return request.put<anyObject, T>(url, data)
  }

  delete<T>(url: string, params?: AnyObject) {
    return request.delete<anyObject, T>(url, { params })
  }
}
