import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: "Moving a circle across the canvas"
    Rectangle{
        id: scene
        anchors.fill: parent
        state: "LeftRect"

        Rectangle{
            id: leftRect
            x: parent.x + 40
            y: 200
            width: 100
            height: 100
            color: "lightGrey"
            border.color: "black"
            border.width: 3
            radius: 5

            Text {
                id: textLeftRect
                text: "move"
                anchors.centerIn: parent
            }


            MouseArea{
                anchors.fill: parent
                onClicked:{
                    scene.state = "OtherState"
                    ball.x += Math.random()* ball.width
                    if(ball.x + ball.width >= rightRect.x){
                        scene.state = "InitialState"
                    }
                }
            }

        }
        Rectangle{
            id: rightRect
            x: (parent.x + parent.width) - (width + 40)
            y: 200
            width: 100
            height: 100
            color: "lightGrey"
            border.color: "black"
            border.width: 3
            radius: 5

            Text {
                id: textRightRect
                text: "return"
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
        }
        Rectangle{
            id: ball
            x: leftRect.x+5
            y: leftRect.y+5
            width: leftRect.width - 10
            height: leftRect.height - 10
            border.width: 2
            border.color: "black"
            color: "yellow"
            radius: width/2
        }
        states: [
            State {
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x: leftRect.x + 5
                }
            },
            State {
                name: "OtherState"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            }
        ]
        transitions: [
            Transition {
                from: "OtherState"
                to: "InitialState"
                NumberAnimation {
                    properties: "x, y"
                    duration: 1000
                    easing.type: Easing.OutBack
                }
            }
        ]
    }
}
