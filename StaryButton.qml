import QtQuick

Item {
    id: root   
    signal clicked()

    Rectangle {
        id:body
        color: "transparent"
        anchors.fill: parent
        opacity: 1

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onExited: {
                body.scale = 1
            }
            onEntered: {
                body.scale = 1.1
            }
        }

        Image {
            id: play
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "images/play.png"
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            sourceSize.width: 1200
            antialiasing: true
            opacity: 1


        }
    }
}
