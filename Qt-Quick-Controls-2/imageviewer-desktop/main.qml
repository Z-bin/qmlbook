import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

// ApplicationWindo通常包含四个区域,
// menu bar, tool bar, status bar, contents area
ApplicationWindow {
    visible: true
    width: 640
    height: 480

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
        // 流式布局
        Flow {
            anchors.fill: parent
            ToolButton {
                text: qsTr("Open")
                icon.name: "document-opent" // 从系统中读取图标名称,[freedesktop.org Icon Naming Specification]
                onClicked: fileOpenDialog.open()
            }
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

    // 创建菜单栏
    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open...")
                icon.name: "document-open"
                onTriggered: fileOpenDialog.open()
            }
        }

        Menu {
            title: qsTr("&Help")
            MenuItem {
                text: qsTr("&About...")
                onTriggered: aboutDialog.open()
            }
        }

    }
}
