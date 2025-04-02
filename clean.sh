rm -rf build && rm -rf builds
flutter clean
cd android
gradle clean
cd -
flutter pub get && flutter pub run build_runner clean lib
