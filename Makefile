build:
	dart run build_runner build --delete-conflicting-outputs;
watch:
	dart run build_runner watch --delete-conflicting-outputs;
pre_android_build:
	dart build appbundle --flavor prod -t lib/main_prod.dart --dart-define-from-file=config_prod.json --flavor=prod;
.PHONY: gen clean prebuild build watch localization