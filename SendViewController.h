//
//  SendViewController.h
//  iBeacons Hot and Cold
//
//  Created by Jorge Costa on 10/18/13.
//  Copyright (c) 2013 MobileTuts. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface SendViewController : ViewController <CBPeripheralManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *uuidLabel;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) NSDictionary *beaconPeripheralData;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@end
