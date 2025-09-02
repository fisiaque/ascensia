//@ pragma UseQApplication
import QtQuick
import Quickshell
import "./modules/bar/"

ShellRoot {
    id: root

    // You can keep volume properties if you plan to add volume later
    property int volume: 0
    property bool volumeMuted: false

    Loader {
        active: true
        sourceComponent: Bar {
            // Pass only existing properties
            // Since barebones Bar.qml has no defaultAudioSink
            // you can later add them when needed
            // For now, it's just an empty panel
        }
    }
}
