import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

ApplicationWindow {
    function openFileDialog() {
        fileDialog.open();
    }

    function openAboutDialog() {
        aboutDialog.open();
    }

    visible: true
    title: qsTr("Image viewer")

    background: Rectangle {
        color: "darkGray"
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    FileDialog {
        id: fileDialog

        title: "Select an image file"
        folder: shortcuts.documents
        nameFilters: [ "Image files (*.png *.jpeg *.jpg)" ]
        onAccepted: image.source = fileOpenDialog.fileUrl;
    }

    Dialog {
        id: aboutDialog

        title: qsTr("About")
        standardButtons: StandardButton.Ok

        Label {
            anchors.fill: parent
            text: qsTr("QML Image Viewer\nA part of the QmlBook\nhttp://qmlbook.org")
            horizontalAlignment: Text.AlignHCenter
        }
    }

}
