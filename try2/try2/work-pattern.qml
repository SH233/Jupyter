import QtQuick 2.0


Grid{
    id:root;
    Column {
        spacing: 20
        width: page.itemWidth

        RadioButton {
            text: "First"
            checked: true
            width: parent.width
        }
        RadioButton {
            id: button
            text: "Second"
            width: parent.width
        }
        RadioButton {
            text: "Third"
            width: parent.width
        }
    }
}
