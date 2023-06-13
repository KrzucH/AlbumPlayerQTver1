import QtQuick

Item {
    id:plyta
        property alias source: pink.source

        Image {
            id: pink
            anchors.fill: parent
            width: 418
            height: 419
            opacity: 1
        }

}
