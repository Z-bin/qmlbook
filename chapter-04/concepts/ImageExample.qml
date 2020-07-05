import QtQuick 2.0

Rectangle {

    width: 400; height: 100

    color: '#333333'

    Image {
        x: 12; y: 12
        // width: 72
        // height: 72
        // 路径可以为网络url
        source: "images/triangle_red.png"
    }
    Image {
        x: 12+64+12; y: 12
        // width: 72
        height: 72/2
        source: "images/triangle_red.png"
        // 避免裁剪图像数据被渲染到图像边界外
        fillMode: Image.PreserveAspectCrop
        clip: true
    }
}
