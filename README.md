# app_lock

A Flutter package for showing a lock screen when an app is opened or paused.

If a user is launching the app or opening the app for the first time, a lock screen is shown.

If a user returns to the app after it has been launched, a lock screen is shown if the time the app spent in the background exceeds the lock duration.

## Getting Started

In your flutter project add the dependency:

```yaml
dependencies:
  ...
  app_lock:
    git:
      url: https://github.com/lexican/app_lock.git
      ref: main 
```

For help getting started with Flutter, view the online documentation.

## Usage example

```dart
void main() {
  runApp(AppLock(
    builder: (args) => MyApp(),
    lockScreen: LockScreen(),
  ));
}
```

Wrap the 'MyApp' (or similar widget) initialization in a function and pass it to the 'builder' property of a 'AppLock' widget.

'LockScreen' is your own widget that implements your own authentication logic (passcode, password or biometrics) and should call the following after a successful authentication.

```dart
AppLock.of(context)!.didUnlock();
```
If it's an app launch, this will instantiate your 'MyApp' (or similar widget) or simply return to the current running instance of your app if it's resuming.

```

## Enabling and disabling

It is possible to enable and disable the `lockScreen` on app launch and on-demand.

The `lockScreen` can be enabled or disabled at any time (on app launch or on-demand).

```dart
runApp(AppLock(
  builder: (args) => MyApp(),
  lockScreen: LockScreen(),
  enabled: false,
));
```

The above will cause `MyApp` to be built instantly and `lockScreen` will never be shown. The default for `enabled` is `true`.

You can then enable `lockScreen` later on by doing:

```dart
AppLock.of(context)!.enable();
```

This will now display the 'lockScreen' when the app is paused.

To disable the `lockScreen` again you can simply do:

```dart
AppLock.of(context)!.disable();
```

There is also a convenience method:

```dart
AppLock.of(context)!.setEnabled(true);
AppLock.of(context)!.setEnabled(false);
```

## Manually showing the lock screen

In some cases, you may want to manually activate the lock screen.

This can be done by calling:

```dart
AppLock.of(context)!.showLockScreen();
```

If you want to wait till the user successfully unlocks the screen again, 'showLockScreen' can returns a 'Future', allowing you to 'await' this method call.


```dart
await AppLock.of(context)!.showLockScreen();
```


## Lock duration

It may be advantageous for apps not to require the lock screen to be displayed immediately after entering the background mode. You may now choose how long the app can run in the background before the lock screen is displayed:

```dart
void main() {
  runApp(AppLock(
    ...,
    lockDurationSeconds: 60,
  ));
}
```

## Passing arguments

In some cases, you might want to pass data or objects from the 'lockScreen' into your `MyApp` or similar widget.

This can be done by passing in an argument to the `didUnlock` method on `AppLock`:

```dart
var user = User(id: 0, username: "jon_doe");

AppLock.of(context)!.didUnlock(user);
```

This object is then available as part of the `AppLock` builder method, `builder`:

```dart
...
runApp(AppLock(
  builder: (args) => MyApp(user: args), // args is the `database` object passed in to `didUnlock`
  lockScreen: LockScreen(),
));
```

The example code above allows the app to be in the background for up to 60 seconds without displaying the `lockScreen`.
