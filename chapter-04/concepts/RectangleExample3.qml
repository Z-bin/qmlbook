import QtQuick 2.0

Item {
    width: 200
    height: 120

    Rectangle {
        id: rect1
        x: 12; y: 12
        width: 176; height: 96
        // 一个渐变色是由一系列的梯度值定义的。
        // 每一个值定义了一个位置与颜色。位置标记了y轴上的位置（0 = 顶，1 = 底
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "slategray" }
        }
        border.color: "red"
    }
}
