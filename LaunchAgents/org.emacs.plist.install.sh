#!/bin/bash
label="org.emacs"
plist="${HOME}/Library/LaunchAgents/${label}.plist"
cat >"${plist}" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>${label}</string>

    <key>ProgramArguments</key>
    <array>
      <string>${HOME}/.bash/bin/emacs-daemon</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>WorkingDirectory</key>
    <string>${HOME}</string>

    <key>ServiceDescription</key>
    <string>Emacs Daemon</string>
  </dict>
</plist>
EOF
launchctl load -w "${plist}"
