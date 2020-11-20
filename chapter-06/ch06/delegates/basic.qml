import QtQuick 2.0

Rectangle {
    width: 120
    height: 300

    // 渐变
    gradient: Gradient {
        GradientStop {position: 0.0; color: "#f6f6f6"}
        GradientStop { position: 1.0; color: "#d7d7d7" }
    }

    ListView {
        id: view
        anchors.fill: parent
        anchors.margins: 20

        clip: true

        model: 20

        delegate: numberDeletgate
        spacing: 5

        currentIndex: 2

        focus: true
    }

    Component {
        id: numberDeletgate

        Rectangle {
            width: ListView.view.width
            height: 40

            color: ListView.isCurrentItem ?  "#157efb" : "#53d769"
            border.color: Qt.lighter(color, 1.1)

            Text {
                id: text

                anchors.centerIn: parent

                font.pixelSize: 10

                text: index
            }
        }
    }
}
