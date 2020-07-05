import QtQuick 2.0

Image {
    id: root
    source: "images/background.png"

    Image {
        id: pole
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        source: "images/pole.png"
    }

    Image {
        id: wheel
        /*
           一个动画定义了一个属性的在一段时间内的变化过程
           现在每当风车旋转角度发生改变时都会使用NumberAnimation来实现250毫秒的旋转动画效果。
           每一次90度的转变都需要花费250ms
        */
        Behavior on rotation {
            NumberAnimation {
                duration: 250
            }
        }
        anchors.centerIn: parent
        source: "images/pinwheel.png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: wheel.rotation += 90
    }
}

