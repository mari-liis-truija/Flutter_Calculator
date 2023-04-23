# Firestore support

**Task 6:**
Please add Firestore (instead of sharedPreferences with same functionality) to your app. It should record history in the cloud.

If you can manage to limit read/write access to only the author of the record, you can get additional 5 points.

To sum up:

Adding Firestore - 7 points

Managing security rules - 5 points

## Done steps

1. Create new Firebase Project (FlutterCalculatorEEK2023)
2. Install Firebase CLI + NodeJS
   1. Download Node.js 
   2. run cmd "npm install -g firebase tools
3. Login to firebase, cmd "firebase login"
4. Activate FlutterFire_CLI
   1. dart pub global activate flutterfire_cli
   2. flutterfire configure --fluttercalculatoreek2023
5. Connect project with firebase