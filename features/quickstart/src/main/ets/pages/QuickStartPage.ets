import { BannerView } from '../view/BannerView'
import { EnablementView } from '../view/EnablementView'
import { TutorialView } from '../view/TutorialView'
import { ArticleDetailPage } from './ArticleDetailPage';
import { ArticleClass } from '../model/ArticleClass';
import { BannerClass } from '../model/BannerClass';
import { BannerDetailPage } from './BannerDetailPage';


@Component
export struct QuickStartPage {
  @Provide('articlePathStack') articlePathStack: NavPathStack = new NavPathStack();

  @Builder
  quickStartRouter(name: string, param?: ArticleClass | BannerClass) {
    if (name === 'articleDetail') {
      ArticleDetailPage()
    } else if (name === 'bannerDetailPage') {
      BannerDetailPage()
    }
  }

  build() {
    Navigation(this.articlePathStack) {
      Column() {
        Text($r('app.string.index_1_title'))
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(700)
          .width('100%')
          .textAlign(TextAlign.Start)
          .padding({ left: 16 })
          .fontFamily('HarmonyHeiTi-Bold')
          .lineHeight(33)

        Scroll() {
          Column() {
            BannerView()
            EnablementView()
            TutorialView()
          }
        }.layoutWeight(1)
        .scrollBar(BarState.Off)
        .align(Alignment.TopStart)
      }
      .height('100%')
      .width('100%')
      .backgroundColor($r('app.color.index_page_background'))
    }
    .navDestination(this.quickStartRouter)
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}









