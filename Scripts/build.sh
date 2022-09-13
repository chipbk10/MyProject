# How SPM works on CI
# To build a project with SPM, you do not need to start by calling the command to resolve dependencies because it is included in the build.

scheme="MyProject"
destination="platform=iOS Simulator,name=iPhone 11"

# On local machines fetched and built dependencies are stored in the derived data directory,
# ~/Library/Developer/Xcode/DerivedData

# while CI clears build-cache after every run.
# Since on CI it needs to be done whenever the job runs, it slows down the process.
# The best way to speed up job on CI is to cache dependencies.
# You should specify the download folder explicitly by using parameter -clonedSourcePackagesDirPath.
spmCache="spm"

# This command simultaneously checks dependencies,
# downloads missing packages, and then starts the usual build of the application.
xcodebuild build -scheme $scheme -destination "$destination" # -clonedSourcePackagesDirPath $spmCache

# sources
# [SPM - how to cache it with CI](https://www.uptech.team/blog/swift-package-manager)
# [Building from the Command Line with Xcode FAQ](https://developer.apple.com/library/archive/technotes/tn2339/_index.html)

