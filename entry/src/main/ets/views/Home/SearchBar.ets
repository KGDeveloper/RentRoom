import { PADDING, PADDING_S } from '../../contants/size'

@Component
export default struct SearchBar {
  build() {
    Row() {
      Text('北京').fontSize(14).fontColor($r('app.color.white'))
      Row() {
        Image($r('app.media.search')).width(18).height(18).margin({ right: PADDING_S })
        TextInput({
          placeholder: '公司/地铁/小区,马上搜索'
        })
          .width('100%')
          .height('100%')
          .backgroundColor($r('app.color.white'))
          .fontSize(12)
          .placeholderColor($r('app.color.gray'))
        Column().width(1).height(18).backgroundColor('#D7D7D7')
        Image($r('app.media.position')).width(18).height(18)
      }.width('100%').padding({ left: PADDING, right: PADDING })

      Image($r('app.media.message')).width('100%').height(24)
    }
    .width('100%')
    .height(38)
    .padding({ left: PADDING, right: PADDING })
    .margin({ top: 4 })
  }
}