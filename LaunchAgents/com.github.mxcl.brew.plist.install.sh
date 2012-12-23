#!/bin/bash
label="com.github.mxcl.brew"
plist="${HOME}/Library/LaunchAgents/${label}.plist"
cat >"${plist}" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>${label}</string>

    <key>ServiceDescription</key>
    <string>homebrew update</string>

    <key>ProgramArguments</key>
    <array>
      <string>/usr/local/bin/brew</string>
      <string>update</string>
    </array>

    <key>WorkingDirectory</key>
    <string>/usr/local</string>

    <key>StartInterval</key>
    <integer>43200</integer><!-- 12 hours in seconds -->
  </dict>
</plist>
EOF
launchctl load -w "${plist}"
