import QtQuick 2.0
import "../common"

Background {
    width: 240
    height: 300

    ListView {
        id: view
        anchors.fill: parent
        anchors.margins: 20

        clip: true

        model: 100

        delegate: numberDelegate
        spacing: 5

        highlight: highlightComponent
        // 视图将不再负责高亮代理的移动
        highlightFollowsCurrentItem: false

        //获得焦点
        focus: true
    }

    Component {
        id: highlightComponent
        Item {
            width: ListView.view.width
            height: ListView.view.currentItem.height

            y: ListView.view.currentItem.y

            Behavior on y {
                SequentialAnimation {
                    // 淡入
                    PropertyAnimation {
                        target: highlightRectangle
                        property: "opacity"
                        to: 0
                        duration: 200
                    }
                    // 移动
                    NumberAnimation {
                        duration: 1
                    }
                    // 淡出
                    PropertyAnimation {
                        target: highlightRectangle
                        property: "opacity"
                        to: 1
                        duration: 200
                    }
                }
            }

            GreenBox {
                id: highlightRectangle
                anchors.fill: parent
            }
        }
    }

    Component {
        id: numberDelegate

        Item {
            width: 40
            height: 40

            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
}
