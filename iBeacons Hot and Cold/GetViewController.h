//
//  GetViewController.h
//  iBeacons Hot and Cold
//
//  Created by Jorge Costa on 10/18/13.
//  Copyright (c) 2013 MobileTuts. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface GetViewController : ViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *UUID;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
