#!/bin/bash

mkdir -p ${HOME}/UIAutomation/log
cd ${HOME}/UIAutomation/log && instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate /Users/mczenko/UIAutomation/build/bin/Release-iphonesimulator/HelloWorld.app -e UIASCRIPT /Users/mczenko/Projects/Spikes/UIAutomation-jasmine-iphone/JasmineStyleUIAutomationTests/suite.js -e UIARESULTSPATH /Users/mczenko/UIAutomation/log/
