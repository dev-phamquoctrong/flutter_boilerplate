# Flutter boilerplate project

## What does the project use?

1. Architectural pattern/ Design
   philosophy: [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) without `Domain` layer.
2. State management: [flutter_riverpod](https://pub.dev/packages/riverpod).
3. To generate assets files, include: images, fonts,
   colors...: [flutter_gen](https://pub.dev/packages/flutter_gen).
4. Routing: [go_router](https://pub.dev/packages/go_router).
5. Interact APIs: [dio](https://pub.dev/packages/dio).
6. Error handling: Use `Either` class on [fpdart](https://pub.dev/packages/fpdart).
7. Generation code tool: [build_runner](https://pub.dev/packages/build_runner).
8. Local storage: [shared_preferences](https://pub.dev/packages/shared_preferences).

## Environment

This project is running on flutter version `3.24.2`.

## Flavor configuration

#### Android Studio

1. [Open the Run/Debug Configurations dialog.](https://developer.android.com/studio/run/rundebugconfig?hl=en#opening).
2. Type a flavor in **Build flavor** field. For example, type the text `dev` into the field.
3. Click **OK** or **Apply**.

#### Visual Studio Code

1. Open **Run and debug** tab.
2. Choose flavor that you want to running, `Run on dev` or `Run on prod` flavor.

   > **NOTE**: You can edit the configuration in `/.vscode/launch.json`.

## Generate code and files before running project

1. Single terminal command:
   - Get package dependencies:

       ```
       flutter pub get
       ```

   - Generate localization files:

       ```
       flutter gen-l10n
       ```

   - Generate native splash:

       ```
       dart run flutter_native_splash:create --flavors [YOUR_FLAVOR]
       ```

   - Generate necessary files (assets, generation class...):
      - To delete conflicting classes and re-generate, run:

         ```
         dart run build_runner build -d
         ```

      - To generate without delete conflicting outputs, run:

         ```
         dart run build_runner build
         ```

2. All-in-one terminal command for getting dependencies, generating files, and more:

   - Syntax:
     ```
     sh make.sh --flavor=[YOUR_FLAVOR] -f -r
     ```
     Parameters:
      - `--flavor=[YOUR_FLAVOR]` (**Required**): Run the terminal with a specific flavor, e.g., `--flavor=dev`.
      - `-f` (**Optional**): Run with `FVM`.
      - `-r` (**Optional**): Run the app after generating files.
      - `-c` (**Optional**): Delete the `build/` and `.dart_tool/` directories.

   - Example:
       ```
       sh make.sh --flavor=dev -f -r
       ```
3. (Optional)
   - To update all dependencies in pubspec.yaml file to latest version, run:
     ```
     flutter pub upgrade --major-versions --tighten
     ```

## How to run?

**Two ways to run the project:**

1. Click on `Run` or `Debug` in the IDE.
2. Terminal command:

    ```
    flutter run --flavor=dev
    ```

   or use the all-in-one terminal command with the `-r` flag: `sh make.sh -r`

   ###### Change `--flavor=dev` to `--flavor=prod` if you want to run in the production environment.
---
