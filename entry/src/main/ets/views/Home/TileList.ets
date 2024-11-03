import { ITileItem, ITileList } from '../../models/HomeData'

@Component
export default struct TileList {
  @Prop tileList: ITileList

  build() {
    Row({ space: 32 }) {
      ForEach(this.tileList, (titleItem: ITileItem) => {
        Column({ space: 8 }) {
          Image(titleItem.imageURL).width(148).height(58).objectFit(ImageFit.Fill)
          Row() {
            Text(titleItem.title).fontSize(12).fontColor($r('app.color.black'))
            Text(titleItem.sub_title).fontSize(10).fontColor($r('app.color.gray')).margin({ left: 5 })
          }.margin({ top: 8 }).width('100%')
        }.width(148)
      }, (titleItem: ITileItem) => titleItem.id + '')
    }.width('100%')
    .margin({ top: 12 })
  }
}