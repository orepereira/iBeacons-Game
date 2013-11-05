//
//  GetViewController.m
//  iBeacons Hot and Cold
//
//  Created by Jorge Costa on 10/18/13.
//  Copyright (c) 2013 MobileTuts. All rights reserved.
//

#import "GetViewController.h"

@interface GetViewController ()

@end

@implementation GetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;

    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"F2037E44-13BF-4083-A3A6-514A17BBBA10"];
    _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"com.MobileTuts.iBeacons"];
    [_locationManager startMonitoringForRegion:_beaconRegion];

    [self locationManager:_locationManager didStartMonitoringForRegion:_beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [_locationManager startRangingBeaconsInRegion:_beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"Beacon Found");
    [_locationManager startRangingBeaconsInRegion:_beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"Left Region");
    [_locationManager stopRangingBeaconsInRegion:_beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons lastObject];
    
    self.UUID.text = beacon.proximityUUID.UUIDString;
    if (beacon.proximity == CLProximityUnknown) {
        _distanceLabel.text = @"Unknown Proximity";
        [_view setBackgroundColor:[UIColor blackColor]];
    } else if (beacon.proximity == CLProximityImmediate) {
        _distanceLabel.text = @"Immediate";
        [_view setBackgroundColor:[UIColor redColor]];
    } else if (beacon.proximity == CLProximityNear) {
        _distanceLabel.text = @"Near";
        [_view setBackgroundColor:[UIColor orangeColor]];
    } else if (beacon.proximity == CLProximityFar) {
        _distanceLabel.text = @"Far";
        [_view setBackgroundColor:[UIColor blueColor]];
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
