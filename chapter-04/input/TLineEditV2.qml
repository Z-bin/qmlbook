import QtQuick 2.0

// 一个焦点区域（focus scope）定义了如果焦点区域接收到焦点，
// 它的最后一个使用focus:true的子元素接收焦点，
// 它将会把焦点传递给最后申请焦点的子元素
FocusScope {
    width: 96; height: input.height + 8
    Rectangle {
        anchors.fill: parent
        color: "lightsteelblue"
        border.color: "gray"

    }

    property alias input: input
    property alias text: input.text

    TextInput {
        id: input
        anchors.fill: parent
        anchors.margins: 4
        focus: true
    }
}
