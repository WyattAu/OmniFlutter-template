# OmniFlutter-template

A flutter template design to be a starting point of any flutter projects

## Makefile support

Run `Make help` for more options.

## VSCode Integration

This repository includes a launch.json and task.json for common Flutter development options.

## Example

There exist a todo app example in the directory, however, the supabase table does not actually exist, only serve as an example. The example also include a very basic usage of `bloc`, `drift`+`sqlite3`.

## Project structure

```markdown
omniflutter_template
├─ .metadata
├─ analysis_options.yaml
├─ android
│  ├─ .kotlin
│  │  ├─ errors
│  │  └─ sessions
│  ├─ app
│  │  ├─ build.gradle.kts
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  ├─ kotlin
│  │     │  │  └─ com
│  │     │  │     └─ example
│  │     │  │        └─ omniflutter_template
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ drawable-v21
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     ├─ mipmap-mdpi
│  │     │     ├─ mipmap-xhdpi
│  │     │     ├─ mipmap-xxhdpi
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     ├─ values
│  │     │     │  └─ styles.xml
│  │     │     └─ values-night
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle.kts
│  ├─ gradle
│  │  └─ wrapper
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  └─ settings.gradle.kts
├─ assets
│  └─ fonts
│     ├─ Inter
│     │  ├─ Inter-Bold.ttf
│     │  ├─ Inter-Medium.ttf
│     │  ├─ Inter-Regular.ttf
│     │  └─ Inter-SemiBold.ttf
│     └─ Poppins
│        ├─ Poppins-Bold.ttf
│        ├─ Poppins-Medium.ttf
│        ├─ Poppins-Regular.ttf
│        └─ Poppins-SemiBold.ttf
├─ CODE_OF_CONDUCT.md
├─ CONTRIBUTING.md
├─ devtools_options.yaml
├─ ios
│  ├─ Flutter
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  ├─ AppIcon.appiconset
│  │  │  │  └─ Contents.json
│  │  │  └─ LaunchImage.imageset
│  │  │     ├─ Contents.json
│  │  │     └─ README.md
│  │  ├─ Base.lproj
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  ├─ contents.xcworkspacedata
│  │  │  └─ xcshareddata
│  │  │     ├─ IDEWorkspaceChecks.plist
│  │  │     └─ WorkspaceSettings.xcsettings
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  ├─ Runner.xcworkspace
│  │  ├─ contents.xcworkspacedata
│  │  └─ xcshareddata
│  │     ├─ IDEWorkspaceChecks.plist
│  │     └─ WorkspaceSettings.xcsettings
│  └─ RunnerTests
│     └─ RunnerTests.swift
├─ lib
│  ├─ main.dart
│  └─ src
│     ├─ app.dart
│     ├─ core
│     │  ├─ constants
│     │  │  ├─ color_const.dart
│     │  │  └─ typography_const.dart
│     │  ├─ error
│     │  │  ├─ failure.dart
│     │  │  └─ failure.freezed.dart
│     │  └─ utils
│     │     └─ logger.dart
│     ├─ features
│     │  └─ todo
│     │     ├─ application
│     │     │  ├─ todo_bloc.dart
│     │     │  ├─ todo_bloc.freezed.dart
│     │     │  ├─ todo_event.dart
│     │     │  └─ todo_state.dart
│     │     ├─ data
│     │     │  ├─ datasources
│     │     │  │  ├─ local
│     │     │  │  │  ├─ database.dart
│     │     │  │  │  ├─ database.g.dart
│     │     │  │  │  ├─ database_impl.dart
│     │     │  │  │  ├─ database_impl_io.dart
│     │     │  │  │  ├─ database_impl_web.dart
│     │     │  │  │  └─ todo_dao.dart
│     │     │  │  └─ remote
│     │     │  │     ├─ supabase_client.dart
│     │     │  │     └─ supabase_service.dart
│     │     │  └─ repositories
│     │     │     └─ todo_repository_impl.dart
│     │     ├─ domain
│     │     │  ├─ entities
│     │     │  │  ├─ todo.dart
│     │     │  │  ├─ todo.freezed.dart
│     │     │  │  └─ todo.g.dart
│     │     │  └─ repositories
│     │     │     └─ todo_repository.dart
│     │     └─ presentation
│     │        ├─ pages
│     │        │  └─ todo_page.dart
│     │        └─ widgets
│     │           ├─ add_todo_dialog.dart
│     │           └─ todo_tile.dart
│     ├─ shared
│     │  └─ providers
│     │     ├─ database_provider.dart
│     │     ├─ providers.dart
│     │     └─ todo_providers.dart
│     └─ themes
│        └─ app_theme.dart
├─ LICENSE
├─ linux
│  ├─ CMakeLists.txt
│  ├─ flutter
│  │  ├─ CMakeLists.txt
│  │  └─ ephemeral
│  │     └─ .plugin_symlinks
│  │        ├─ app_links_linux
│  │        │  ├─ analysis_options.yaml
│  │        │  ├─ CHANGELOG.md
│  │        │  ├─ lib
│  │        │  │  └─ app_links_linux.dart
│  │        │  ├─ LICENSE
│  │        │  ├─ pubspec.yaml
│  │        │  └─ README.md
│  │        ├─ gtk
│  │        │  ├─ CHANGELOG.md
│  │        │  ├─ codecov.yaml
│  │        │  ├─ example
│  │        │  │  ├─ analysis_options.yaml
│  │        │  │  ├─ lib
│  │        │  │  │  └─ main.dart
│  │        │  │  ├─ linux
│  │        │  │  │  ├─ CMakeLists.txt
│  │        │  │  │  ├─ flutter
│  │        │  │  │  │  └─ CMakeLists.txt
│  │        │  │  │  ├─ main.cc
│  │        │  │  │  ├─ my_application.cc
│  │        │  │  │  └─ my_application.h
│  │        │  │  ├─ pubspec.yaml
│  │        │  │  ├─ pubspec_overrides.yaml
│  │        │  │  ├─ README.md
│  │        │  │  └─ web
│  │        │  │     ├─ icons
│  │        │  │     ├─ index.html
│  │        │  │     └─ manifest.json
│  │        │  ├─ ffigen.yaml
│  │        │  ├─ lib
│  │        │  │  ├─ gtk.dart
│  │        │  │  └─ src
│  │        │  │     ├─ constants.dart
│  │        │  │     ├─ gtk_application.dart
│  │        │  │     ├─ gtk_application_notifier.dart
│  │        │  │     ├─ gtk_settings.dart
│  │        │  │     ├─ gtk_settings_real.dart
│  │        │  │     ├─ gtk_settings_stub.dart
│  │        │  │     ├─ libgtk.dart
│  │        │  │     └─ libgtk.g.dart
│  │        │  ├─ LICENSE
│  │        │  ├─ linux
│  │        │  │  ├─ CMakeLists.txt
│  │        │  │  ├─ gtk_plugin.cc
│  │        │  │  └─ include
│  │        │  │     └─ gtk
│  │        │  │        └─ gtk_plugin.h
│  │        │  ├─ pubspec.yaml
│  │        │  ├─ README.md
│  │        │  ├─ renovate.json
│  │        │  └─ test
│  │        │     ├─ gtk_application_notifier_test.dart
│  │        │     ├─ gtk_application_test.dart
│  │        │     ├─ gtk_settings_test.dart
│  │        │     ├─ test_utils.dart
│  │        │     └─ test_utils.mocks.dart
│  │        ├─ path_provider_linux
│  │        │  ├─ AUTHORS
│  │        │  ├─ CHANGELOG.md
│  │        │  ├─ example
│  │        │  │  ├─ integration_test
│  │        │  │  │  └─ path_provider_test.dart
│  │        │  │  ├─ lib
│  │        │  │  │  └─ main.dart
│  │        │  │  ├─ linux
│  │        │  │  │  ├─ CMakeLists.txt
│  │        │  │  │  ├─ flutter
│  │        │  │  │  │  └─ CMakeLists.txt
│  │        │  │  │  ├─ main.cc
│  │        │  │  │  ├─ my_application.cc
│  │        │  │  │  └─ my_application.h
│  │        │  │  ├─ pubspec.yaml
│  │        │  │  ├─ README.md
│  │        │  │  └─ test_driver
│  │        │  │     └─ integration_test.dart
│  │        │  ├─ lib
│  │        │  │  ├─ path_provider_linux.dart
│  │        │  │  └─ src
│  │        │  │     ├─ get_application_id.dart
│  │        │  │     ├─ get_application_id_real.dart
│  │        │  │     ├─ get_application_id_stub.dart
│  │        │  │     └─ path_provider_linux.dart
│  │        │  ├─ LICENSE
│  │        │  ├─ pubspec.yaml
│  │        │  ├─ README.md
│  │        │  └─ test
│  │        │     ├─ get_application_id_test.dart
│  │        │     └─ path_provider_linux_test.dart
│  │        ├─ shared_preferences_linux
│  │        │  ├─ AUTHORS
│  │        │  ├─ CHANGELOG.md
│  │        │  ├─ example
│  │        │  │  ├─ integration_test
│  │        │  │  │  └─ shared_preferences_test.dart
│  │        │  │  ├─ lib
│  │        │  │  │  └─ main.dart
│  │        │  │  ├─ linux
│  │        │  │  │  ├─ CMakeLists.txt
│  │        │  │  │  ├─ flutter
│  │        │  │  │  │  └─ CMakeLists.txt
│  │        │  │  │  ├─ main.cc
│  │        │  │  │  ├─ my_application.cc
│  │        │  │  │  └─ my_application.h
│  │        │  │  ├─ pubspec.yaml
│  │        │  │  ├─ README.md
│  │        │  │  └─ test_driver
│  │        │  │     └─ integration_test.dart
│  │        │  ├─ lib
│  │        │  │  └─ shared_preferences_linux.dart
│  │        │  ├─ LICENSE
│  │        │  ├─ pubspec.yaml
│  │        │  ├─ README.md
│  │        │  └─ test
│  │        │     ├─ fake_path_provider_linux.dart
│  │        │     ├─ legacy_shared_preferences_linux_test.dart
│  │        │     └─ shared_preferences_linux_async_test.dart
│  │        ├─ sqlite3_flutter_libs
│  │        │  ├─ android
│  │        │  │  ├─ build.gradle
│  │        │  │  ├─ settings.gradle
│  │        │  │  └─ src
│  │        │  │     ├─ main
│  │        │  │     │  ├─ AndroidManifest.xml
│  │        │  │     │  ├─ java
│  │        │  │     │  │  └─ eu
│  │        │  │     │  │     └─ simonbinder
│  │        │  │     │  │        └─ sqlite3_flutter_libs
│  │        │  │     │  │           └─ Sqlite3FlutterLibsPlugin.java
│  │        │  │     │  └─ kotlin
│  │        │  │     │     └─ com
│  │        │  │     │        └─ example
│  │        │  │     │           └─ sqlite3_flutter_libs
│  │        │  │     └─ test
│  │        │  │        └─ kotlin
│  │        │  │           └─ com
│  │        │  │              └─ example
│  │        │  │                 └─ sqlite3_flutter_libs
│  │        │  ├─ CHANGELOG.md
│  │        │  ├─ darwin
│  │        │  │  ├─ sqlite3_flutter_libs
│  │        │  │  │  ├─ Package.resolved
│  │        │  │  │  ├─ Package.swift
│  │        │  │  │  └─ Sources
│  │        │  │  │     └─ sqlite3_flutter_libs
│  │        │  │  │        └─ Sqlite3FlutterLibsPlugin.swift
│  │        │  │  └─ sqlite3_flutter_libs.podspec
│  │        │  ├─ example
│  │        │  │  ├─ android
│  │        │  │  │  ├─ app
│  │        │  │  │  │  └─ src
│  │        │  │  │  │     ├─ debug
│  │        │  │  │  │     ├─ main
│  │        │  │  │  │     │  ├─ kotlin
│  │        │  │  │  │     │  │  └─ com
│  │        │  │  │  │     │  │     └─ example
│  │        │  │  │  │     │  │        └─ sqlite3_flutter_libs_example
│  │        │  │  │  │     │  └─ res
│  │        │  │  │  │     │     ├─ drawable
│  │        │  │  │  │     │     ├─ drawable-v21
│  │        │  │  │  │     │     ├─ mipmap-hdpi
│  │        │  │  │  │     │     ├─ mipmap-mdpi
│  │        │  │  │  │     │     ├─ mipmap-xhdpi
│  │        │  │  │  │     │     ├─ mipmap-xxhdpi
│  │        │  │  │  │     │     ├─ mipmap-xxxhdpi
│  │        │  │  │  │     │     ├─ values
│  │        │  │  │  │     │     └─ values-night
│  │        │  │  │  │     └─ profile
│  │        │  │  │  └─ gradle
│  │        │  │  │     └─ wrapper
│  │        │  │  │        └─ gradle-wrapper.properties
│  │        │  │  ├─ integration_test
│  │        │  │  ├─ ios
│  │        │  │  │  ├─ Flutter
│  │        │  │  │  ├─ Runner
│  │        │  │  │  │  ├─ Assets.xcassets
│  │        │  │  │  │  │  ├─ AppIcon.appiconset
│  │        │  │  │  │  │  └─ LaunchImage.imageset
│  │        │  │  │  │  └─ Base.lproj
│  │        │  │  │  ├─ Runner.xcodeproj
│  │        │  │  │  │  ├─ project.xcworkspace
│  │        │  │  │  │  │  └─ xcshareddata
│  │        │  │  │  │  └─ xcshareddata
│  │        │  │  │  │     └─ xcschemes
│  │        │  │  │  ├─ Runner.xcworkspace
│  │        │  │  │  │  └─ xcshareddata
│  │        │  │  │  └─ RunnerTests
│  │        │  │  ├─ lib
│  │        │  │  ├─ linux
│  │        │  │  │  ├─ flutter
│  │        │  │  │  └─ runner
│  │        │  │  ├─ macos
│  │        │  │  │  ├─ Flutter
│  │        │  │  │  ├─ Runner
│  │        │  │  │  │  ├─ Assets.xcassets
│  │        │  │  │  │  │  └─ AppIcon.appiconset
│  │        │  │  │  │  ├─ Base.lproj
│  │        │  │  │  │  └─ Configs
│  │        │  │  │  ├─ Runner.xcodeproj
│  │        │  │  │  │  ├─ project.xcworkspace
│  │        │  │  │  │  │  └─ xcshareddata
│  │        │  │  │  │  └─ xcshareddata
│  │        │  │  │  │     └─ xcschemes
│  │        │  │  │  ├─ Runner.xcworkspace
│  │        │  │  │  │  └─ xcshareddata
│  │        │  │  │  └─ RunnerTests
│  │        │  │  ├─ pubspec.yaml
│  │        │  │  ├─ README.md
│  │        │  │  ├─ test
│  │        │  │  └─ windows
│  │        │  │     ├─ flutter
│  │        │  │     └─ runner
│  │        │  │        └─ resources
│  │        │  ├─ lib
│  │        │  │  └─ sqlite3_flutter_libs.dart
│  │        │  ├─ LICENSE
│  │        │  ├─ linux
│  │        │  │  ├─ CMakeLists.txt
│  │        │  │  ├─ include
│  │        │  │  │  └─ sqlite3_flutter_libs
│  │        │  │  │     └─ sqlite3_flutter_libs_plugin.h
│  │        │  │  ├─ sqlite3_flutter_libs_plugin.cc
│  │        │  │  └─ test
│  │        │  ├─ pubspec.yaml
│  │        │  ├─ README.md
│  │        │  ├─ test
│  │        │  └─ windows
│  │        │     ├─ CMakeLists.txt
│  │        │     ├─ include
│  │        │     │  └─ sqlite3_flutter_libs
│  │        │     │     └─ sqlite3_flutter_libs_plugin.h
│  │        │     ├─ sqlite3_flutter.c
│  │        │     ├─ sqlite3_flutter_libs_plugin.cpp
│  │        │     └─ test
│  │        └─ url_launcher_linux
│  │           ├─ AUTHORS
│  │           ├─ CHANGELOG.md
│  │           ├─ example
│  │           │  ├─ integration_test
│  │           │  │  └─ url_launcher_test.dart
│  │           │  ├─ lib
│  │           │  │  └─ main.dart
│  │           │  ├─ linux
│  │           │  │  ├─ CMakeLists.txt
│  │           │  │  ├─ flutter
│  │           │  │  │  └─ CMakeLists.txt
│  │           │  │  ├─ main.cc
│  │           │  │  ├─ my_application.cc
│  │           │  │  └─ my_application.h
│  │           │  ├─ pubspec.yaml
│  │           │  ├─ README.md
│  │           │  └─ test_driver
│  │           │     └─ integration_test.dart
│  │           ├─ lib
│  │           │  ├─ src
│  │           │  │  └─ messages.g.dart
│  │           │  └─ url_launcher_linux.dart
│  │           ├─ LICENSE
│  │           ├─ linux
│  │           │  ├─ CMakeLists.txt
│  │           │  ├─ include
│  │           │  │  └─ url_launcher_linux
│  │           │  │     └─ url_launcher_plugin.h
│  │           │  ├─ messages.g.cc
│  │           │  ├─ messages.g.h
│  │           │  ├─ test
│  │           │  │  └─ url_launcher_linux_test.cc
│  │           │  ├─ url_launcher_plugin.cc
│  │           │  └─ url_launcher_plugin_private.h
│  │           ├─ pigeons
│  │           │  ├─ copyright.txt
│  │           │  └─ messages.dart
│  │           ├─ pubspec.yaml
│  │           ├─ README.md
│  │           └─ test
│  │              └─ url_launcher_linux_test.dart
│  └─ runner
│     ├─ CMakeLists.txt
│     ├─ main.cc
│     ├─ my_application.cc
│     └─ my_application.h
├─ macos
│  ├─ Flutter
│  │  ├─ Flutter-Debug.xcconfig
│  │  └─ Flutter-Release.xcconfig
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  └─ AppIcon.appiconset
│  │  │     └─ Contents.json
│  │  ├─ Base.lproj
│  │  │  └─ MainMenu.xib
│  │  ├─ Configs
│  │  │  ├─ AppInfo.xcconfig
│  │  │  ├─ Debug.xcconfig
│  │  │  ├─ Release.xcconfig
│  │  │  └─ Warnings.xcconfig
│  │  ├─ DebugProfile.entitlements
│  │  ├─ Info.plist
│  │  ├─ MainFlutterWindow.swift
│  │  └─ Release.entitlements
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  └─ xcshareddata
│  │  │     └─ IDEWorkspaceChecks.plist
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  ├─ Runner.xcworkspace
│  │  ├─ contents.xcworkspacedata
│  │  └─ xcshareddata
│  │     └─ IDEWorkspaceChecks.plist
│  └─ RunnerTests
│     └─ RunnerTests.swift
├─ makefile
├─ pubspec.yaml
├─ README.md
├─ scripts
├─ SECURITY.md
├─ test
│  └─ features
│     └─ todo
│        ├─ applications
│        │  └─ todo_bloc_test.dart
│        ├─ data
│        │  └─ repositories
│        │     └─ todo_repository_impl_test.dart
│        ├─ domain
│        │  └─ entities
│        │     └─ todo_test.dart
│        └─ presentation
│           └─ widgets
│              └─ todo_tile_test.dart
├─ web
│  ├─ drift_worker.js
│  ├─ icons
│  ├─ index.html
│  ├─ manifest.json
│  └─ sqlite3.wasm
└─ windows
   ├─ CMakeLists.txt
   ├─ flutter
   │  ├─ CMakeLists.txt
   │  └─ ephemeral
   │     └─ .plugin_symlinks
   │        ├─ app_links
   │        │  ├─ analysis_options.yaml
   │        │  ├─ android
   │        │  │  ├─ build.gradle
   │        │  │  ├─ gradle
   │        │  │  │  └─ wrapper
   │        │  │  │     └─ gradle-wrapper.properties
   │        │  │  ├─ gradle.properties
   │        │  │  ├─ proguard.txt
   │        │  │  ├─ settings.gradle
   │        │  │  └─ src
   │        │  │     ├─ main
   │        │  │     │  ├─ AndroidManifest.xml
   │        │  │     │  ├─ java
   │        │  │     │  │  └─ com
   │        │  │     │  │     └─ llfbandit
   │        │  │     │  │        └─ app_links
   │        │  │     │  │           ├─ AppLinksHelper.java
   │        │  │     │  │           └─ AppLinksPlugin.java
   │        │  │     │  └─ kotlin
   │        │  │     │     └─ com
   │        │  │     │        └─ llfbandit
   │        │  │     │           └─ app_links
   │        │  │     └─ test
   │        │  │        └─ kotlin
   │        │  │           └─ com
   │        │  │              └─ llfbandit
   │        │  │                 └─ app_links
   │        │  ├─ CHANGELOG.md
   │        │  ├─ example
   │        │  │  ├─ analysis_options.yaml
   │        │  │  ├─ android
   │        │  │  │  ├─ app
   │        │  │  │  │  ├─ build.gradle
   │        │  │  │  │  └─ src
   │        │  │  │  │     ├─ debug
   │        │  │  │  │     │  └─ AndroidManifest.xml
   │        │  │  │  │     ├─ main
   │        │  │  │  │     │  ├─ AndroidManifest.xml
   │        │  │  │  │     │  ├─ java
   │        │  │  │  │     │  │  └─ io
   │        │  │  │  │     │  │     └─ flutter
   │        │  │  │  │     │  │        └─ plugins
   │        │  │  │  │     │  ├─ kotlin
   │        │  │  │  │     │  │  └─ com
   │        │  │  │  │     │  │     └─ example
   │        │  │  │  │     │  │        └─ example
   │        │  │  │  │     │  │           └─ MainActivity.kt
   │        │  │  │  │     │  └─ res
   │        │  │  │  │     │     ├─ drawable
   │        │  │  │  │     │     │  └─ launch_background.xml
   │        │  │  │  │     │     ├─ drawable-v21
   │        │  │  │  │     │     │  └─ launch_background.xml
   │        │  │  │  │     │     ├─ mipmap-hdpi
   │        │  │  │  │     │     ├─ mipmap-mdpi
   │        │  │  │  │     │     ├─ mipmap-xhdpi
   │        │  │  │  │     │     ├─ mipmap-xxhdpi
   │        │  │  │  │     │     ├─ mipmap-xxxhdpi
   │        │  │  │  │     │     ├─ values
   │        │  │  │  │     │     │  └─ styles.xml
   │        │  │  │  │     │     └─ values-night
   │        │  │  │  │     │        └─ styles.xml
   │        │  │  │  │     └─ profile
   │        │  │  │  │        └─ AndroidManifest.xml
   │        │  │  │  ├─ build.gradle
   │        │  │  │  ├─ gradle
   │        │  │  │  │  └─ wrapper
   │        │  │  │  │     └─ gradle-wrapper.properties
   │        │  │  │  ├─ gradle.properties
   │        │  │  │  └─ settings.gradle
   │        │  │  ├─ ios
   │        │  │  │  ├─ Flutter
   │        │  │  │  │  ├─ AppFrameworkInfo.plist
   │        │  │  │  │  ├─ Debug.xcconfig
   │        │  │  │  │  └─ Release.xcconfig
   │        │  │  │  ├─ Podfile
   │        │  │  │  ├─ Runner
   │        │  │  │  │  ├─ AppDelegate.swift
   │        │  │  │  │  ├─ Assets.xcassets
   │        │  │  │  │  │  ├─ AppIcon.appiconset
   │        │  │  │  │  │  │  └─ Contents.json
   │        │  │  │  │  │  └─ LaunchImage.imageset
   │        │  │  │  │  │     ├─ Contents.json
   │        │  │  │  │  │     └─ README.md
   │        │  │  │  │  ├─ Base.lproj
   │        │  │  │  │  │  ├─ LaunchScreen.storyboard
   │        │  │  │  │  │  └─ Main.storyboard
   │        │  │  │  │  ├─ Info.plist
   │        │  │  │  │  ├─ Runner-Bridging-Header.h
   │        │  │  │  │  └─ Runner.entitlements
   │        │  │  │  ├─ Runner.xcodeproj
   │        │  │  │  │  ├─ project.pbxproj
   │        │  │  │  │  ├─ project.xcworkspace
   │        │  │  │  │  │  ├─ contents.xcworkspacedata
   │        │  │  │  │  │  └─ xcshareddata
   │        │  │  │  │  │     ├─ IDEWorkspaceChecks.plist
   │        │  │  │  │  │     └─ WorkspaceSettings.xcsettings
   │        │  │  │  │  └─ xcshareddata
   │        │  │  │  │     └─ xcschemes
   │        │  │  │  │        └─ Runner.xcscheme
   │        │  │  │  ├─ Runner.xcworkspace
   │        │  │  │  │  ├─ contents.xcworkspacedata
   │        │  │  │  │  └─ xcshareddata
   │        │  │  │  │     ├─ IDEWorkspaceChecks.plist
   │        │  │  │  │     └─ WorkspaceSettings.xcsettings
   │        │  │  │  └─ RunnerTests
   │        │  │  ├─ lib
   │        │  │  │  ├─ main.dart
   │        │  │  │  └─ url_protocol
   │        │  │  │     ├─ api.dart
   │        │  │  │     ├─ protocol.dart
   │        │  │  │     ├─ web_url_protocol.dart
   │        │  │  │     └─ windows_protocol.dart
   │        │  │  ├─ linux
   │        │  │  │  ├─ CMakeLists.txt
   │        │  │  │  ├─ flutter
   │        │  │  │  │  └─ CMakeLists.txt
   │        │  │  │  ├─ main.cc
   │        │  │  │  ├─ my_application.cc
   │        │  │  │  └─ my_application.h
   │        │  │  ├─ macos
   │        │  │  │  ├─ Flutter
   │        │  │  │  │  ├─ Flutter-Debug.xcconfig
   │        │  │  │  │  └─ Flutter-Release.xcconfig
   │        │  │  │  ├─ Podfile
   │        │  │  │  ├─ Runner
   │        │  │  │  │  ├─ AppDelegate.swift
   │        │  │  │  │  ├─ Assets.xcassets
   │        │  │  │  │  │  └─ AppIcon.appiconset
   │        │  │  │  │  │     └─ Contents.json
   │        │  │  │  │  ├─ Base.lproj
   │        │  │  │  │  │  └─ MainMenu.xib
   │        │  │  │  │  ├─ Configs
   │        │  │  │  │  │  ├─ AppInfo.xcconfig
   │        │  │  │  │  │  ├─ Debug.xcconfig
   │        │  │  │  │  │  ├─ Release.xcconfig
   │        │  │  │  │  │  └─ Warnings.xcconfig
   │        │  │  │  │  ├─ DebugProfile.entitlements
   │        │  │  │  │  ├─ Info.plist
   │        │  │  │  │  ├─ MainFlutterWindow.swift
   │        │  │  │  │  └─ Release.entitlements
   │        │  │  │  ├─ Runner.xcodeproj
   │        │  │  │  │  ├─ project.pbxproj
   │        │  │  │  │  ├─ project.xcworkspace
   │        │  │  │  │  │  └─ xcshareddata
   │        │  │  │  │  │     └─ IDEWorkspaceChecks.plist
   │        │  │  │  │  └─ xcshareddata
   │        │  │  │  │     └─ xcschemes
   │        │  │  │  │        └─ Runner.xcscheme
   │        │  │  │  ├─ Runner.xcworkspace
   │        │  │  │  │  ├─ contents.xcworkspacedata
   │        │  │  │  │  └─ xcshareddata
   │        │  │  │  │     └─ IDEWorkspaceChecks.plist
   │        │  │  │  └─ RunnerTests
   │        │  │  ├─ pubspec.yaml
   │        │  │  ├─ README.md
   │        │  │  ├─ web
   │        │  │  │  ├─ icons
   │        │  │  │  ├─ index.html
   │        │  │  │  └─ manifest.json
   │        │  │  └─ windows
   │        │  │     ├─ CMakeLists.txt
   │        │  │     ├─ flutter
   │        │  │     │  └─ CMakeLists.txt
   │        │  │     └─ runner
   │        │  │        ├─ CMakeLists.txt
   │        │  │        ├─ flutter_window.cpp
   │        │  │        ├─ flutter_window.h
   │        │  │        ├─ main.cpp
   │        │  │        ├─ resource.h
   │        │  │        ├─ resources
   │        │  │        │  └─ app_icon.ico
   │        │  │        ├─ runner.exe.manifest
   │        │  │        ├─ Runner.rc
   │        │  │        ├─ utils.cpp
   │        │  │        ├─ utils.h
   │        │  │        ├─ win32_window.cpp
   │        │  │        └─ win32_window.h
   │        │  ├─ ios
   │        │  │  ├─ app_links
   │        │  │  │  ├─ Package.swift
   │        │  │  │  └─ Sources
   │        │  │  │     └─ app_links
   │        │  │  │        ├─ AppLinksIosPlugin.swift
   │        │  │  │        └─ PrivacyInfo.xcprivacy
   │        │  │  └─ app_links.podspec
   │        │  ├─ lib
   │        │  │  ├─ app_links.dart
   │        │  │  └─ src
   │        │  │     └─ app_links.dart
   │        │  ├─ LICENSE
   │        │  ├─ macos
   │        │  │  ├─ app_links
   │        │  │  │  ├─ Package.swift
   │        │  │  │  └─ Sources
   │        │  │  │     └─ app_links
   │        │  │  │        ├─ AppLinksMacosPlugin.swift
   │        │  │  │        └─ PrivacyInfo.xcprivacy
   │        │  │  └─ app_links.podspec
   │        │  ├─ pubspec.yaml
   │        │  ├─ README.md
   │        │  └─ windows
   │        │     ├─ app_links_plugin.cpp
   │        │     ├─ app_links_plugin.h
   │        │     ├─ app_links_plugin_c_api.cpp
   │        │     ├─ CMakeLists.txt
   │        │     ├─ include
   │        │     │  └─ app_links
   │        │     │     └─ app_links_plugin_c_api.h
   │        │     └─ test
   │        ├─ path_provider_windows
   │        │  ├─ AUTHORS
   │        │  ├─ CHANGELOG.md
   │        │  ├─ example
   │        │  │  ├─ integration_test
   │        │  │  │  └─ path_provider_test.dart
   │        │  │  ├─ lib
   │        │  │  │  └─ main.dart
   │        │  │  ├─ pubspec.yaml
   │        │  │  ├─ README.md
   │        │  │  ├─ test_driver
   │        │  │  │  └─ integration_test.dart
   │        │  │  └─ windows
   │        │  │     ├─ CMakeLists.txt
   │        │  │     ├─ flutter
   │        │  │     │  └─ CMakeLists.txt
   │        │  │     └─ runner
   │        │  │        ├─ CMakeLists.txt
   │        │  │        ├─ flutter_window.cpp
   │        │  │        ├─ flutter_window.h
   │        │  │        ├─ main.cpp
   │        │  │        ├─ resource.h
   │        │  │        ├─ resources
   │        │  │        │  └─ app_icon.ico
   │        │  │        ├─ runner.exe.manifest
   │        │  │        ├─ Runner.rc
   │        │  │        ├─ run_loop.cpp
   │        │  │        ├─ run_loop.h
   │        │  │        ├─ utils.cpp
   │        │  │        ├─ utils.h
   │        │  │        ├─ win32_window.cpp
   │        │  │        └─ win32_window.h
   │        │  ├─ lib
   │        │  │  ├─ path_provider_windows.dart
   │        │  │  └─ src
   │        │  │     ├─ folders.dart
   │        │  │     ├─ folders_stub.dart
   │        │  │     ├─ guid.dart
   │        │  │     ├─ path_provider_windows_real.dart
   │        │  │     ├─ path_provider_windows_stub.dart
   │        │  │     └─ win32_wrappers.dart
   │        │  ├─ LICENSE
   │        │  ├─ pubspec.yaml
   │        │  ├─ README.md
   │        │  └─ test
   │        │     ├─ guid_test.dart
   │        │     └─ path_provider_windows_test.dart
   │        ├─ shared_preferences_windows
   │        │  ├─ AUTHORS
   │        │  ├─ CHANGELOG.md
   │        │  ├─ example
   │        │  │  ├─ AUTHORS
   │        │  │  ├─ integration_test
   │        │  │  │  └─ shared_preferences_test.dart
   │        │  │  ├─ lib
   │        │  │  │  └─ main.dart
   │        │  │  ├─ LICENSE
   │        │  │  ├─ pubspec.yaml
   │        │  │  ├─ README.md
   │        │  │  ├─ test_driver
   │        │  │  │  └─ integration_test.dart
   │        │  │  └─ windows
   │        │  │     ├─ CMakeLists.txt
   │        │  │     ├─ flutter
   │        │  │     │  └─ CMakeLists.txt
   │        │  │     └─ runner
   │        │  │        ├─ CMakeLists.txt
   │        │  │        ├─ flutter_window.cpp
   │        │  │        ├─ flutter_window.h
   │        │  │        ├─ main.cpp
   │        │  │        ├─ resource.h
   │        │  │        ├─ resources
   │        │  │        │  └─ app_icon.ico
   │        │  │        ├─ runner.exe.manifest
   │        │  │        ├─ Runner.rc
   │        │  │        ├─ run_loop.cpp
   │        │  │        ├─ run_loop.h
   │        │  │        ├─ utils.cpp
   │        │  │        ├─ utils.h
   │        │  │        ├─ win32_window.cpp
   │        │  │        └─ win32_window.h
   │        │  ├─ lib
   │        │  │  └─ shared_preferences_windows.dart
   │        │  ├─ LICENSE
   │        │  ├─ pubspec.yaml
   │        │  ├─ README.md
   │        │  └─ test
   │        │     ├─ fake_path_provider_windows.dart
   │        │     ├─ legacy_shared_preferences_windows_test.dart
   │        │     └─ shared_preferences_windows_async_test.dart
   │        ├─ sqlite3_flutter_libs
   │        │  ├─ android
   │        │  │  ├─ build.gradle
   │        │  │  ├─ settings.gradle
   │        │  │  └─ src
   │        │  │     ├─ main
   │        │  │     │  ├─ AndroidManifest.xml
   │        │  │     │  ├─ java
   │        │  │     │  │  └─ eu
   │        │  │     │  │     └─ simonbinder
   │        │  │     │  │        └─ sqlite3_flutter_libs
   │        │  │     │  │           └─ Sqlite3FlutterLibsPlugin.java
   │        │  │     │  └─ kotlin
   │        │  │     │     └─ com
   │        │  │     │        └─ example
   │        │  │     │           └─ sqlite3_flutter_libs
   │        │  │     └─ test
   │        │  │        └─ kotlin
   │        │  │           └─ com
   │        │  │              └─ example
   │        │  │                 └─ sqlite3_flutter_libs
   │        │  ├─ CHANGELOG.md
   │        │  ├─ darwin
   │        │  │  ├─ sqlite3_flutter_libs
   │        │  │  │  ├─ Package.resolved
   │        │  │  │  ├─ Package.swift
   │        │  │  │  └─ Sources
   │        │  │  │     └─ sqlite3_flutter_libs
   │        │  │  │        └─ Sqlite3FlutterLibsPlugin.swift
   │        │  │  └─ sqlite3_flutter_libs.podspec
   │        │  ├─ example
   │        │  │  ├─ android
   │        │  │  │  ├─ app
   │        │  │  │  │  └─ src
   │        │  │  │  │     ├─ debug
   │        │  │  │  │     ├─ main
   │        │  │  │  │     │  ├─ kotlin
   │        │  │  │  │     │  │  └─ com
   │        │  │  │  │     │  │     └─ example
   │        │  │  │  │     │  │        └─ sqlite3_flutter_libs_example
   │        │  │  │  │     │  └─ res
   │        │  │  │  │     │     ├─ drawable
   │        │  │  │  │     │     ├─ drawable-v21
   │        │  │  │  │     │     ├─ mipmap-hdpi
   │        │  │  │  │     │     ├─ mipmap-mdpi
   │        │  │  │  │     │     ├─ mipmap-xhdpi
   │        │  │  │  │     │     ├─ mipmap-xxhdpi
   │        │  │  │  │     │     ├─ mipmap-xxxhdpi
   │        │  │  │  │     │     ├─ values
   │        │  │  │  │     │     └─ values-night
   │        │  │  │  │     └─ profile
   │        │  │  │  └─ gradle
   │        │  │  │     └─ wrapper
   │        │  │  │        └─ gradle-wrapper.properties
   │        │  │  ├─ integration_test
   │        │  │  ├─ ios
   │        │  │  │  ├─ Flutter
   │        │  │  │  ├─ Runner
   │        │  │  │  │  ├─ Assets.xcassets
   │        │  │  │  │  │  ├─ AppIcon.appiconset
   │        │  │  │  │  │  └─ LaunchImage.imageset
   │        │  │  │  │  └─ Base.lproj
   │        │  │  │  ├─ Runner.xcodeproj
   │        │  │  │  │  ├─ project.xcworkspace
   │        │  │  │  │  │  └─ xcshareddata
   │        │  │  │  │  └─ xcshareddata
   │        │  │  │  │     └─ xcschemes
   │        │  │  │  ├─ Runner.xcworkspace
   │        │  │  │  │  └─ xcshareddata
   │        │  │  │  └─ RunnerTests
   │        │  │  ├─ lib
   │        │  │  ├─ linux
   │        │  │  │  ├─ flutter
   │        │  │  │  └─ runner
   │        │  │  ├─ macos
   │        │  │  │  ├─ Flutter
   │        │  │  │  ├─ Runner
   │        │  │  │  │  ├─ Assets.xcassets
   │        │  │  │  │  │  └─ AppIcon.appiconset
   │        │  │  │  │  ├─ Base.lproj
   │        │  │  │  │  └─ Configs
   │        │  │  │  ├─ Runner.xcodeproj
   │        │  │  │  │  ├─ project.xcworkspace
   │        │  │  │  │  │  └─ xcshareddata
   │        │  │  │  │  └─ xcshareddata
   │        │  │  │  │     └─ xcschemes
   │        │  │  │  ├─ Runner.xcworkspace
   │        │  │  │  │  └─ xcshareddata
   │        │  │  │  └─ RunnerTests
   │        │  │  ├─ pubspec.yaml
   │        │  │  ├─ README.md
   │        │  │  ├─ test
   │        │  │  └─ windows
   │        │  │     ├─ flutter
   │        │  │     └─ runner
   │        │  │        └─ resources
   │        │  ├─ lib
   │        │  │  └─ sqlite3_flutter_libs.dart
   │        │  ├─ LICENSE
   │        │  ├─ linux
   │        │  │  ├─ CMakeLists.txt
   │        │  │  ├─ include
   │        │  │  │  └─ sqlite3_flutter_libs
   │        │  │  │     └─ sqlite3_flutter_libs_plugin.h
   │        │  │  ├─ sqlite3_flutter_libs_plugin.cc
   │        │  │  └─ test
   │        │  ├─ pubspec.yaml
   │        │  ├─ README.md
   │        │  ├─ test
   │        │  └─ windows
   │        │     ├─ CMakeLists.txt
   │        │     ├─ include
   │        │     │  └─ sqlite3_flutter_libs
   │        │     │     └─ sqlite3_flutter_libs_plugin.h
   │        │     ├─ sqlite3_flutter.c
   │        │     ├─ sqlite3_flutter_libs_plugin.cpp
   │        │     └─ test
   │        └─ url_launcher_windows
   │           ├─ AUTHORS
   │           ├─ CHANGELOG.md
   │           ├─ example
   │           │  ├─ integration_test
   │           │  │  └─ url_launcher_test.dart
   │           │  ├─ lib
   │           │  │  └─ main.dart
   │           │  ├─ pubspec.yaml
   │           │  ├─ README.md
   │           │  ├─ test_driver
   │           │  │  └─ integration_test.dart
   │           │  └─ windows
   │           │     ├─ CMakeLists.txt
   │           │     ├─ flutter
   │           │     │  └─ CMakeLists.txt
   │           │     └─ runner
   │           │        ├─ CMakeLists.txt
   │           │        ├─ flutter_window.cpp
   │           │        ├─ flutter_window.h
   │           │        ├─ main.cpp
   │           │        ├─ resource.h
   │           │        ├─ resources
   │           │        │  └─ app_icon.ico
   │           │        ├─ runner.exe.manifest
   │           │        ├─ Runner.rc
   │           │        ├─ run_loop.cpp
   │           │        ├─ run_loop.h
   │           │        ├─ utils.cpp
   │           │        ├─ utils.h
   │           │        ├─ win32_window.cpp
   │           │        └─ win32_window.h
   │           ├─ lib
   │           │  ├─ src
   │           │  │  └─ messages.g.dart
   │           │  └─ url_launcher_windows.dart
   │           ├─ LICENSE
   │           ├─ pigeons
   │           │  ├─ copyright.txt
   │           │  └─ messages.dart
   │           ├─ pubspec.yaml
   │           ├─ README.md
   │           ├─ test
   │           │  └─ url_launcher_windows_test.dart
   │           └─ windows
   │              ├─ CMakeLists.txt
   │              ├─ include
   │              │  └─ url_launcher_windows
   │              │     └─ url_launcher_windows.h
   │              ├─ messages.g.cpp
   │              ├─ messages.g.h
   │              ├─ system_apis.cpp
   │              ├─ system_apis.h
   │              ├─ test
   │              │  └─ url_launcher_windows_test.cpp
   │              ├─ url_launcher_plugin.cpp
   │              ├─ url_launcher_plugin.h
   │              └─ url_launcher_windows.cpp
   └─ runner
      ├─ CMakeLists.txt
      ├─ flutter_window.cpp
      ├─ flutter_window.h
      ├─ main.cpp
      ├─ resource.h
      ├─ resources
      │  └─ app_icon.ico
      ├─ runner.exe.manifest
      ├─ Runner.rc
      ├─ utils.cpp
      ├─ utils.h
      ├─ win32_window.cpp
      └─ win32_window.h

```