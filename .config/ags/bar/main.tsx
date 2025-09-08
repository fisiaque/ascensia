import { Astal } from "ags/gtk4"
import { createPoll } from "ags/time"

const Positioning: Record<string, number> = {
  top: Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
  bottom: Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
  left: Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.LEFT,
  right: Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.RIGHT,
}

export const Bar = (position: "top" | "bottom" | "left" | "right") => {
  const clock = createPoll("", 1000, "date")
  const anchor = Positioning[position]

  return (
    <window visible anchor={anchor}>
      <label label={clock} />
    </window>
  )
}
