import QtQuick 2.0
import QtQuick.Window 2.0
import  QtQuick.Controls 2.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Timer")

    function formatString(count){
        var hours = Math.floor(count / 3600);
        var minutes = Math.floor((count % 3600) / 60);
        var secs = (count % 60);

        //format time string
        var timeStr = '';
        var hoursStr = hours < 10 ? `0${hours}` : `${hours}`;
        var minsStr = minutes < 10 ? `0${minutes}` : `${minutes}`;
        var secsStr = secs < 10 ? `0${secs}` : secs;
        return `${hoursStr} : ${minsStr} : ${secsStr}`;
    }


    Timer {
        property int count : 0;

        id: timer1
        interval: 1000
        repeat: true
        running: false

        onTriggered: {
            count++;
        }
    }


    Text {
        id: txt_box
        text: formatString(timer1.count)
        anchors.verticalCenterOffset: -130
        anchors.centerIn: parent
        font.pointSize: 28

        Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: "black"
                border.width: 2
                radius: 20
        }
    }

    Row {
            spacing: 20
            anchors.verticalCenterOffset: -150
            anchors.centerIn: parent


            Button {
                id: btn_on
                x: 190
                y: 263
                width: 150
                height: 30
                text: qsTr("ON")
                property int buttonClick : 0
                    background: Rectangle {
                        color: btn_on.buttonClick == 1 ? "green" : "grey"
                        border.color: "black"
                        radius: 10
                        border.width: 2
                    }

                    onClicked: {
                        timer1.running = true
                        btn_on.buttonClick = 1
                    }

                contentItem: Text {
                    text: btn_on.text
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black"
                }

            }

            Button {
                id: btn_off
                x: 200 + 150
                y: 263
                width: 150
                height: 30
                text: qsTr("OFF")
                checkable: false

                contentItem: Text {
                    text: btn_off.text
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                background: Rectangle {
                    color: btn_on.buttonClick == 2 ? "green" : "grey"
                    border.color: "black"
                    radius: 10
                    border.width: 2
                }

                onClicked: {
                    timer1.running = false
                    btn_on.buttonClick = 2
                }
            }


            Button {
                id: btn_reset
                x: 30
                y: 263
                width: 150
                height: 30
                text: qsTr("RESET")

                contentItem: Text {
                    text: btn_reset.text
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    color: btn_on.buttonClick == 3 ? "green" : "grey"
                    border.color: "black"
                    radius: 10
                    border.width: 2
                }
                onPressed: {
                    btn_on.buttonClick = 3
                    timer1.count = 0
                }
                onReleased: {
                    btn_on.buttonClick = 0
                }
            }


        }

}
