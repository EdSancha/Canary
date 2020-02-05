//
//  ReadingViewModel.m
//  CanaryHomework
//
//  Created by Eduardo Diaz Sancha on 2/4/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//


#import "ReadingViewModel.h"
#import "Device+CoreDataClass.h"
#import "Reading+CoreDataClass.h"
#import "CoreDataController.h"
#import "ReadingDetails.h"

@interface ReadingViewModel ()

@property(nonatomic, retain) Device *device;

@end

@implementation ReadingViewModel

-(instancetype)initWithDevice:(nonnull Device*)device {
    self = [super init];
    if (!self) { return nil; }
    _device = device;
    return self;
}

/// We can Test this class easily passing a mock device with readings and getting expected display readings
-(void)getReadingsWithCompletionBlock:(ReadingViewModelCompletionBlock)completionBlock {
    [CoreDataController.sharedCache getReadingsForDevice:_device.deviceID completionBlock:^(BOOL completed, BOOL success, NSArray * _Nonnull objects) {
        
        NSMutableDictionary *displayReadings = [NSMutableDictionary new];
        for (Reading *reading in objects) {
            NSMutableArray *values = displayReadings[reading.type];
            if (values) {
                [values addObject:reading.value];
            } else {
                values = [NSMutableArray arrayWithObject:reading.value];
            }
            [displayReadings setValue:values forKey:reading.type];
        }
        
        NSMutableArray *formattedReadings = [NSMutableArray new];
        for (NSString *key in displayReadings) {
            ReadingDetails *detail = [[ReadingDetails alloc] initWithType:key values:[displayReadings objectForKey:key]];
            [formattedReadings addObject:detail];
        }
                
        completionBlock(YES,formattedReadings);
    }];

}

@end
