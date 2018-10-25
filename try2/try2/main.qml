import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import ZSS 1.0 as Client

Window{
    id: window
    visible: true
    width: 640
    height: 480
    Client.RefereeBox { id : refereeBox; }

    property alias button: button
    Timer {
        id:refBoxTimer;
        interval:40;
//        running:false;
        running:true;
        repeat:true;
        onTriggered: {
            refereeBox.multicastCommand();
        }
    }
    property int state : Client.GameState.HALTED;
    property bool haltGame : false;
    property bool stopGame : true;
    property bool forceStart : false;
    property bool normalStart : false;
    property bool teamControl : false;
    function getButtonsCommand(index){
        switch(index){
        case Client.RefBoxCommand.HALT:
            state = Client.GameState.HALTED;break;
        case Client.RefBoxCommand.STOP_GAME:
        case Client.RefBoxCommand.BALL_PLACEMENT_YELLOW:
        case Client.RefBoxCommand.BALL_PLACEMENT_BLUE:
            state = Client.GameState.STOPPED;break;
        case Client.RefBoxCommand.FORCE_START:
        case Client.RefBoxCommand.NORMAL_START:
        case Client.RefBoxCommand.DIRECT_KICK_YELLOW:
        case Client.RefBoxCommand.INDIRECT_KICK_YELLOW:
        case Client.RefBoxCommand.DIRECT_KICK_BLUE:
        case Client.RefBoxCommand.INDIRECT_KICK_BLUE:
            state = Client.GameState.RUNNING;break;
        case Client.RefBoxCommand.TIMEOUT_YELLOW:
            state = Client.GameState.TIMEOUT_YELLOW;break;
        case Client.RefBoxCommand.TIMEOUT_BLUE:
            state = Client.GameState.TIMEOUT_BLUE;break;
        case Client.RefBoxCommand.KICKOFF_YELLOW:
        case Client.RefBoxCommand.KICKOFF_BLUE:
            state = Client.GameState.PREPARE_KICKOFF;break;
        case Client.RefBoxCommand.PENALTY_YELLOW:
        case Client.RefBoxCommand.PENALTY_BLUE:
            state = Client.GameState.PREPARE_PENALTY;break;
        default:
            console.log("RefBox Command ERROR!!!!!!");
            return;
        }
        console.log(index)
        controlButtons(state);
        refereeBox.changeCommand(index);
    }
    function controlButtons(state){
        function unify(onOff){ haltGame = stopGame = forceStart = normalStart = teamControl = onOff; }
        switch(state){
        case Client.GameState.HALTED:
            unify(false);
            stopGame = true;
            break;
        case Client.GameState.PREPARE_KICKOFF:
        case Client.GameState.PREPARE_PENALTY:
            unify(false);
            normalStart = true;
            break;
        case Client.GameState.RUNNING:
        case Client.GameState.TIMEOUT_BLUE:
        case Client.GameState.TIMEOUT_YELLOW:
            unify(false);
            haltGame = stopGame = true;
            break;
        case Client.GameState.STOPPED:
            unify(true);
            stopGame = normalStart = false;
            break;
        }
    }


    Rectangle {
        id: referee
        width: parent.width
        height: parent.height
        anchors.margins: 10

        Text{
            text:"Blue"

            anchors.verticalCenter: teamswitch.verticalCenter
            anchors.right:teamswitch.left
            anchors.rightMargin: 10
        }

        Switch{
            id:teamswitch
            text:"Yellow"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:refereeboxbutton.top
            anchors.bottomMargin: 30
            checked:false
        }

        GridLayout{
//            anchors.verticalCenterOffset: 186
//            anchors.horizontalCenterOffset: -5
            id:refereeboxbutton
            rowSpacing:  20
            columnSpacing: 20
            anchors.centerIn: parent
            rows: 6
            columns: 2



            Button {
                text: "HALT"
                Layout.fillWidth: true
                property int index : Client.RefBoxCommand.HALT;
                onClicked:getButtonsCommand(index);
                enabled: haltGame;
            }
            Button {
//                        text: "STOP GAME"
                Layout.fillWidth: true
                property int index : Client.RefBoxCommand.STOP_GAME;
                text:qsTr("Stop Game");
                onClicked:getButtonsCommand(index);
                enabled: stopGame;
            }
            Button {

//                        text: "FORCE START"
                Layout.fillWidth: true
                property int index : Client.RefBoxCommand.FORCE_START;
                text:qsTr("Force Start");
                onClicked:getButtonsCommand(index);
                enabled: forceStart;
            }
            Button {
//                        text: "NORMAL START"
                Layout.fillWidth: true
                property int index : Client.RefBoxCommand.NORMAL_START;
                text:qsTr("Normal Start");
                onClicked:getButtonsCommand(index);
                enabled: normalStart;
            }
            Button {
                id: button
//                        text: "KICK OFF"
                Layout.fillWidth: true
                property int index :teamswitch.checked? Client.RefBoxCommand.KICKOFF_YELLOW:Client.RefBoxCommand.KICKOFF_BLUE;
                text:qsTr("Kick off");
                onClicked:getButtonsCommand(index);
            }
            Button {
//                        text: "PENALTY"
                Layout.fillWidth: true
                property int index :teamswitch.checked?Client.RefBoxCommand.PENALTY_YELLOW:Client.RefBoxCommand.PENALTY_BLUE;
                text:qsTr("Penalty");
                onClicked:getButtonsCommand(index);
            }
            Button {
//                        text: "DIRECT KICK"
                Layout.fillWidth: true
                property int index :teamswitch.checked? Client.RefBoxCommand.DIRECT_KICK_YELLOW:Client.RefBoxCommand.DIRECT_KICK_BLUE;
                text:qsTr("Direct Kick");
                onClicked:getButtonsCommand(index);
            }
            Button {
//                        text: "INDIRECT KICK"
                Layout.fillWidth: true
                property int index :teamswitch.checked? Client.RefBoxCommand.INDIRECT_KICK_YELLOW:Client.RefBoxCommand.INDIRECT_KICK_BLUE;
                text:qsTr("Indirect Kick");
                onClicked:getButtonsCommand(index);
            }
            Button {
//                        text: "TIMEOUT"
                Layout.fillWidth: true
                property int index :teamswitch.checked? Client.RefBoxCommand.TIMEOUT_YELLOW:Client.RefBoxCommand.TIMEOUT_BLUE;
                text:qsTr("Timeout");
                onClicked:getButtonsCommand(index);

            }
            Button {
//                        text: "BALL PLACEMENT"
                Layout.fillWidth: true
                property int index :teamswitch.checked? Client.RefBoxCommand.BALL_PLACEMENT_YELLOW:Client.RefBoxCommand.BALL_PLACEMENT_BLUE;
                text:qsTr("Ball Placement");
                onClicked:getButtonsCommand(index);
            }
             }
       }

    }



