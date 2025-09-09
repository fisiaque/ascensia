import app from "ags/gtk4/app"
import GLib from "gi://GLib"
import Astal from "gi://Astal?version=4.0"
import Gtk from "gi://Gtk?version=4.0"
import Gdk from "gi://Gdk?version=4.0"
import AstalBattery from "gi://AstalBattery"
import AstalPowerProfiles from "gi://AstalPowerProfiles"
import { For, With, createBinding, onCleanup } from "ags"
import { createPoll } from "ags/time"

const position = "top"
const Positioning: Record<string, number> = {
  top: Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
  bottom: Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
  left: Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.LEFT,
  right: Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.RIGHT,
}

function Clock({ format = "%H:%M" }) {
  const time = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format(format)!
  })

  return (
    <menubutton>
      <label label={time} />
      <popover>
        <Gtk.Calendar />
      </popover>
    </menubutton>
  )
}

function Battery() {
  const battery = AstalBattery.get_default()
  const powerprofiles = AstalPowerProfiles.get_default()

  const percent = createBinding(
    battery,
    "percentage",
  )((p) => `${Math.floor(p * 100)}%`)

  const setProfile = (profile: string) => {
    powerprofiles.set_active_profile(profile)
  }

  return (
    <menubutton visible={createBinding(battery, "isPresent")}>
      <box>
        <image iconName={createBinding(battery, "iconName")} />
        <label label={percent} />
      </box>
      <popover>
        <box orientation={Gtk.Orientation.VERTICAL}>
          {powerprofiles.get_profiles().map(({ profile }) => (
            <button onClicked={() => setProfile(profile)}>
              <label label={profile} xalign={0} />
            </button>
          ))}
        </box>
      </popover>
    </menubutton>
  )
}

export default function Bar({ gdkmonitor }: { gdkmonitor: Gdk.Monitor}) {
  let win: Astal.window
  const anchor = Positioning[position]
 
  onCleanup(() => {
    win.destroy()
  })

  return (
    <window
      $={(self) => (win = self)}
      visible
      namespace="my-bar"
      name={`bar-${gdkmonitor.connector}`}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={anchor}
      application={app}
    >
      <centerbox>
        <box $type="start">
          <Clock />
        </box>
        <box $type="end">
          <Battery />
        </box>
      </centerbox>
    </window>
  )
}