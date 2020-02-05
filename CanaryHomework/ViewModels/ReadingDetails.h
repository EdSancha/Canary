//
//  ReadingViewModel.h
//  CanaryHomework
//
//  Created by Eduardo Diaz Sancha on 2/4/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadingDetails : NSObject

@property (nonatomic, copy, readonly) NSString* _Nonnull name;
@property (nonatomic, copy, readonly) NSNumber* _Nonnull min;
@property (nonatomic, copy, readonly) NSNumber* _Nonnull max;
@property (nonatomic, copy, readonly) NSNumber* _Nonnull average;

-(instancetype _Nonnull)initWithType:(nonnull NSString*)type values:(nonnull NSArray*)values;

@end
