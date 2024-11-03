import { PADDING } from '../../contants/size'

@Component
export default struct SearchBar {
  @Prop scrollOffset: OffsetResult
  @State isHidden: boolean = false
  getColorAlpha = () => {
    if (this.scrollOffset.yOffset > 50) {
      this.isHidden = true
      return 1
    } else {
      this.isHidden = false
      return (50 - this.scrollOffset.yOffset) / 10
    }
  }

  build() {
    Row() {
      Text("北京").fontSize(14).fontColor(this.isHidden ? $r('app.color.black') : $r('app.color.white'))
      Row() {
        Image($r("app.media.search")).imageStyles(18).margin({ right: 10 })
        // layoutWeight(1) 占剩下的空间的1份（占据剩下空间）
        TextInput({ placeholder: '公司/地铁/小区，马上搜索' })
          .layoutWeight(1)
          .height('100%')
          .fontSize(12)
          .placeholderColor($r('app.color.gray'))
          .placeholderFont({ size: 12 })
          .caretColor($r('app.color.gray'))// 光标颜色
          .padding(0)
          .backgroundColor($r('app.color.white'))
          .stateStyles({
            // 状态样式
            pressed: textInputStyles // 按下状态的样式
          })

        Column() {
        }.width(1).height(18).backgroundColor('#D7D7D7').margin({ left: 10 })

        Image($r("app.media.position")).imageStyles(18).margin({ left: 16 })
      }
      .width(244)
      .height(38)
      .backgroundColor(this.isHidden ? $r('app.color.bg_gray') : $r('app.color.white'))
      .padding({ left: PADDING, right: PADDING })
      .border({
        width: 1,
        radius: 52,
        color: '#D7D7D7'
      })

      // 图片需要通过 fillColor 修改颜色，只有 svg 图片能用
      Image($r("app.media.message"))
        .imageStyles(24)
        .fillColor(this.isHidden ? $r('app.color.black') : $r('app.color.white'))
    }
    .width('100%')
    .backgroundColor(`rgba(255,255,255,${this.getColorAlpha()})`)
    .padding({
      left: PADDING,
      right: PADDING,
      top: 4,
      bottom: 4
    })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Extend(Image)
function imageStyles(size: number) {
  .width(size).height(size).objectFit(ImageFit.Fill)
}

@Styles
function textInputStyles() {
  .backgroundColor('#fff')
}