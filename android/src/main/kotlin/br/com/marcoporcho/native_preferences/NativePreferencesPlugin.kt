package br.com.marcoporcho.native_preferences

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class NativePreferencesPlugin(val context: Context): MethodCallHandler {


  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "native_preferences")
      channel.setMethodCallHandler(NativePreferencesPlugin(registrar.context()))
    }
  }



  override fun onMethodCall(call: MethodCall, result: Result) {
    val preferenceName = call.argument<String>("preferenceName")
    val key = call.argument<String>("key")

    val prefs = context.getSharedPreferences(preferenceName, Context.MODE_PRIVATE)

    if(!prefs.contains(key)){
      result.error("404", "Key not found", null)
      return
    }

    when(call.method){
      "getString" -> {
        val value = prefs.getString(key, "").orEmpty()
        result.success(value)
      }
      "getBool" -> {
        val value = prefs.getBoolean(key, false)
        result.success(value)
      }
      "getInt" -> {
        val value = prefs.getInt(key, 0)
        result.success(value)
      }
      "getDouble" -> {
        val value = prefs.getFloat(key, 0f)
        result.success(value)
      }
      "androidTest" -> {
        var editor = prefs.edit()
        editor.putString("string_android_pref", "android_string")
        editor.putBoolean("bool_android_pref", true)
        editor.putInt("int_android_pref", 1)
        editor.putFloat("double_android_pref", 1f)
        editor.commit()
      }
      else -> result.notImplemented()
    }
  }
}
