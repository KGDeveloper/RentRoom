import { IHomeData } from '../models/HomeData';
import { http } from '../utils/http';

export const getHomeDataApi = (): Promise<IHomeData> => {
  return http.get<IHomeData>('/home/info')
}