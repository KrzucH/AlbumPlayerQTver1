import QtQuick


Item {
    id: root
    property color colorNormal: "purple"
    property color colorPressed: "purple"
    property color colorHover: "purple"
    signal clicked()

    Rectangle {
        id:body
        color: root.colorNormal
        anchors.fill: parent
        radius: width
        opacity: 0.8

        MouseArea {
            id:area
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                body.color = root.colorPressed
                body.opacity = 0.7
            }


            onReleased: {

                body.color = root.colorHover
                 body.opacity = 1

            }

            onEntered: {
                body.opacity = 1
                body.color = root.colorHover
            }

            onExited: {
                body.opacity = 0.8
                body.color = root.colorNormal

            }

        }
        Image {
            id: play
            anchors.fill: parent            
            source: "images/next"
            anchors.bottomMargin: 0
            anchors.leftMargin: 8
            anchors.topMargin: 0
            sourceSize.width: 1500
            scale: 1,1
            anchors.rightMargin: -8
            opacity: 1
        }

    }

}
