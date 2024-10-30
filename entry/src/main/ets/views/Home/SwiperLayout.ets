import { BannerListDataSource, IBannerItem } from '../../models/HomeData';

@Component
export default struct SwiperLayout {
  @Link dataSource: BannerListDataSource;

  build() {
    Swiper() {
      LazyForEach(this.dataSource, (banner: IBannerItem) => {
        Image(banner.imageURL).width('100%').height('100%').objectFit(ImageFit.Fill).backgroundColor('#ff0')
      }, (banner: IBannerItem) => banner.id + '')
    }
    .width('100%')
    .height(211 - 36)
    .autoPlay(true)
    .interval(2000)
    .indicator(
      new DotIndicator()
        .selectedColor($r('app.color.indicator_select_color'))
        .color($r('app.color.indicator_color'))
    )
  }
}