import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import "../common"

Background {
    width: 300
    height: 480

    Component {
        id: imageDelegate

        Box {
            width: listView.width
            height: 220
            color: '#333'

            Column {
                Text {
                    id: title
                    color: '#e0e0e0'
                }

                Image {
                    width: listView.width
                    height: 200
                    // 缩放必要时裁剪
                    fillMode: Image.PreserveAspectCrop
                    source: imageSource
                }
            }

        }
    }

    /*从RSS流中获取图片，源属性（source）引用了一个网络地址
      这个数据会自动下载 */
    XmlListModel {
      id: imageModel

      source: "https://www.nasa.gov/rss/dyn/image_of_the_day.rss"
      query: "/rss/channel/item"

      XmlRole {name: "title"; query: "title/string()"}
      XmlRole { name: "imageSource"; query: "enclosure/string(@url)" }
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: imageModel
        delegate: imageDelegate
    }
}
