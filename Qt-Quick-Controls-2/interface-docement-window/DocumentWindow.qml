import Qt.labs.platform 1.0 as NativeDialogs
import QtQuick 2.0
import QtQuick.Controls 2.12

ApplicationWindow {
    id: root

    title: (_fileName.length===0?qsTr("Document"):_fileName) + (_isDirty?"*":"")

    width: 640
    height: 480

    property bool _isDirty: true // 文档是否有未保存的更改
    property string _fileName    // 文件名称
    property bool _tryingToClose: false // 窗口是否正在尝试关闭（但首先需要文件名）？


    menuBar: MenuBar {

        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&New")
                icon.name: "document-new"
                onTriggered: root.newDocument()
            }
            MenuSeparator{}
            MenuItem {
                text: qsTr("&Open")
                icon.name: "document-open"
                onTriggered: openDocument()
            }
            MenuItem {
                text: qsTr("&Save")
                icon.name: "document-save"
                onTriggered: saveDocument();
            }
            MenuItem {
                text: qsTr("Save &As...")
                icon.name: "document-save-as"
                onTriggered: saveAsDocument()
            }
        }
    }

    function _createNewDocument() {
        var component = Qt.createComponent("DocumentWindow.qml");
        var window = component.createObject();
        return window;
    }

    function newDocument() {
        var window = _createNewDocument();
        window.show();
    }

    function openDocument(fileName) {
        openDialog.open();
    }

    function saveAsDocument() {
        saveAsDialog.open();
    }

    function saveDocument() {
        if (0 == _fileName.length) {
            root.saveAsDocument();
        } else {
            console.log("Saving document");
            root._isDirty = false;

            if (root._tryingToClose) {
                root.close();
            }
        }
    }


    NativeDialogs.FileDialog {
        id: openDialog
        title: "Open"
        folder: NativeDialogs.StandardPaths.writableLocation(NativeDialogs.StandardPaths.DocumentsLocation)
        // 不会发生实际加载文档内容工作
        onAccepted: {
            var window = root._createNewDocument();
            window._fileName = openDialog.file
            window.show()
        }
    }

    NativeDialogs.FileDialog {
        id: saveAsDialog
        title: "Save As"
        folder: NativeDialogs.StandardPaths.writableLocation(NativeDialogs.StandardPaths.DocumentsLocation)
        onAccepted: {
            root._fileName = saveAsDialog.file
            saveAsDocument();
        }
        onRejected: {
            root._tryingToClose = false
        }
    }

    onClosing: {
        if (root._isDirty) {
            closeWarningDialog.open();
            close.accepted = false;
        }
    }

    NativeDialogs.MessageDialog {
        id: closeWarningDialog
        title: "Closing document"
        text: "You have unsaved changed"

        buttons: NativeDialogs.MessageDialog.Yes | NativeDialogs.MessageDialog.No | NativeDialogs.MessageDialog.Cancel
        onYesClicked: {
            // 尝试保存文件
            root._tryingToClose = true
            root.saveAsDocument();
        }
        onNoClicked: {
            // 关闭窗口
            root._isDirty = false;
            root.close();
        }
        onRejected: {
            // Do nothing, aborting the closing of the window
        }


    }


}
