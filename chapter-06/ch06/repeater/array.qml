import QtQuick 2.0
import "../common"

// repeater元素用于实现子元素的标号。
// 每个子元素都拥有一个可以访问的属性index，用于区分不同的子元素
Column {
    spacing: 2

    Repeater {
        model: ["Enterprise", "Columbia", "Challenger", "Discovery", "Endeavour", "Atlantis"]

        delegate: BlueBox {
            width: 100
            height: 32
            text: modelData + ' (' + index + ')'
        }
    }
}
