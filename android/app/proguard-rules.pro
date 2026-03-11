# ProGuard / R8 Rules for Clear Space
# [E5] Prevent R8 from obfuscating classes used with Gson reflection

# Keep model classes used with Gson serialization
-keep class com.movixalabs.cleanmaster.models.** { *; }

# Keep Gson itself
-keep class com.google.gson.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn com.google.gson.**

# Keep WorkManager worker classes
-keep class com.movixalabs.cleanmaster.workers.** { *; }
-keep class com.movixalabs.cleanmaster.StorageScanWorker { *; }
-keep class com.movixalabs.cleanmaster.StorageCacheManager { *; }

# Keep Flutter plugin entry point
-keep class com.movixalabs.cleanmaster.StorageScannerPlugin { *; }
