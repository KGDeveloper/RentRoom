import { INavItem, INavList } from '../../models/HomeData'

@Component
export default struct NavList {
  @Prop navList: INavList

  build() {
    Grid() {
      ForEach(this.navList, (navItem: INavItem) => {
        GridItem() {
          Column() {
            Image(navItem.imageURL).width(56).height(56).borderRadius(8).objectFit(ImageFit.Fill)
            Text(navItem.title).fontSize(12).fontColor($r('app.color.black')).margin({ top: 8 })
          }.width('100%')
        }.width('100%')
      }, (navItem: INavItem) => navItem.id + '')
    }
    .width('100%')
    .height(170)
    .rowsTemplate('1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .rowsGap(14)
    .columnsGap(33)
  }
}