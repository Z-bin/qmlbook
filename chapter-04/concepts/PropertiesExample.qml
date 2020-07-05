import QtQuick 2.0

Rectangle {
    width: 240
    height: 120

    Text {
        // 标识符
        id: thisLabel

        // 坐标
        x: 24; y: 16

        height: width * 2

        // 自定义属性
        property int times: 24

        // 属性别名
        property  alias anotherTimes: thisLabel.times

        text: "Greetings " + times

        font.family: "Ubuntu"
        font.pixelSize: 24

        // 按键定位
        KeyNavigation.tab: otherLabel

        // 属性改变信号
        onHeightChanged: console.log('height :', height)

        focus: true

        color: focus?"red":"black"
    }

    Text {
        id: otherLabel
        x: 24
        y: 64
        text: "Other Label"

        font.family: "Ubuntu"
        font.pixelSize: 24

        KeyNavigation.tab: thisLabel
        color: focus?"red":"black"
    }

}
