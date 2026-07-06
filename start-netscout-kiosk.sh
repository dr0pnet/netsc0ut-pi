#!/bin/bash

export DISPLAY=:0

# wait until NetSc0ut is actually answering
until curl -s http://127.0.0.1:5055 >/dev/null; do
  sleep 1
done

# tiny delay so static files are ready too
sleep 2

chromium-browser \
  --kiosk \
  --app=http://127.0.0.1:5055 \
  --noerrdialogs \
  --disable-infobars \
  --disable-session-crashed-bubble \
  --disable-features=TranslateUI \
  --check-for-update-interval=31536000 \
  --disable-component-update \
  --overscroll-history-navigation=0 \
  --start-fullscreen
