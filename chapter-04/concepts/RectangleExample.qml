import QtQuick 2.0

Rectangle {
    id: root
    width: 120
    height: 240

    color: "#4A4A4A"

    Image {
        id: triangle
        x: (parent.width - width) / 2
        y: 40
        source: "images/triangle_red.png"
    }

    Text {
        id: text
        y: triangle.y + triangle.height + 20
        width: root.width
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Triangle")
    }
}
