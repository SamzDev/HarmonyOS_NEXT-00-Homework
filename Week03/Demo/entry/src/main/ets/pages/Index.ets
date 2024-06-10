@Entry
@Component
struct Index {
  // @State message: string = 'Hello World';

  build() {
    Column() {
      // 顶部UI
      Row() {
        // 日期
        Row() {
          Text("18").fontSize(60)
          Column() {
            Text("Mar")
            Text("2020")
          }
        }
        .width("50%")

        // 时间
        Text("22:45")
          .fontSize(60)
          .fontWeight(900)
          .width("50%")

      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      
      // 进度条
      
      

      // 任务卡片

      Scroll() {
        Column() {
          Stack({alignContent: Alignment.TopStart}) {
            Column() {
              Column() {
                //任务列表
                List({ space: 20, initialIndex: 0 }) {
                  ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
                    ListItem() {
                      // Text('' + item)
                      //   .width('100%').height(100).fontSize(16)
                      //   .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
                      Row() {
                        Text("iOS Dev Course")
                        Checkbox()
                          .select(true)
                          .selectedColor("#E91F63")
                          .unselectedColor("#E91F63")
                          .shape(CheckBoxShape.CIRCLE)
                          .onChange((value: boolean) => {
                            console.info('Checkbox1 change is' + value)
                          })
                      }
                      .width("100%")
                      .justifyContent(FlexAlign.SpaceBetween)
                    }

                  }, (item: string) => item)
                }
                .listDirection(Axis.Vertical) // 排列方向
                .scrollBar(BarState.Off)
                .friction(0.6)
                .divider({ strokeWidth: 2, color: 0xFA903A, startMargin: 8, endMargin: 8 }) // 每行之间的分界线
                .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
                .width('100%')
                .margin({top: 8})
              }
              .margin({top: 25})
              .width("95%")
              .card()
            }

            .width("100%")
            .height("100%")
            .backgroundColor(Color.Orange)


            // 左上角的
            Row() {
              Text("Todo")
                .width(60)
                .height(30)
                .fontSize(20)
                .textAlign(TextAlign.Center)
                .fontColor(Color.White)
                .backgroundColor("#E91F63")
                .borderRadius(8)
            }
            .justifyContent(FlexAlign.End)
            .width(90)
            .height(50)

          }
          .height('80%')
          .width('100%')

          Stack({alignContent: Alignment.TopStart}) {
            Column() {
              Column() {
                //任务列表
                List({ space: 20, initialIndex: 0 }) {
                  ForEach([0, 1, 2, 3, 4, 5], (item: number) => {
                    ListItem() {
                      
                      Row() {
                        Text("iOS Dev Course")
                        Checkbox()
                          .select(true)
                          .selectedColor("#E91F63")
                          .unselectedColor("#E91F63")
                          .shape(CheckBoxShape.CIRCLE)
                          .onChange((value: boolean) => {
                            console.info('Checkbox1 change is' + value)
                          })
                      }
                      .width("100%")
                      .justifyContent(FlexAlign.SpaceBetween)
                    }

                  }, (item: string) => item)
                }
                .listDirection(Axis.Vertical) // 排列方向
                .scrollBar(BarState.Off)
                .friction(0.6)
                .divider({ strokeWidth: 2, color: 0xFA903A, startMargin: 8, endMargin: 8 }) // 每行之间的分界线
                .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
                .width('100%')
                .margin({top: 8})
              }
              .margin({top: 25})
              .width("95%")
              .card()
            }

            .width("100%")
            .height("100%")
            .backgroundColor(Color.Orange)


            // 左上角的
            Row() {
              Text("Complete")
                .width(60)
                .height(30)
                .fontSize(20)
                .textAlign(TextAlign.Center)
                .fontColor(Color.White)
                .backgroundColor("#E91F63")
                .borderRadius(8)
            }
            .justifyContent(FlexAlign.End)
            .width(90)
            .height(50)

          }
          .height('100%')
          .width('100%')
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
      .height("85%")
      
      // 按钮
      Button("+").onClick((event: ClickEvent) => {
        
      })

    }
    .height('100%')
    .width('100%')
  }
}

// toDoItem 的样式
@Styles function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius: 6, color: '#987C35',offsetX: 2, offsetY: 4})
}