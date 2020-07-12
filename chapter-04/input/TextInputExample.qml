import QtQuick 2.0

Rectangle {
    width: 200
    height: 80
    color: "linen"

    TLineEditV1 {
        id: input1
        x: 8; y: 8
        focus: true
        text: "Text Input 1"
        // 尝试使用Tab按键来导航，你会发现焦点无法切换到input2上。这个例子中使用focus:true的方法不正确，
        // 这个问题是因为焦点被转移到input2元素时，
        // 包含TlineEditV1的顶部元素接收了这个焦点并且没有将焦点转发给TextInput（文本输入）
        KeyNavigation.tab: input2
    }

    TLineEditV1 {
        id: input2
        x: 8; y: 36
        text: "Text Input 2"
        KeyNavigation.tab: input1
        onFocusChanged: print('focus')
    }
}
