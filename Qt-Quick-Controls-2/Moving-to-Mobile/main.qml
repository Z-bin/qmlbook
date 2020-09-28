import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Material 2.1

// ApplicationWindo通常包含四个区域,
// menu bar, tool bar, status bar, contents area
ApplicationWindow {

    id: window

    visible: true
    width: 360
    height: 520
    title: qsTr("Image Viewer")


    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height

        ListView {
            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.text
                highlighted: ListView.isCurrentItem
                onClicked: {
                    drawer.close()
                    model.triggered()
                }
            }

            model: ListModel {
                ListElement {
                    text: qsTr("Open...")
                    triggered:function() {
                        fileOpenDialog.open()
                    }
                }

                ListElement {
                    text: qsTr("About...")
                    triggered:function() {
                        aboutDialog.open()
                    }
                }
            }
            ScrollIndicator.vertical: ScrollIndicator {}
        }
    }

    background: Rectangle {
        color: "darkGray"
    }

    // 用于背景显示
    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    // 添加工具栏
    header: ToolBar {
        Material.background: Material.Orange
        // 流式布局

        ToolButton {
            id: menuButton
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "images/baseline-menu-24px.svg"
            onClicked: drawer.open()
        }

        Label {
            anchors.centerIn: parent
            text: "Image Viewer"
            font.pixelSize: 20
            elide: Label.ElideRight
        }
    }

    FileDialog {
        id: fileOpenDialog
        title: "Select an image file"
        folder: shortcuts.documents  // 打开文件位置
        nameFilters: {
            "Image files (*.png *.jpeg *.jpg)"
        }
        onAccepted: {
            image.source = fileOpenDialog.fileUrl // 点击确定后把图片赋予image
        }
    }

    Dialog {
        id: aboutDialog
        title: qsTr("About")
        Label {
            anchors.fill: parent
            text: qsTr("QML Image Viewer\nA part of the QmlBook\nhttp://qmlbook.org")
            horizontalAlignment: Text.AlignHCenter
        }
        standardButtons: StandardButton.Ok
    }
}
