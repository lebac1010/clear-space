# ProGuard / R8 Rules for Clear Space
# [E5] Prevent R8 from obfuscating classes used with Gson reflection

# Keep model classes used with Gson serialization
-keep class com.lebac.storage_dashboard.clear_space.models.** { *; }

# Keep Gson itself
-keep class com.google.gson.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn com.google.gson.**

# Keep WorkManager worker classes
-keep class com.lebac.storage_dashboard.clear_space.workers.** { *; }
-keep class com.lebac.storage_dashboard.clear_space.StorageScanWorker { *; }
-keep class com.lebac.storage_dashboard.clear_space.StorageCacheManager { *; }

# Keep Flutter plugin entry point
-keep class com.lebac.storage_dashboard.clear_space.StorageScannerPlugin { *; }
