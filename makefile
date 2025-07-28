FLUTTER := flutter
DART := dart
PUB := pub

CHANNELS := stable beta dev master

.PHONY: help
help:
	@echo "Flutter Development Commands:"
	@echo ""
	@echo "=== Setup and Dependencies ==="
	@echo "  setup               - Install dependencies and run flutter doctor"
	@echo "  pub-get             - Get dependencies"
	@echo "  pub-upgrade         - Upgrade dependencies"
	@echo "  pub-outdated        - Show outdated dependencies"
	@echo "  pub-audit           - Audit dependencies for security issues"
	@echo "  pubspec-check       - Check pubspec.yaml for issues"
	@echo ""
	@echo "=== Flutter Doctor and Channels ==="
	@echo "  doctor              - Run flutter doctor"
	@echo "  doctor-verbose      - Run flutter doctor with verbose output"
	@echo "  channel             - Show current flutter channel"
	@echo "  channel-stable      - Switch to stable channel"
	@echo "  channel-beta        - Switch to beta channel"
	@echo "  channel-dev         - Switch to dev channel"
	@echo "  channel-master      - Switch to master channel"
	@echo "  upgrade             - Upgrade flutter"
	@echo "  precache            - Pre-download required artifacts"
	@echo ""
	@echo "=== Code Quality ==="
	@echo "  analyze             - Run dart analyzer with fatal infos"
	@echo "  analyze-quiet       - Run dart analyzer quietly"
	@echo "  format              - Format all Dart files"
	@echo "  format-check        - Check Dart formatting without changes"
	@echo "  format-line-length  - Format with custom line length (default 80)"
	@echo "  fix                 - Apply automated fixes"
	@echo "  pubspec-checker     - Run pubspec checker"
	@echo ""
	@echo "=== Code Generation ==="
	@echo "  build-runner        - Run build_runner build"
	@echo "  build-runner-watch  - Run build_runner in watch mode"
	@echo "  build-runner-clean  - Clean build_runner outputs"
	@echo "  build-runner-build  - Build with build_runner and delete conflicts"
	@echo ""
	@echo "=== Testing ==="
	@echo "  test                - Run all tests with coverage"
	@echo "  test-unit           - Run unit tests"
	@echo "  test-widget         - Run widget tests"
	@echo "  test-integration    - Run integration tests"
	@echo "  test-coverage       - Generate test coverage report"
	@echo "  test-report         - Generate HTML coverage report"
	@echo "  test-watch          - Run tests in watch mode"
	@echo ""
	@echo "=== Device Management ==="
	@echo "  devices             - Show connected devices"
	@echo "  emulators           - List available emulators"
	@echo "  emulator-create     - Create new Android emulator"
	@echo "  emulator-run        - Run Android emulator"
	@echo ""
	@echo "=== Running Applications ==="
	@echo "  run                 - Run the app in debug mode"
	@echo "  run-debug           - Run the app in debug mode"
	@echo "  run-profile         - Run the app in profile mode"
	@echo "  run-release         - Run the app in release mode"
	@echo "  run-web             - Run on web"
	@echo "  run-chrome          - Run on Chrome"
	@echo "  run-firefox         - Run on Firefox"
	@echo "  run-ios             - Run on iOS simulator"
	@echo "  run-android         - Run on Android emulator"
	@echo "  run-device          - Run on specific device"
	@echo ""
	@echo "=== Build and Release ==="
	@echo "  build-apk           - Build Android APK"
	@echo "  build-appbundle     - Build Android App Bundle"
	@echo "  build-ios           - Build iOS"
	@echo "  build-web           - Build web"
	@echo "  build-desktop       - Build for desktop (if enabled)"
	@echo "  build-analyze       - Analyze app size"
	@echo ""
	@echo "=== Cleaning and Maintenance ==="
	@echo "  clean               - Clean build artifacts"
	@echo "  clean-pub           - Clean pub cache for this project"
	@echo "  clean-all           - Clean everything including pub cache"
	@echo "  repair              - Repair Flutter installation"
	@echo "  cache-clean         - Clean Flutter cache"
	@echo "  cache-repair        - Repair Flutter cache"
	@echo ""
	@echo "=== Package Management ==="
	@echo "  pub-global-list     - List globally activated packages"
	@echo "  pub-global-activate - Activate package globally"
	@echo "  pub-global-deactivate - Deactivate package globally"
	@echo ""
	@echo "=== Project Information ==="
	@echo "  config              - Show Flutter config"
	@echo "  version             - Show Flutter version"
	@echo "  logs                - Show Flutter logs"
	@echo ""
	@echo "=== Compound Commands ==="
	@echo "  all                 - Run setup, analyze, format, and test"
	@echo "  ci-check            - Run all CI checks (analyze, format, test)"

# === Setup and Dependencies ===

.PHONY: setup
setup: pub-get doctor

.PHONY: pub-get
pub-get:
	$(FLUTTER) pub get

.PHONY: pub-upgrade
pub-upgrade:
	$(FLUTTER) pub upgrade

.PHONY: pub-outdated
pub-outdated:
	$(FLUTTER) pub outdated

.PHONY: pub-audit
pub-audit:
	$(DART) pub audit

.PHONY: pubspec-check
pubspec-check:
	@echo "Checking pubspec.yaml..."
	@if [ -f pubspec.yaml ]; then \
		echo "✓ pubspec.yaml exists"; \
		grep "name:" pubspec.yaml > /dev/null && echo "✓ name field present" || echo "✗ name field missing"; \
		grep "version:" pubspec.yaml > /dev/null && echo "✓ version field present" || echo "✗ version field missing"; \
		grep "description:" pubspec.yaml > /dev/null && echo "✓ description field present" || echo "✗ description field missing"; \
	else \
		echo "✗ pubspec.yaml not found"; \
	fi

# === Flutter Doctor and Channels ===

.PHONY: doctor
doctor:
	$(FLUTTER) doctor

.PHONY: doctor-verbose
doctor-verbose:
	$(FLUTTER) doctor -v

.PHONY: channel
channel:
	$(FLUTTER) channel

.PHONY: channel-stable
channel-stable:
	$(FLUTTER) channel stable

.PHONY: channel-beta
channel-beta:
	$(FLUTTER) channel beta

.PHONY: channel-dev
channel-dev:
	$(FLUTTER) channel dev

.PHONY: channel-master
channel-master:
	$(FLUTTER) channel master

.PHONY: upgrade
upgrade:
	$(FLUTTER) upgrade

.PHONY: precache
precache:
	$(FLUTTER) precache

# === Code Quality ===

.PHONY: analyze
analyze:
	$(DART) analyze --fatal-infos

.PHONY: analyze-quiet
analyze-quiet:
	$(DART) analyze --fatal-infos --format machine

.PHONY: format
format:
	$(DART) format .

.PHONY: format-check
format-check:
	$(DART) format --output=none --set-exit-if-changed .

.PHONY: format-line-length
format-line-length:
	$(DART) format --line-length=$(LINE_LENGTH) .

.PHONY: fix
fix:
	$(DART) fix --apply

.PHONY: pubspec-checker
pubspec-checker:
	@echo "Checking pubspec with pubspec_checker..."
	@if command -v pubspec_checker >/dev/null 2>&1; then \
		$(DART) run pubspec_checker -s -l; \
	else \
		echo "pubspec_checker not found. Install with: dart pub global activate pubspec_checker"; \
	fi

# === Code Generation ===

.PHONY: build-runner
build-runner:
	$(DART) run build_runner build --delete-conflicting-outputs

.PHONY: build-runner-watch
build-runner-watch:
	$(DART) run build_runner watch --delete-conflicting-outputs

.PHONY: build-runner-clean
build-runner-clean:
	$(DART) run build_runner clean

.PHONY: build-runner-build
build-runner-build:
	$(DART) run build_runner build --delete-conflicting-outputs

# === Testing ===

.PHONY: test
test: test-unit test-widget

.PHONY: test-unit
test-unit:
	$(FLUTTER) test --coverage

.PHONY: test-widget
test-widget:
	$(FLUTTER) test test/widget_test.dart

.PHONY: test-integration
test-integration:
	$(FLUTTER) test integration_test

.PHONY: test-coverage
test-coverage:
	$(FLUTTER) test --coverage
	@echo "Coverage report available in coverage/lcov.info"

.PHONY: test-report
test-report: test-coverage
	@if command -v genhtml >/dev/null 2>&1; then \
		genhtml coverage/lcov.info -o coverage/html; \
		echo "HTML coverage report generated in coverage/html"; \
	else \
		echo "genhtml not found. Install lcov package to generate HTML reports"; \
	fi

.PHONY: test-watch
test-watch:
	@echo "Running tests in watch mode..."
	@if command -v fswatch >/dev/null 2>&1; then \
		echo "Watching for file changes..."; \
		fswatch -o lib test | xargs -n1 -I{} $(FLUTTER) test; \
	else \
		echo "fswatch not found. Install fswatch for file watching"; \
	fi

# === Device Management ===

.PHONY: devices
devices:
	$(FLUTTER) devices

.PHONY: emulators
emulators:
	$(FLUTTER) emulators

.PHONY: emulator-create
emulator-create:
	@echo "Available Android targets:"
	@sdkmanager --list | grep system-images
	@echo "Create emulator with: sdkmanager \"system-images;android-30;google_apis;x86_64\""
	@echo "Then: avdmanager create avd -n <name> -k \"system-images;android-30;google_apis;x86_64\""

.PHONY: emulator-run
emulator-run:
	@if [ -n "$(EMULATOR_NAME)" ]; then \
		emulator -avd $(EMULATOR_NAME); \
	else \
		echo "Please specify EMULATOR_NAME variable"; \
		echo "Usage: make emulator-run EMULATOR_NAME=<name>"; \
		echo "Available emulators:"; \
		$(FLUTTER) emulators; \
	fi

# === Running Applications ===

.PHONY: run
run: run-debug

.PHONY: run-debug
run-debug:
	$(FLUTTER) run --debug

.PHONY: run-profile
run-profile:
	$(FLUTTER) run --profile

.PHONY: run-release
run-release:
	$(FLUTTER) run --release

.PHONY: run-web
run-web:
	$(FLUTTER) run -d web

.PHONY: run-chrome
run-chrome:
	$(FLUTTER) run -d chrome

.PHONY: run-firefox
run-firefox:
	$(FLUTTER) run -d firefox

.PHONY: run-ios
run-ios:
	$(FLUTTER) run -d ios

.PHONY: run-android
run-android:
	$(FLUTTER) run -d android

.PHONY: run-device
run-device:
	@if [ -n "$(DEVICE_ID)" ]; then \
		$(FLUTTER) run -d $(DEVICE_ID); \
	else \
		echo "Please specify DEVICE_ID variable"; \
		echo "Usage: make run-device DEVICE_ID=<device-id>"; \
		echo "Available devices:"; \
		$(FLUTTER) devices; \
	fi

# === Build and Release ===

.PHONY: build-apk
build-apk:
	$(FLUTTER) build apk --release

.PHONY: build-appbundle
build-appbundle:
	$(FLUTTER) build appbundle --release

.PHONY: build-ios
build-ios:
	$(FLUTTER) build ios --release

.PHONY: build-web
build-web:
	$(FLUTTER) build web --release

.PHONY: build-desktop
build-desktop:
	$(FLUTTER) build linux
	$(FLUTTER) build windows
	$(FLUTTER) build macos

.PHONY: build-analyze
build-analyze:
	$(FLUTTER) build analyze

# === Cleaning and Maintenance ===

.PHONY: clean
clean:
	$(FLUTTER) clean

.PHONY: clean-pub
clean-pub:
	$(FLUTTER) pub cache repair

.PHONY: clean-all
clean-all: clean clean-pub
	$(FLUTTER) pub cache clean -f

.PHONY: repair
repair:
	$(FLUTTER) doctor --android-licenses
	$(FLUTTER) pub cache repair

.PHONY: cache-clean
cache-clean:
	$(FLUTTER) pub cache clean -f

.PHONY: cache-repair
cache-repair:
	$(FLUTTER) pub cache repair

# === Package Management ===

.PHONY: pub-global-list
pub-global-list:
	$(DART) pub global list

.PHONY: pub-global-activate
pub-global-activate:
	@if [ -n "$(PACKAGE)" ]; then \
		$(DART) pub global activate $(PACKAGE); \
	else \
		echo "Please specify PACKAGE variable"; \
		echo "Usage: make pub-global-activate PACKAGE=<package-name>"; \
	fi

.PHONY: pub-global-deactivate
pub-global-deactivate:
	@if [ -n "$(PACKAGE)" ]; then \
		$(DART) pub global deactivate $(PACKAGE); \
	else \
		echo "Please specify PACKAGE variable"; \
		echo "Usage: make pub-global-deactivate PACKAGE=<package-name>"; \
	fi

# === Project Information ===

.PHONY: config
config:
	$(FLUTTER) config

.PHONY: version
version:
	$(FLUTTER) --version

.PHONY: logs
logs:
	$(FLUTTER) logs

# === Compound Commands ===

.PHONY: all
all: setup analyze format test

.PHONY: ci-check
ci-check: analyze-quiet format-check test-unit