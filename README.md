# mycaselog

my log of surgeries

## Getting Started

This project is a starting point for a Mycaselog application.

## create a new project with command
flutter create --org com.xxx -i swift -a kotlin --description 'my log of surgeries' mycaselog

## add firebase with command
lutterFire configure -a com.xxx.mycaselog

## update Podfile to add firebase compiled code
pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '10.24.0'

## update info.plist in Runner folder to add code for google signin - LIKE
<key>GIDClientID</key>
<!-- TODO Replace this value: -->
<!-- Copied from GoogleService-Info.plist key CLIENT_ID -->
<string>575010129050-v9hcf364sk7bs7vvl9ojofuol9bak7qq.apps.googleusercontent.com</string>
<!-- Put me in the [my_project]/ios/Runner/Info.plist file -->
<!-- Google Sign-in Section -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- TODO Replace this value: -->
            <!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
            <string>com.googleusercontent.apps.575010129050-v9hcf364sk7bs7vvl9ojofuol9bak7qq</string>
        </array>
    </dict>
</array>
<!-- End of the Google Sign-in Section -->

