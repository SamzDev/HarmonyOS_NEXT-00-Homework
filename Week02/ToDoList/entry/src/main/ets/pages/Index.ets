@Entry
@Component
struct Index {

  @State toDoList: ToDoInfo[] = [
    new ToDoInfo("学习"),
    new ToDoInfo("工作"),
    new ToDoInfo("购物"),
    new ToDoInfo("运动"),
    new ToDoInfo("旅游")]

  //  增加todo item的处理函数
  //  用箭头函数保持this指向没变
  addToDoItem = (content: string) => {
    this.toDoList.unshift(new ToDoInfo(content))
  }

  // 弹出对话框
  dialogController: CustomDialogController = new CustomDialogController({
    builder: ToDoInfoDialog({onConfirm:this.addToDoItem})
  })

  checkBoxChanged = (item: ToDoInfo) => {
    // this.toDoList.push(this.toDoList.splice(this.toDoList.indexOf(item), 1)[0]);
    // console.log(`${this.toDoList.splice(this.toDoList.indexOf(item), 1)[0]}`)
    this.toDoList.sort((a:ToDoInfo, b:ToDoInfo) => (a.finished === b.finished ? 0 : a.finished ? 1 : -1));
  }

  build() {
    Column() {
      Text("待办")
        .fontSize(50)
        .textAlign(TextAlign.Start)
        .fontWeight(FontWeight.Bold)
        .width("90%")
        .margin({ top: 20 })

      Button("新增")
        .onClick((event) => {
          this.dialogController.open()
        })
        .width("50%")

      List() {
        ForEach(this.toDoList, (item: ToDoInfo, index) => {
          ListItem() {
            ToDoItem({ item: item , onCheckBoxChanged: this.checkBoxChanged})
          }.swipeAction({end: this.DeleteButton(index)})
        })
      }
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)
    }
    .height('100%')
    .width('100%')
  }

  // 自定义滑动删除按钮
  @Builder DeleteButton(index: number) {
    Button() {
      Image($r('app.media.ic_public_delete_filled'))
        .fillColor(Color.White)
        .width(30)
    }
    .width(50)
    .height(50)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin({top: 15,bottom: 5,left: 5,right: 5})
    .onClick(() => {
      this.toDoList.splice(index,1)
    })
    .padding({ top: '5.00vp', right: '0.00vp', bottom: '5', left: '0.00vp' })
  }
}

// ToDoItem组件
@Component
struct ToDoItem {
  @ObjectLink item: ToDoInfo
  onCheckBoxChanged?: (item: ToDoInfo) => void
  build() {
    Row(){
      // CheckBox，用复选框
      Checkbox()
        .select(this.item.finished)
        .onChange((value: boolean) => {
          this.item.finished = value
          if (this.onCheckBoxChanged) {
            this.onCheckBoxChanged(this.item)
          }
        })
      // todo的内容
      if (this.item.finished) {
        Text(this.item.content)
          .fontSize(20)
          .finishedStyle()
      } else {
        Text(this.item.content)
          .fontSize(20)
      }
    }
    .margin({top: 10})
    .card()
  }

}

// toDoItem 的样式
@Styles function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius: 6, color: '#1F0000',offsetX: 2, offsetY: 4})
}

// toDoItem完成样式
@Extend(Text) function finishedStyle() {
  .decoration({type: TextDecorationType.LineThrough})
  .fontColor('#B1B2B1')
}

@Observed
class ToDoInfo {

  // 待办内容
  content: string
  // 完成状态：是否完成
  finished: boolean

  constructor(content: string,finished: boolean = false) {

    this.content = content
    this.finished = finished
  }
}

// 自定义弹出对话框
@CustomDialog
struct ToDoInfoDialog {

  content: string = ''
  onConfirm?: (content: string) => void
  controller?: CustomDialogController

  build() {
    Column({ space: 20}) {
      TextInput({placeholder: '输入待办事项'})
        .onChange(val => this.content = val)

      Row() {
        Button('确定')
          .onClick(() => {
            if (this.onConfirm) {
              this.onConfirm(this.content)
              this.controller?.close()
            }
          })

        Button('取消')
          .backgroundColor(Color.Grey)
          .onClick(() => {
            if (this.controller) {
              this.controller.close()
            }
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .padding(20)
  }
}