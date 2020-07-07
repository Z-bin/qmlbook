import QtQuick 2.12
import QtQuick.Window 2.12

Item {
    id: root
    Image {
        id: bg
        source: "assets/background.png"
    }

    MouseArea {
        id: backgroundClicker
        //  必须放在ClickableImage之前，否则永远是点击复原操作(一个后出现在代码中的鼠标区域将会与之前的鼠标区域重叠，后出现的鼠标区域才能捕捉到鼠标事件)
        anchors.fill: parent
        onClicked: {
            console.debug("reset operation")
            circle.x = 84
            box.rotation = 0
            triangle.rotation = 0
            triangle.scale = 1.0
        }
    }

    ClickableImage {
        id: circle
        x: 84; y: 68
        source: "assets/circle_blue.png"
        antialiasing: true
        onClicked: {
            x +=20
        }
    }

    ClickableImage {
        id: box
        x: 164; y: 68
        source: "assets/box_green@2x.png"
        antialiasing: true
        onClicked: {
            rotation += 15
        }
    }

    ClickableImage {
        id: triangle
        x: 248; y: 68
        source: "assets/triangle_red.png"
        antialiasing: true
        onClicked: {
            rotation += 15
            scale += 0.05
        }
    }

    function _test_transformed() {
        circle.x += 20
        box.rotation = 15
        triangle.scale = 1.2
        triangle.rotation = -15
    }

    function _test_overlap() {
        circle.x += 40
        box.rotation = 15
        triangle.scale = 2.0
        triangle.rotation = 45
    }
}
