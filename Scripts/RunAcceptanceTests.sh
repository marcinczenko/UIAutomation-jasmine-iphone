#!/bin/bash

mkdir -p ${HOME}/UIAutomation/log
cd ${HOME}/UIAutomation/log && instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate \
 ${HOME}/UIAutomation/build/bin/Release-iphonesimulator/HelloWorld.app \
 -e UIASCRIPT ./JasmineStyleUIAutomationTests/suite.js -e UIARESULTSPATH ${HOME}UIAutomation/log/
