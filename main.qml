import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Zr的Ubuntu_Qt App")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }
    }

    Timer{
        id:timer_
        interval: 1500
        repeat: true
        running: true
        onTriggered: {
            if(tabBar.currentIndex===0)
                tabBar.currentIndex=1
            else
                tabBar.currentIndex=0
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("页面1")
        }
        TabButton {
            text: qsTr("页面2")
        }
    }
}
