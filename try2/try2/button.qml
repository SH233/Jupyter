import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Window {
    visible: true

    Rectangle{
        width: 1000
        height: 1000
        GridLayout{
            columns: 3
            rows:3
            anchors.fill: parent
            Button{
                id:button1
                text:qsTr("按钮一")
                Layout.rowSpan: 3//请特别注意此行及以下两行代码
                Layout.maximumWidth: 500
                Layout.minimumWidth: 100

            }
            Button{
                id:button2
                text:qsTr("按钮二")
            }

            Button{
                id:button3
                text:qsTr("按钮三")
            }
            Button{
                id:button4
                text:qsTr("按钮四")
            }
            Button{
                id:button5
                text:qsTr("按钮五")
            }

        }


    }
}
