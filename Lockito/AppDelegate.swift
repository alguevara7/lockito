//
//  AppDelegate.swift
//  Lockito
//
//  Created by Alexei Guevara on 2014-06-12.
//  Copyright (c) 2014 Alexei Guevara. All rights reserved.
//

import Cocoa
import IOBluetooth

class AppDelegate: NSObject, NSApplicationDelegate, CBCentralManagerDelegate {
                            
    @IBOutlet var window: NSWindow
    
    var c: CBCentralManager?

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        c = CBCentralManager(delegate: self, queue: nil, options: nil);
    }

    @IBAction func start(sender : AnyObject) {
        c!.scanForPeripheralsWithServices(nil, options: nil);
    }
    
    @IBAction func stop(sender : AnyObject) {
        c!.stopScan()
    }
    
    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
        c!.stopScan()
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        NSLog("HERE!")
    }
    
    func centralManager(
        central: CBCentralManager!,
        didDiscoverPeripheral peripheral: CBPeripheral!,
        advertisementData: NSDictionary!,
        RSSI: NSNumber!) {
     
            //closest = -62
            
            //active = -81
            
            //NSLog("\(peripheral.description) -> \(peripheral.identifier.description)")
            
            if peripheral.identifier.UUIDString() == "280B431C-145E-47F3-B3B0-4D39D50D4E43" {
                NSLog("FOUND!")
                NSLog(RSSI.description)
                c!.stopScan()
            }
    }

}

