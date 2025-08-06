# Warp-Assessment
This repository contains an iOS Assessment project for Warp Development that encapsulates the Github API to search for a user and display data on screen.

![](https://github.com/Juliaan/Warp-Assessment/blob/main/ScreenRecording.gif)

### Get Started

1. Clone the project to your local environment using terminal or any git client installed on your computer.
   - URL: https://github.com/Juliaan/Warp-Assessment.git
     - Example: git clone https://github.com/Juliaan/Warp-Assessment.git
> [!NOTE]
> Use the main branch.    

2. After cloning the repo, navigate to the location and open the Warp-Assessment.xcodeproj with Xcode.
3. Ensure that you have selected the appropriate team under Signing and Capabilities
4. Preverably run the app on a device otherwise run the app in a Simulator
  
### Project Summary

1. Language: Swift and SwiftUI
2. Architecture / Design pattern: MVVM
3. API: Call is made to https://api.github.com/users/{username} to retrieve user data.
4. URLSession is used, no 3rd-party frameworks.
5. In my GitHub user project, I did not find it necessary to use Tuist because the project's scope was relatively simple, with only a few targets and dependencies. I preferred to manage configurations and dependencies directly within Xcode and leverage native tools like Swift Package Manager, which are straightforward and sufficient for smaller projects. Using Tuist is more advantageous in larger or more complex projects requiring extensive automation and project scaffolding, which was not needed in this case.
6. One small XCTest added just for demonstration purposes.
   
