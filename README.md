Fabcasa iOS
===

General Swift madness and learning :) 


#Examples

##Swift Crash-swift
Because you dont really understand a language until you understand how to crash it :)
[/Examples/Crash-swift](/Examples/Crash-swift)

##Swift MultipeerConnectivity-swift
Simple chat app using Multipeer Connectivity Mesh networking
[/Examples/MultipeerConnectivity-swift](Examples/MultipeerConnectivity-swift)

##Swift imageload-swift
Swift simple Image loading
[/Examples/imageload-swift](Examples/imageload-swift)


##Swift messaging-swift
Simple Message Chat UIX in Swift
[/Examples/messaging-swift](Examples/messaging-swift)


#Test


###Specific test class
`
xcodebuild test -scheme Tests -destination "name=iPhone Retina (4-inch 64-bit),OS=7.0" GCC_PREPROCESSOR_DEFINITIONS='DEBUG=1 TEST_ONLY=\"TestCaseSample1\"'
`

###Specific test case

`
xcodebuild test -scheme Tests -destination "name=iPhone Retina (4-inch 64-bit),OS=7.0" GCC_PREPROCESSOR_DEFINITIONS='DEBUG=1 TEST_ONLY=\"TestCaseSample1/testExample1\"'
`

###All tests
`
xcodebuild test -scheme FabcasaTests -destination "name=iPhone Retina (4-inch 64-bit),OS=7.0"
`

###Test on iPad

`
xcodebuild test -scheme FabcasaTests -destination "platform=iOS Simulator,name=iPad Retina,OS=latest"
`


###helpful xcodebuild commands
- Show SDK's `xcodebuild -showsdks`


---

xcodebuild test -scheme FabcasaTests

---


xcodebuild test -scheme FabcasaTests -destination "platform=iOS Simulator,name=iPad Retina,OS=latest"

xcodebuild test -scheme FabcasaTests -destination "platform=iOS Simulator,OS=7.1,name=iPhone Retina (4-inch)"


xctool test -test-sdk iphonesimulator7.0 -simulator ipad



iPad works fine:
xctool.sh -workspace MyProject.xcworkspace -scheme UITests -sdk iphonesimulator -configuration Debug -destination "platform=iOS Simulator,name=iPad Retina,OS=latest" test

iPhone doesn't command line: 
xctool.sh -workspace Myproject.xcworkspace -scheme UITests -sdk iphonesimulator -configuration Debug -destination "platform=iOS Simulator,OS=latest,name=iPhone Retina (4-inch)" test


xcodebuild -workspace MyProject.xcworkspace -scheme UITests -configuration Debug -destination "platform=iOS Simulator,OS=7.1,name=iPhone Retina (4-inch)" test

