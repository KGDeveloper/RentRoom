import BasicDataSource from './BasicDataSource'

@Observed
export class BannerListDataSource extends BasicDataSource<IBannerItem> {
  bannerList: IBannerList = []

  public getData(index: number): IBannerItem {
    return this.bannerList[index]
  }

  public totalCount(): number {
    return this.bannerList.length
  }

  setData(item: IBannerItem) {
    this.bannerList.push(item)
    this.notifyDataAdd(this.bannerList.length - 1)
  }

  setList(list: IBannerList) {
    this.bannerList = list
    this.notifyDataReload()
  }
}

export interface IBannerItem {
  id: number
  name: string
  imageURL: string
}

export type IBannerList = IBannerItem[]

export interface INavItem {
  id: number
  title: string
  imageURL: string
}

export type INavList = INavItem[]

export interface ITileItem {
  id: number
  imageURL: string
  title: string
  sub_title: string
}

export type ITileList = ITileItem[]

export interface IPlanItem {
  id: number
  imageURL: string
}

export type IPlanList = IPlanItem[]

export interface INearbyHouses {
  id: string
  housePicture: string
  tags: ITagsList
  houseTitle: string
  address: string
  rentPriceUnit: string
  rentPriceListing: string
  rentArea: string
}

export type INearbyHouseList = INearbyHouses[]

export interface ITagItem {
  name: string
}

export type ITagsList = ITagItem[]

export interface IHomeData {
  bannerList: IBannerList
  navList: INavList
  tileList: ITileList
  planList: IPlanList
  adPicture: string
}

@Observed
export class RoomRecommendDataSource extends BasicDataSource<INearbyHouses> {
  roomRecommendList: INearbyHouseList = []

  public totalCount(): number {
    return this.roomRecommendList.length
  }

  public getData(index: number): INearbyHouses {
    return this.roomRecommendList[index]
  }

  setData(item: INearbyHouses) {
    this.roomRecommendList.push(item)
    this.notifyDataAdd(this.roomRecommendList.length - 1)
  }

  setList(list: INearbyHouseList) {
    this.roomRecommendList = list
    this.notifyDataReload()
  }
}