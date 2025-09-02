import QtQuick
import Quickshell
import QtQuick.Layouts

PanelWindow {
    id: panel
    color: "#1a1a1a"  
    
    // Panel position: "top", "bottom", "left", or "right"
    property string position: "right"

    // Anchors based on position
    anchors {
        top: position === "top"
        bottom: position === "bottom"
        left: position === "left"
        right: position === "right"
    }

    // Force full length along screen edge
    width: (position === "top" || position === "bottom") ? Screen.width : implicitWidth
    height: (position === "left" || position === "right") ? Screen.height : implicitHeight

    // Default thickness for horizontal/vertical bars
    implicitHeight: (position === "top" || position === "bottom") ? 42 : undefined
    implicitWidth: (position === "left" || position === "right") ? 42 : undefined

    margins {
        top: 0
        left: 0
        right: 0
        bottom: 0
    }

    // Content placeholder
    Item {
        id: content
        anchors.fill: parent
    }
}
