import QtQuick 2.0

Flow {

    // 填充父元素
    GreenSquare {
        BlueSquare {
            width: 12
            anchors.fill: parent
            anchors.margins: 8
            text: '(1)'
        }
    }

    // 左对其父元素
    GreenSquare {
        BlueSquare {
            width: 48
            anchors.left: parent.left
            anchors.margins: 8
            text: '(2)'
        }
    }

    // 右对其父元素
    GreenSquare {
        BlueSquare {
            width: 48
            anchors.right: parent.right
            anchors.margins: 8
            text: '(3)'
        }
    }

    GreenSquare {
        BlueSquare {
            id: blue1
            width: 48; height: 24
            y: 8
            // 水平居中对其
            anchors.horizontalCenter: parent.horizontalCenter
        }

        BlueSquare {
            id: blue2
            width: 72; height: 24
            // 顶部对其底部
            anchors.top: blue1.bottom
            anchors.topMargin: 4
            anchors.horizontalCenter: blue1.horizontalCenter
            text: '(4)'
        }
    }

    // 在父元素居中
    GreenSquare {
        BlueSquare {
            width: 48
            anchors.centerIn: parent
            text: '(5)'
        }
    }

    // 元素水平方向居中对齐父元素并向后偏移12像素，垂直方向居中对齐
    GreenSquare {
        BlueSquare {
            width: 48
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -12
            anchors.verticalCenter: parent.verticalCenter
            text: '(6)'
        }
    }
}
