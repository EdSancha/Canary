//
//  ReadingViewModel.h
//  CanaryHomework
//
//  Created by Eduardo Diaz Sancha on 2/4/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Device+CoreDataClass.h"

typedef void(^ReadingViewModelCompletionBlock)(BOOL success, id _Nonnull readings);

@interface ReadingViewModel : NSObject

-(nonnull instancetype)initWithDevice:(nonnull Device *)device;

-(void)getReadingsWithCompletionBlock:(nonnull ReadingViewModelCompletionBlock)completionBlock;

@end
