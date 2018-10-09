import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Rectangle {
        width: 360
        height: 360

      Text{
            anchors.centerIn: parent
            text:"hello world"
        }

      MouseArea{
          anchors.fill: parent
          onClicked: {
              Qt.quit();
          }

      }

    }

}
