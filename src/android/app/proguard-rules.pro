## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.plugin.webviewflutter.** { *; }
-dontwarn io.flutter.embedding.**
-dontwarn android.**
-dontwarn androidx.**

## Gson rules
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }

## RevenueCat Rules
-keep class com.revenuecat.purchases.** { *; }
-keep class com.android.vending.billing.** { *; }

## Play Core
-keep class com.google.android.play.core.** { *; }
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class * extends com.google.android.play.core.splitcompat.SplitCompatApplication { *; }
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication