import { getHomeDataApi } from '../api/home';
import { BannerListDataSource } from '../models/HomeData';
import SwiperLayout from '../views/Home/SwiperLayout';
import SearchBar from '../views/Home/SearchBar';

@Component
export struct Home {
  @State bannerDataSource: BannerListDataSource = new BannerListDataSource()
  getHomeData = async () => {
    const result = await getHomeDataApi();
    this.bannerDataSource.setList(result.bannerList)
  }

  aboutToAppear(): void {
    this.getHomeData()
  }

  build() {
    Scroll() {
      Stack() {
        Column() {
          SwiperLayout({ dataSource: this.bannerDataSource })
        }.width('100%')

        SearchBar()
      }.width('100%').alignContent(Alignment.TopStart)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.TopStart)
  }
}