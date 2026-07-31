# Pusher (pusher_channels_flutter, F3a): su SDK Android usa slf4j solo como
# API, sin binding en runtime. R8 falla con "Missing class
# org.slf4j.impl.StaticLoggerBinder" al minificar — estas reglas le dicen
# que ese logger opcional puede faltar sin problema.
-dontwarn org.slf4j.impl.StaticLoggerBinder
-dontwarn org.slf4j.**

# OkHttp rules for ucrop library
-dontwarn okhttp3.Call
-dontwarn okhttp3.Dispatcher
-dontwarn okhttp3.OkHttpClient
-dontwarn okhttp3.Request$Builder
-dontwarn okhttp3.Request
-dontwarn okhttp3.Response
-dontwarn okhttp3.ResponseBody
