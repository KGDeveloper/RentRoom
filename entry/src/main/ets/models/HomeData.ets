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

export interface ITitleItem {
  id: number
  imageURL: string
  title: string
  sub_title: string
}

export type ITitleList = ITitleItem[]

export interface IPlanItem {
  id: number
  imageURL: string
}

export type IPlanList = IPlanItem[]

export interface IHomeData {
  bannerList: IBannerList
  nacList: INavList
  titleList: ITitleList
  planList: IPlanList
  adPicture: string
}