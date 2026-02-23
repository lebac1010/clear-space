package com.lebac.storage_dashboard.clear_space.utils

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build

/**
 * Monitors battery level to pause scanning when battery is low.
 */
class BatteryMonitor(private val context: Context) {

    private var batteryReceiver: BroadcastReceiver? = null
    private var onLowBattery: (() -> Unit)? = null
    private var onBatteryOk: (() -> Unit)? = null
    
    companion object {
        const val LOW_BATTERY_THRESHOLD = 15
    }
    
    /**
     * Start monitoring battery
     */
    fun startMonitoring(
        onLowBattery: () -> Unit,
        onBatteryOk: () -> Unit
    ) {
        this.onLowBattery = onLowBattery
        this.onBatteryOk = onBatteryOk
        
        batteryReceiver = object : BroadcastReceiver() {
            override fun onReceive(ctx: Context, intent: Intent) {
                val level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
                val scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, 100)
                val percentage = (level * 100) / scale
                
                if (percentage <= LOW_BATTERY_THRESHOLD) {
                    this@BatteryMonitor.onLowBattery?.invoke()
                } else {
                    this@BatteryMonitor.onBatteryOk?.invoke()
                }
            }
        }
        
        val filter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        
        // [E2] Android 14+ requires explicit receiver export flag
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            context.registerReceiver(batteryReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
        } else {
            context.registerReceiver(batteryReceiver, filter)
        }
    }
    
    /**
     * Stop monitoring
     */
    fun stopMonitoring() {
        batteryReceiver?.let {
            try {
                context.unregisterReceiver(it)
            } catch (e: Exception) {
                // Already unregistered
            }
        }
        batteryReceiver = null
        onLowBattery = null
        onBatteryOk = null
    }
    
    /**
     * Get current battery level
     */
    fun getCurrentBatteryLevel(): Int {
        val batteryIntent = context.registerReceiver(
            null,
            IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        )
        
        val level = batteryIntent?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
        val scale = batteryIntent?.getIntExtra(BatteryManager.EXTRA_SCALE, 100) ?: 100
        
        return (level * 100) / scale
    }
    
    /**
     * Check if battery is OK for scanning
     */
    fun isBatteryOk(): Boolean {
        return getCurrentBatteryLevel() > LOW_BATTERY_THRESHOLD
    }
}
