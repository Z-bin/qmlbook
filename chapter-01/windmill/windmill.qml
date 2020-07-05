import QtQuick 2.12

Image {
    id: root
    // 每个元素都有属性，比如Image有width和height，也会有其它的属性如source。Image元素的尺寸会自动与source设置的图像匹配。
    // 想要自定义Image元素的尺寸必须显式的定义width和height的值
    source: "images/background.png"
}

