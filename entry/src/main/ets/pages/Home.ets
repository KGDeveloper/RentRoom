import { getHomeDataApi } from '../api/home';
import { BannerListDataSource, INavList, IPlanList, ITileList } from '../models/HomeData';
import SwiperLayout from '../views/Home/SwiperLayout';
import SearchBar from '../views/Home/SearchBar';
import NavList from '../views/Home/NavList';
import TileList from '../views/Home/TileList';
import PlanList from '../views/Home/PlanList';
import RoomRecommend from '../views/Home/RoomRecommend';
import { PADDING, SHADOW_RADIUS } from '../contants/size';

@Component
export struct Home {
  @State bannerDataSource: BannerListDataSource = new BannerListDataSource()
  @State navList: INavList = [];
  @State tileList: ITileList = []
  @State planList: IPlanList = []
  @State adPicture: string = ''
  @State scrollOffset: OffsetResult = { xOffset: 0, yOffset: 0 }
  scroll: Scroller = new Scroller()
  getHomeData = async () => {
    const result = await getHomeDataApi();
    this.bannerDataSource.setList(result.bannerList)
    this.navList = result.navList
    this.tileList = result.tileList
    this.planList = result.planList
    this.adPicture = result.adPicture
  }

  aboutToAppear(): void {
    this.getHomeData()
  }

  scrollHandler = (xOffset: number, yOffset: number) => {
    this.scrollOffset = this.scroll.currentOffset()
  }

  build() {
    Stack() {
      Scroll(this.scroll) {
        Column() {
          SwiperLayout({ dataSource: this.bannerDataSource })
          Column() {
            NavList({ navList: this.navList }).margin({ top: 24 })
            TileList({ tileList: this.tileList })
            PlanList({ planList: this.planList })
            Image(this.adPicture)
              .height(61)
              .width('100%')
              .margin({ top: 9 })
              .objectFit(ImageFit.Fill)
              .shadow({
                offsetX: 0,
                offsetY: 0,
                radius: SHADOW_RADIUS,
                color: 'rgba(0,0,0,0.14)'
              })
          }.padding({ left: PADDING, right: PADDING }).width('100%')

          RoomRecommend()
        }.width('100%')
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .onDidScroll(this.scrollHandler)

      SearchBar({ scrollOffset: this.scrollOffset }).width('100%')
    }.alignContent(Alignment.TopStart)
  }
}