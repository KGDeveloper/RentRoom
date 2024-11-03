import { IHomeData, INearbyHouseList } from '../models/HomeData';
import { http } from '../utils/http';

export const getHomeDataApi = (): Promise<IHomeData> => {
  return http.get<IHomeData>('/home/info')
}

export const getNearbyHousesApi = (): Promise<INearbyHouseList> => {
  return http.get<INearbyHouseList>('/house/nearbyHouses')
}