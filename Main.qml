import QtQuick
import QtQuick.Window
import QtQuick.Controls 6.3
import QtMultimedia
import AddMp3File


Window {
    width: 1015
    height: 640
    visible: true
    title: qsTr("Hello World")
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    Rectangle {
        width: 1015
        height: 640
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {position:0; color:"black"}
            GradientStop {position:0.15; color:"purple"}
            GradientStop {position:0.58; color:"black"}
        }
    }

    property int musicPlayerState: playMusic.playbackState 

    SwipeView {
        id: view
        x: 706
        y: 40
        width: 310
        height: 282
        visible: true
        anchors.fill: parent
        clip:true
        currentIndex: 0
        anchors.rightMargin: 24
        anchors.bottomMargin: 41
        anchors.leftMargin: 714
        anchors.topMargin: 56
        enabled: true

        Item {
            id: firstPage
            Image {
                id: pinkAlbum
                x: 0
                y: 0
                width: 286
                height: 279
                source: "images/Pinkgreat"

            }
            ListView {
                id:listMusicPink
                x: 0
                y: 279
                width: 286
                height: 274
                layoutDirection: Qt.LeftToRight

                model: ListModel {
                    id:listModel
                    Component.onCompleted: {
                        var filesPink = dirmp3Pink.file
                        for(var i = 0; i < filesPink.length; i++) {
                            var namePink = filesPink[i]
                            namePink = namePink.slice(0, -4)
                            namePink = namePink.slice(11)
                            append({track: namePink})
                        }
                    }
                }

                delegate: ItemDelegate {
                    text: model.track
                    width: listMusicPink.width
                    background: Rectangle {
                                    color: "transparent"
                                }
                    palette.text: "white"
                    font.family: "Mistral"
                    font.pointSize: 13
                }
            }

        }

        Item {
            id: secondPage
            Image {
                width: 286
                height: 279
                id: name1
                source: "images/ledalbum"

            }
            ListView {
                id:listMusicLed
                x: 0
                y: 279
                width: 286
                height: 274
                layoutDirection: Qt.LeftToRight

                model: ListModel {
                    Component.onCompleted: {
                        var filesLed = dirmp3Led.file
                        for(var i = 0; i < filesLed.length; i++) {
                            var nameLed = filesLed[i]
                            nameLed = nameLed.slice(0, -4)
                            nameLed = nameLed.slice(13)
                            append({track: nameLed})
                        }
                    }
                }
                delegate: ItemDelegate {
                    text: model.track
                    width: listMusicLed.width
                    background: Rectangle {
                                    color: "transparent"
                                }
                    palette.text: "white"
                    font.family: "Mistral"
                    font.pointSize: 13
                }
            }
        }

        Item {
            id: thirdPage
            Image {
                width: 286
                height: 279
                id:acdcAlbum
                source: "images/acdcAlbum"
            }
            ListView {
                id:listMusicAcdc
                x: 0
                y: 279
                width: 286
                height: 274
                layoutDirection: Qt.LeftToRight

                model: ListModel {
                    Component.onCompleted: {
                        var filesAcdc = dirmp3Acdc.file
                        for(var i = 0; i < filesAcdc.length; i++) {
                            var nameAcdc = filesAcdc[i]
                            nameAcdc = nameAcdc.slice(0, -4)
                            nameAcdc = nameAcdc.slice(13)
                            append({track: nameAcdc})
                        }
                    }
                }
                delegate: ItemDelegate {

                    text: model.track
                    width: listMusicAcdc.width
                    background: Rectangle {
                                    color: "transparent"
                                }
                    palette.text: "white"
                    font.family: "Mistral"
                    font.pointSize: 13
                }
            }
        }
    }

    PageIndicator {
        id: indicator
        width: 100
        height: 100
        anchors.fill: parent
        anchors.topMargin: 26
        anchors.leftMargin: 839
        anchors.rightMargin: 147

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenterOffset: 1288
        anchors.bottomMargin: 590
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        x: 106
        y: 556
        width: 414
        height: 31

        Text{
            id:textMusic
            x: 0
            y: 0
            width: parent.width
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            visible: false
            text: {
                var name = playMusic.source.toString()
                if(view.currentItem == firstPage) {
                    name = name.slice(0, -4)
                    name = name.slice(13)
                } else if(view.currentItem == secondPage) {
                    name = name.slice(0, -4)
                    name = name.slice(15)
                } else {
                    name = name.slice(0, -4)
                    name = name.slice(15)
                }
            }
            font.family: "Mistral"
            font.pointSize: 15
            clip: true
        }
    }

    Image {
        id:gramofon
        x: 53
        y: 56
        width: 630
        height: 486
        source: "images/gramofon"

        RoundButton {
            id:pauseButton
            x: 25
            y: 434
            width: 33
            height: 29
            radius:50
            visible: false

            onClicked: {
                playMusic.pause()
                animation.pause()
                light2.opacity = 0
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    pause.scale = 1
                }
                onEntered: {
                    pause.scale = 1.1
                }
                onClicked: {
                    playMusic.pause()
                    animation.pause()
                    light2.opacity = 0
                }
            }

            background: Rectangle {
                radius: pauseButton.radius
                color: "transparent"
                width:30
                height:30
            }

            Image {
                id: pause
                anchors.fill: parent

                source: "images/pause"
                anchors.leftMargin: 0
                anchors.topMargin: -4
                anchors.rightMargin: 0
                anchors.bottomMargin: -4
            }
        }

        Button {
            id:stop
            x: 486
            y: 367
            width: 55
            height: 40


            Image {
                id: stop2
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "images/Stop"
                anchors.rightMargin: -7
                anchors.bottomMargin: -5
                anchors.leftMargin: -7
                anchors.topMargin: -5
            }

            Image {
                id: stop1
                x: 3
                y: 5
                width: 48
                height: 33
                fillMode: Image.PreserveAspectFit
                source: "images/stop1"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    stop1.scale = 1
                }

                onEntered: {
                    stop1.scale = 1.1
                }

                onClicked: {
                    if(animation.stop) {
                        animation.start()
                    }
                    playMusic.stop()
                    animation.pause()
                    light2.opacity = 0
                }
            }
        }

        StaryButton {
            id: staryButton
            x: 20
            y: 435
            width: 43
            height: 27
            visible: true
            scale: 1
            activeFocusOnTab: false
            focus: false
            antialiasing: true
            transformOrigin: Item.Center
            clip: false
            layer.enabled: false

            MouseArea{
                id:area
                anchors.fill: parent
                hoverEnabled: false
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                onPressed: {
                    if(dial.value < 1) {
                        playMusic.stop()
                    } else if(animation.paused) {
                        animation.resume()
                        playMusic.play()
                        light2.opacity = 1
                    } else if(animation.running) {
                        animation.pause()
                        playMusic.pause()
                        light2.opacity = 0
                        mediaSlider.enabled = true

                    } else {
                        animation.start()
                        playMusic.play()
                        light2.opacity = 1
                    }
                }
            }
        }

        states: [
            State {
                name: "playing"
                when: musicPlayerState == MediaPlayer.PlayingState
                PropertyChanges { target:pauseButton; visible: true }
                PropertyChanges { target:staryButton; visible: false }
            },

            State {
                name: "paused"
                when: musicPlayerState == MediaPlayer.PausedState
                PropertyChanges { target:pauseButton; visible: false }
                PropertyChanges { target:staryButton; visible: true }
            }

        ]

        Slider {
            id: slide
            x: 575
            y: 266
            rotation: 0
            orientation: Qt.Vertical
            value: 0.5

            background: Rectangle {
                x: slide.topPadding + slide.availableWidth / 2 - width / 2
                y: slide.topPadding
                implicitWidth: 4
                implicitHeight: 150
                width: implicitWidth
                height: slide.availableHeight
                radius: 30
                color: "purple"

                Rectangle {
                    width: parent.width
                    height: slide.visualPosition * parent.height
                    color: "grey"
                    radius: 30
                }
            }

            handle: Rectangle {
                y: slide.topPadding + slide.visualPosition * (slide.availableHeight - height)
                implicitWidth: 14
                implicitHeight: 18

                Image {
                    id: suwak
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "images/suwak2.png"
                }
            }
        }

        MediaPlayer {
            id: playMusic            
            audioOutput: AudioOutput {
                volume: slide.value
            }
        }

        Item {
            id: tloRamienia
            x: 541
            y: 121
            width:1
            height: 1
            rotation: 3.928
            transformOrigin: Item.TopRight
            z: 1

            Image {
                id: ramie
                x: -90
                y: -75
                width: 107
                height: 398
                source: "images/ramie"
                rotation: -3
            }

            RotationAnimation {
                id:animacja
                target:tloRamienia
                duration: 1000
            }
        }

        Dial {
            id: dial
            x: 8
            y: 360
            width: 50
            height: 50
            background: Rectangle {
                x: dial.width / 2 - width / 2
                y: dial.height / 2 - height / 2
                implicitWidth: 60
                implicitHeight: 60
                color: "transparent"
                width: Math.max(32, Math.min(dial.width, dial.height))
                height: width
                radius: width / 2
                opacity: 0.7
            }

            handle: Rectangle {
                Image {
                    id: arrow1
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "images/pokretlo.png"
                    antialiasing: true
                }

                id: handleItem
                x: dial.background.x + dial.background.width / 2 - width / 2
                y: dial.background.y + dial.background.height / 2 - height / 2
                width: 60
                height: 60
                color: "transparent"
                radius: 8
                antialiasing: true
                opacity: dial.enabled ? 1 : 0.3
                transform: [
                    Translate {
                        y: -Math.min(dial.background.width, dial.background.height) * 0.6 + handleItem.height / 2
                    },
                    Rotation {
                        angle: dial.angle
                        origin.x: handleItem.width / 2
                        origin.y: handleItem.height / 2
                    }
                ]
            }

            onMoved:
                if(Math.round(dial.value * 100) == 100) {

                    if(animacja.to <= 5) {
                        animacja.stop()
                        animacja.to = 30
                        animacja.from = 4
                        animacja.start()
                        animation2.start()
                        animation2.to = 0
                        animation2.from = 1
                        animation3.start()
                        animation3.to = 0
                        animation3.from = 1
                        animation.restart()
                        animation.stop()
                        light1.opacity = 1
                        view.enabled = false
                        mediaSlider.enabled = true
                        if(view.currentItem == firstPage) {
                            playMusic.source = "C:/PinkFloyd/Another Brick in the Wall, Pt. 2.mp3"
                        } else if(view.currentItem == secondPage) {
                            playMusic.source = "C:/LedZeppelin/All My Love.mp3"
                        } else {
                            playMusic.source = "C:/ACDC/ACDC - Givin the Dog a Bone .mp3"
                        }
                        view.opacity = 0.8
                        buttonNext.nextSong = 0
                        buttonNext.enabled = true
                        buttonPrevious.enabled =true
                        textMusic.visible = true
                        startDuration.visible = true
                        endDuration.visible = true
                    }

                } else if (Math.round(dial.value * 100) == 0) {
                    if(animacja.to == 30) {
                        animacja.to = 4
                        animacja.from = 30
                        animacja.start()
                        animation2.start()
                        animation2.to = 1
                        animation2.from = 0
                        animation3.start()
                        animation3.to = 1
                        animation3.from = 0
                        animation.stop()
                        playMusic.stop()
                        light1.opacity = 0
                        light2.opacity = 0
                        view.enabled = true
                        mediaSlider.enabled = false
                        view.opacity = 1
                        dial.enabled = true
                        buttonNext.enabled = false
                        buttonPrevious.enabled = false
                        textMusic.visible = false
                        listMusicPink.enabled = true
                        startDuration.visible = false
                        endDuration.visible = false
                    }
                }
        }

        Image {
            id:plytaPink
            x: 36
            y: 30
            source: "images/Pinkplyta"
            width: 418
            height: 419
            opacity: 0
        }
        Image {
            id: plytaLed
            x: 36
            y: 33
            source: "images/ledplyta"
            width: 418
            height: 412
            opacity: 0
        }
        Image {
            id: plytaAcdc
            x: 36
            y: 33
            source: "images/acdcPlyta"
            width: 418
            height: 414
            opacity: 0

        }

        Item {
            id:myShape
            width: 452
            height: 374
            anchors.verticalCenterOffset: -23
            anchors.horizontalCenterOffset: -61
            anchors.centerIn: parent

            RotationAnimation {
                id: animation
                target: {
                    if(view.currentItem == firstPage) {
                        plytaPink
                    } else if(view.currentItem == secondPage) {
                        plytaLed
                    } else {
                        plytaAcdc
                    }
                }

                from: 0
                loops: Animation.Infinite
                to:360
                direction: RotationAnimation.Clockwise
                duration: 8500
            }

            NumberAnimation {
                id:animation2
                target:  {
                    if(view.currentItem == firstPage) {
                        plytaPink
                    } else if(view.currentItem == secondPage) {
                        plytaLed
                    } else if(view.currentItem == thirdPage) {
                        plytaAcdc
                    }
                }

                from: 0
                to: 1
                properties: "opacity"
                duration:1000
            }

            NumberAnimation {
                id:animation3
                target: mediaSlider
                from: 0
                to: 1
                properties: "opacity"
                duration:1000
            }
        }

        Rectangle {
            id:light1
            x: 105
            y: 464
            width:6
            height: 3
            radius:4
            opacity: 0
            color: "#a91ad1"
        }

        Rectangle {
            id:light2
            x: 139
            y: 464
            width:6
            height: 3
            radius:4
            opacity:0
            color: "#a91ad1"
        }

        Slider {
            id: mediaSlider
            x: 105
            y: 524
            width: 299
            height: 23
            enabled: false
            to: 1.0
            opacity: 0
            value: playMusic.position / playMusic.duration
            onMoved:{
                playMusic.setPosition(value * playMusic.duration)
            }

            background: Rectangle {
                x: mediaSlider.leftPadding
                y: mediaSlider.topPadding + mediaSlider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: mediaSlider.availableWidth
                height: implicitHeight
                radius: 2
                color: "#bdbebf"

                Rectangle {
                    width: mediaSlider.visualPosition * parent.width
                    height: parent.height
                    color: "purple"
                    radius: 2
                }
            }

            handle: Rectangle {
                x: mediaSlider.leftPadding + mediaSlider.visualPosition * (mediaSlider.availableWidth - width)
                y: mediaSlider.topPadding + mediaSlider.availableHeight / 2 - height / 2
                implicitWidth: 18
                implicitHeight: 18
                radius: 13
                color: "purple"
                border.color: "black"
            }

            ToolTip {
                parent: mediaSlider.handle
                visible: mediaSlider.pressed

                background: Rectangle {
                    radius: width
                    color: "purple"
                }

                text: {
                    var m = Math.floor(playMusic.position / 60000)
                    var ms = (playMusic.position / 1000 - m * 60).toFixed(0)
                    return `${m}:${ms.padStart(2, 0)}`                    
                }
                font.family: "Mistral"

                y: parent.height
            }
        }

        DirMp3 {
            id:dirmp3Pink
            path: "/PinkFloyd"
        }

        DirMp3 {
            id:dirmp3Led
            path: "/LedZeppelin"
        }

        DirMp3 {
            id:dirmp3Acdc
            path: "/ACDC"
        }

        Button {
            id:buttonNext
            x: 504
            y: 425
            width: 54
            height: 47
            enabled: false
            property int nextSong: 0

            Image {
                id: imageNextBack
                x: -8
                y: 0
                width: 62
                height: 47
                source: "images/Stop"
            }

            Image {
                id:imageNextForw
                x: -2
                y: 7
                width: 45
                height: 35
                source: "images/next"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onExited: {
                    imageNextForw.scale = 1
                }

                onEntered: {
                    imageNextForw.scale = 1.1
                }

                onClicked: {
                    stop.clicked()
                    if(view.currentItem == firstPage){
                        var files =dirmp3Pink.file
                        if(buttonNext.nextSong == files.length - 1) {
                            buttonNext.nextSong = -1
                        }
                        buttonNext.nextSong++
                        playMusic.source = "C:" + files[buttonNext.nextSong]
                    } else if (view.currentItem == secondPage) {
                        var files1 = dirmp3Led.file
                        if(buttonNext.nextSong == files1.length - 1) {
                            buttonNext.nextSong = -1
                        }
                        buttonNext.nextSong++
                        playMusic.source = "C:" + files1[buttonNext.nextSong]
                    } else {
                        var files2 = dirmp3Acdc.file
                        if(buttonNext.nextSong == files2.length - 1) {
                            buttonNext.nextSong = -1
                        }
                        buttonNext.nextSong++
                        playMusic.source = "C:" + files2[buttonNext.nextSong]
                    }
                    playMusic.play()
                    if(animation.stopped) {
                        animation.start()
                    }
                    animation.resume()
                    light2.opacity = 1
                }
            }
        }

        Button {
            id:buttonPrevious
            x: 421
            y: 425
            width: 54
            height: 47

            Image {
                id: imagePreviousBack
                x: -8
                y: 0
                width: 62
                height: 47
                source: "images/Stop"
            }

            Image {
                id:imagePreviousForw
                x: 4
                y: 8
                width: 40
                height: 34
                source: "images/previous"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onExited: {
                    imagePreviousForw.scale = 1
                }

                onEntered: {
                    imagePreviousForw.scale = 1.1
                }

                onClicked: {
                    stop.clicked()
                    if(view.currentItem == firstPage){
                        var files = dirmp3Pink.file
                        if(buttonNext.nextSong == 0) {
                            buttonNext.nextSong = files.length
                        }
                        buttonNext.nextSong--
                        playMusic.source = "C:" + files[buttonNext.nextSong]
                    } else if (view.currentItem == secondPage) {
                        var files1 = dirmp3Led.file
                        if(buttonNext.nextSong == 0) {
                            buttonNext.nextSong = files1.length
                        }
                        buttonNext.nextSong--
                        playMusic.source = "C:" + files1[buttonNext.nextSong]
                    } else {
                        var files2 = dirmp3Acdc.file
                        if(buttonNext.nextSong == 0) {
                            buttonNext.nextSong = files2.length
                        }
                        buttonNext.nextSong--
                        playMusic.source = "C:" + files2[buttonNext.nextSong]
                    }
                    playMusic.play()
                    if(animation.stopped) {
                        animation.start()
                    }
                    animation.resume()
                    light2.opacity = 1

                }
            }
        }

        Label {
            width: 100
            height: 100

            Text {
                id:startDuration
                anchors.fill:parent
                anchors.rightMargin: 8
                anchors.bottomMargin: -442
                anchors.leftMargin: 72
                anchors.topMargin: 528
                color:"white"
                text:"0:00"
                font.family: "Mistral"
                font.pointSize: 11
                visible: false
            }
        }

        Label {
            id:endDuration
            x: 421
            y: 527
            width: 40
            height: 18
            visible: false

            Text {
                anchors.fill:parent
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                color:"white"
                font.family: "Mistral"
                font.pointSize: 11
                text:{
                    var m = Math.floor(playMusic.duration / 60000)
                    var ms = (playMusic.duration / 1000 - m * 60).toFixed(0)
                    return `${m}:${ms.padStart(2, 0)}`
                }
            }
        }
    }
}





