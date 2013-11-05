//
//  SendViewController.m
//  iBeacons Hot and Cold
//
//  Created by Jorge Costa on 10/18/13.
//  Copyright (c) 2013 MobileTuts. All rights reserved.
//

#import "SendViewController.h"

@interface SendViewController ()

@end

@implementation SendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // iBeacon Init
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"F2037E44-13BF-4083-A3A6-514A17BBBA10"];
    _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:1 minor:1 identifier:@"com.MobileTuts.iBeacons"];
    
    _uuidLabel.text = _beaconRegion.proximityUUID.UUIDString;

    _beaconPeripheralData = [_beaconRegion peripheralDataWithMeasuredPower:nil];
    _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
}


-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"On");
        [_peripheralManager startAdvertising:_beaconPeripheralData];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Off");
        [_peripheralManager stopAdvertising];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
