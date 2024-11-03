import { getNearbyHousesApi } from '../../api/home';
import { BORDER_RADIUS, PADDING, PADDING_S } from '../../contants/size';
import { INearbyHouses, ITagItem, RoomRecommendDataSource } from '../../models/HomeData';

@Component
export default struct RoomRecommend {
  @State dataSource: RoomRecommendDataSource = new RoomRecommendDataSource()
  getNearbyHouses = async () => {
    const list = await getNearbyHousesApi()
    this.dataSource.setList(list)
  }

  aboutToAppear(): void {
    this.getNearbyHouses()
  }

  build() {
    Column() {
      Row() {
        Text() {
          Span('周边房源')
          Span('推荐').fontColor($r('app.color.primary'))
        }.fontSize(16).fontWeight(700).fontColor($r('app.color.black'))

        Row({ space: 6 }) {
          Text('更多推荐').fontSize(10).fontColor($r('app.color.gray_second'))
          Image($r('app.media.arrow_right')).width(4).height(8).fillColor($r('app.color.gray_second'))
        }
      }
      .backgroundColor($r('app.color.white'))
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: PADDING, right: PADDING, bottom: PADDING_S })

      Grid() {
        LazyForEach(this.dataSource, (item: INearbyHouses) => {
          GridItem() {
            Column() {
              Stack() {
                Image(item.housePicture).width('100%').height('100%').objectFit(ImageFit.Fill).borderRadius({
                  topLeft: BORDER_RADIUS,
                  topRight: BORDER_RADIUS
                })
                Image($r('app.media.room_text_bg')).width('100%').height('100%').objectFit(ImageFit.Fill).borderRadius({
                  topLeft: BORDER_RADIUS,
                  topRight: BORDER_RADIUS
                })
                Row({ space: 6 }) {
                  Image($r('app.media.location'))
                    .width(12)
                    .height(14)
                    .objectFit(ImageFit.Fill)
                    .fillColor($r('app.color.white'))
                  Text(item.address).fontSize(10).fontColor($r('app.color.white'))
                }.padding({
                  left: 8,
                  right: 8,
                  bottom: 8
                })
              }.height(120).width('100%').alignContent(Alignment.BottomStart)

              Row() {
                Text() {
                  Span('￥' + item.rentPriceListing).fontSize(14)
                  Span(item.rentPriceUnit).fontSize(12)
                }.fontColor('#E03810').fontWeight(500)

                Text(item.rentArea + '㎡').fontColor($r('app.color.gray')).fontSize(10)
              }.margin({
                top: 10
              }).justifyContent(FlexAlign.SpaceBetween).width('100%').padding({
                left: PADDING_S,
                right: PADDING_S
              })

              Text(item.houseTitle)
                .fontSize(18)
                .fontColor($r('app.color.black'))
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .padding({
                  left: PADDING_S,
                  right: PADDING_S
                })
                .margin({
                  top: 4
                })

              Row({ space: 6 }) {
                ForEach(item.tags.slice(0, 2), (tag: ITagItem, index: number) => {
                  Text(tag.name)
                    .backgroundColor(index == 0 ? $r('app.color.primary') : $r('app.color.bg_gray'))
                    .fontSize(10)
                    .fontColor(index == 0 ? $r('app.color.white') : $r('app.color.color_b3b3b3'))
                    .fontWeight(500)
                    .height(15)
                    .borderRadius(4)
                    .padding({ left: 6, right: 6 })
                }, (tag: ITagItem) => tag.name)
              }.margin({
                top: 10,
                bottom: 12
              })
              .width('100%')
              .justifyContent(FlexAlign.Start)
              .padding({
                left: PADDING_S,
                right: PADDING_S
              })
            }.backgroundColor($r('app.color.white')).borderRadius(BORDER_RADIUS)
          }
        }, (item: INearbyHouses) => item.id + '')
      }
      .width('100%')
      .columnsTemplate('1fr 1fr')
      .rowsGap(8)
      .columnsGap(8)
      .padding({
        left: PADDING,
        right: PADDING,
        bottom: PADDING,
        top: PADDING
      })
    }
    .width('100%')
    .backgroundColor($r('app.color.bg_gray'))
    .margin({
      top: 32,
    })
  }
}