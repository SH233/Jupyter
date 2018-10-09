import QtQuick 2.9
import QtQuick.Window 2.2

import QtQuick 2.0
Window{
    id : root;
    visible: true;
    width:400;
    height:400;
    Rectangle{
        id:rec1;
        width: 100;
        height: 100;
        color: "lightsteelblue";
        radius: 5;
    }
    Rectangle{
        id:rec2;
        width:100;
        height:100;
        x:100;
        y:100;
        border.color:"lightsteelblue";
        border.width: 5;
        radius: 5;
    }
    Rectangle{
        id:rec3;
        width: 100;
        height:100;
        x:300;
        y:0;
        color:"blue";
        opacity: 0.3;
         radius: 5;
         border.width: 5;
    }
    Rectangle{
        id:rec4;
        width:100;
        height:100;
        x:200;
        y:100;
        opacity: 0.3;
        border.color: "blue";
        radius: 5;
        border.width: 5;
    }
    Rectangle {
        id:rec5
         z: 1
         color: "red"
         width: 100; height: 100
         y:200;
     }
     Rectangle {
         color: "blue"
         x: 50; y: 250; width: 100; height: 100
         rotation: 30
     }


}

