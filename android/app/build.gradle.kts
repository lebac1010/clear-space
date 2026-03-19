import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// ── Load signing config from key.properties (if it exists) ──────────────────
val keyPropertiesFile = rootProject.file("../android/key.properties")
val keyProperties = Properties()
if (keyPropertiesFile.exists()) {
    keyProperties.load(FileInputStream(keyPropertiesFile))
}

android {
    namespace = "com.movixalabs.cleanmaster"
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    signingConfigs {
        create("release") {
            val sf = keyProperties["storeFile"] as String?
            if (!sf.isNullOrBlank()) {
                storeFile = file(sf)
            }
            storePassword = keyProperties["storePassword"] as String? ?: ""
            keyAlias     = keyProperties["keyAlias"]      as String? ?: ""
            keyPassword  = keyProperties["keyPassword"]   as String? ?: ""
        }
    }

    defaultConfig {
        applicationId = "com.movixalabs.cleanmaster"
        // Safer rollout: build against Android 16 APIs without opting into all Android 16 target behaviors yet.
        minSdk = 24
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        debug {
            manifestPlaceholders["admobAppId"] =
                "ca-app-pub-3940256099942544~3347511713"
        }
        release {
            manifestPlaceholders["admobAppId"] =
                (project.findProperty("ADMOB_APP_ID") as String?) ?: ""
            // [P7] Enable R8 code shrinking + link ProGuard rules for Gson safety
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            // Use release signing if key.properties exists, fall back to debug otherwise
            signingConfig = if (keyPropertiesFile.exists())
                signingConfigs.getByName("release")
            else
                signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
    implementation("com.google.code.gson:gson:2.10.1")
    implementation("androidx.work:work-runtime-ktx:2.8.1")
    implementation("androidx.concurrent:concurrent-futures-ktx:1.2.0")
    implementation("androidx.core:core-splashscreen:1.0.1")
}



