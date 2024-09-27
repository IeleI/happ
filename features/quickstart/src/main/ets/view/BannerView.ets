import { BannerClass } from '../model/BannerClass';
import { bufferToString } from '../util/BufferUtil';

@Component
export struct BannerView {
  @State bannerList: BannerClass[] = [];
  @Consume('articlePathStack') articlePathStack: NavPathStack;

  aboutToAppear(): void {
    this.getBannerDataFromJSON()
  }

  getBannerDataFromJSON() {
    getContext(this).resourceManager.getRawFileContent('BannerData.json').then(value => {
      console.log('info is ' + value)
      this.bannerList = JSON.parse(bufferToString(value.buffer)) as BannerClass[]
    })
  }

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass) => {
        Image($r(item.imageSrc))
          .objectFit(ImageFit.Cover)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
          .onClick(() => {
            this.articlePathStack.pushPathByName('bannerDetailPage', item);
          })
      }, (item: BannerClass) => item.id)
    }.autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator().color('#1a000000').selectedColor('#0A59F7')
    )
  }
}