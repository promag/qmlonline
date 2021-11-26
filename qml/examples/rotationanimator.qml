import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Qt.labs.lottieqt 1.0

Rectangle {
    anchors.fill: parent
    color: 'black'

    ColumnLayout {
        anchors.centerIn: parent
        width: 400
        ButtonGroup {
            id: group
        }
        spacing: 15
    
        OptionButton {
            ButtonGroup.group: group
            Layout.fillWidth: true
            text: qsTr('Fast always on')
            description: qsTr('Loads quickly at all times and uses as much cellular data as needed.')
            recommended: true
        }
        OptionButton {
            ButtonGroup.group: group
            Layout.fillWidth: true
            checked: true
            text: qsTr('Slow always on')
            description: qsTr('Loads quickly at all times and uses as much cellular data as needed.')
        }
        OptionButton {
            ButtonGroup.group: group
            Layout.fillWidth: true
            text: qsTr('Only when on Wi-Fi')
            description: qsTr('Loads quickly when on wi-fi and pauses when on cellular data.')
        }
    }
    
    component OptionButton: Button {
        property string description
        property bool recommended: false
        id: button
        padding: 15
        checkable: true
        background: Rectangle {
            border.width: 1
            border.color: button.checked ? '#F7931A' : button.hovered ? 'white' : '#999999'
            radius: 10
            color: 'transparent'
            Rectangle {
                visible: button.visualFocus
                anchors.fill: parent
                anchors.margins: -4
                border.width: 2
                border.color: '#F7931A'
                radius: 14
                color: 'transparent'
                opacity: 0.4
            }
        }
        contentItem: ColumnLayout {
            spacing: 3
            Label {
                Layout.fillWidth: true
                Layout.preferredWidth: 0
                font.family: 'Inter'
                font.styleName: 'Regular'
                font.pointSize: 18
                color: 'white'
                text: button.text
                wrapMode: Text.WordWrap
            }
            Label {
                Layout.fillWidth: true
                Layout.preferredWidth: 0
                font.family: 'Inter'
                font.styleName: 'Regular'
                font.pixelSize: 15
                color: '#DEDEDE'
                text: button.description
                wrapMode: Text.WordWrap
            }
            Loader {
                Layout.topMargin: 2
                active: button.recommended
                visible: active
                sourceComponent: Label {
                    background: Rectangle {
                        color: 'white'
                        radius: 3
                    }
                    font.styleName: 'Regular'
                    font.pixelSize: 13
                    topPadding: 3
                    rightPadding: 7
                    bottomPadding: 4
                    leftPadding: 7
                    color: 'black'
                    text: qsTr('Recommended')
                }
            }
        }
    }
}

