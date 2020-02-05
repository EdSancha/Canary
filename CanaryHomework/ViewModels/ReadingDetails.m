//
//  ReadingDetails.m
//  CanaryHomework
//
//  Created by Eduardo Diaz Sancha on 2/4/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//

#import "ReadingDetails.h"

@implementation ReadingDetails

-(instancetype)initWithType:(nonnull NSString*)type values:(nonnull NSArray*)values {
    self = [super init];
    if (!self) { return nil; }
    _name = type;
    
    int min = INT_MAX;
    int max = INT_MIN;
    double total = 0;
    
    for (NSNumber *value in values) {
        min = MIN(min,[value intValue]);
        max = MAX(max,[value intValue]);
        total = total + [value doubleValue];
    }
    
    _min = @(min);
    _max = @(max);
    _average = @(total/values.count);

    return self;
}

@end


