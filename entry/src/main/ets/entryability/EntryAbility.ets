import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
  }

  onDestroy(): void {
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        return;
      }
    });

    let mainWindow = windowStage.getMainWindowSync()
    mainWindow.setWindowLayoutFullScreen(true)
    mainWindow.on('avoidAreaChange', (data) => {
      if (data.type == window.AvoidAreaType.TYPE_SYSTEM) {
        console.log(`---------0-----------top:${data.area.topRect.top}-----------height:${data.area.topRect.height},---------top:${data.area.bottomRect.top}---------height:${data.area.bottomRect.height}`)
      } else if (data.type == window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR) {
        console.log(`---------1-----------top:${data.area.topRect.top}-----------height:${data.area.topRect.height},---------top:${data.area.bottomRect.top}---------height:${data.area.bottomRect.height}`)
      }
    })
  }

  onWindowStageDestroy(): void {
  }

  onForeground(): void {
  }

  onBackground(): void {
  }
}
