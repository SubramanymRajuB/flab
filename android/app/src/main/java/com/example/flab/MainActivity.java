package com.example.flab;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Build;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String MSG_CHANNEL = "flutter.native/simple_msg";
    private static final String LAUNCH_CHANNEL = "flutter.native/launchURL";
    private static final String BATTERY_CHANNEL = "flutter.native/battery";
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),MSG_CHANNEL)
                .setMethodCallHandler(
                        ((call, result) -> {
                            if(call.method.equals("simpleMsgFromNative")){
                                result.success(helloFromNativeCode());
                            }
                            else {
                                result.notImplemented();
                            }
                        })
                );

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),LAUNCH_CHANNEL)
                .setMethodCallHandler(
                        ((call, result) -> {
                            if(call.method.equals("launchBrowser")){
                                openWebBrowser("https://flutter.io");
                            }
                            else {
                                result.notImplemented();
                            }
                        })
                );
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), BATTERY_CHANNEL)
                .setMethodCallHandler(
                        ((call, result) -> {
                            if (call.method.equals("getBatteryLevel")) {
                                int batteryLevel = getBatteryLevel();

                                if (batteryLevel != -1) {
                                    result.success(batteryLevel);
                                } else {
                                    result.error("UNAVAILABLE", "Battery level not available.", null);
                                }
                            } else {
                                result.notImplemented();
                            }

                        })
                );
    }

    private String helloFromNativeCode() {
        return "Hello from Native Android Code";
    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }

    private void openWebBrowser(String url){
        Uri webpage = Uri.parse(url);
        Intent intent = new Intent(Intent.ACTION_VIEW, webpage);
        if(intent.resolveActivity(getPackageManager())!=null){
            startActivity(intent);
        }
    }

}
