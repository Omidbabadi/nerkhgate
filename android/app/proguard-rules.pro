# --- Adivery ---
-keep class com.adivery.** { *; }

# --- فقط AdMob + Unity فعال می‌مانند ---
# --- بقیه شبکه‌ها نادیده گرفته می‌شوند ---
-dontwarn com.adivery.sdk.networks.chartboost.**
-dontwarn com.adivery.sdk.networks.ironsource.**
-dontwarn com.adivery.sdk.networks.startio.**
-dontwarn com.adivery.sdk.networks.mbridge.**

-dontwarn com.chartboost.**
-dontwarn com.ironsource.**
-dontwarn com.startapp.**
-dontwarn com.mbridge.**
-dontwarn com.huawei.hms.ads.identifier.**
