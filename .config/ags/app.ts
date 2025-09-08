import app from "ags/gtk4/app"
import { Bar } from "./bar/main.tsx"

app.start({
  main: () => Bar("top"),
})
