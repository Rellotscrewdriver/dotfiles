while true; do

  # fetches window manager and it's version
  WM=$(fastfetch -s wm --format json | jq -r ".[].result.prettyName")
  WMver=$(fastfetch -s wm --format json | jq -r ".[].result.version")

  # fetches operating system(or distro)
  OS=$(fastfetch -s os --format json | jq -r ".[].result.prettyName")

  # Output JSON
	echo "{\"wm\": \"${WM}\", \"wmver\": ${WMver}, \"distro\": \"${OS}\"}"

	sleep 2000
done
