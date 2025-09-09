import { createBinding, For, This } from "ags"
import app from "ags/gtk4/app"
import Bar from "./bar/main.tsx"

app.start({
  gtkTheme: "Adwaita",
  main() {
    const monitors = createBinding(app, "monitors")

    return (
      <For each={monitors}>
        {(monitor) => (
          <This this={app}>
            <Bar gdkmonitor={monitor} />
          </This>
        )}
      </For>
    )
  },
})