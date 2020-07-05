import QtQuick 2.0

Text {
    id: label
    x: 24; y: 24

    property int spacePresses: 0

    text: "Space pressed: " + spacePresses + " times"

    onTextChanged: console.log("text changed to:", text)

    // 焦点为true，接受按键事件
    focus: true

    Keys.onSpacePressed: {
        increment()
    }

    Keys.onEscapePressed : {
        label.text = ''
    }

    function increment() {
        spacePresses += 1
    }


}
