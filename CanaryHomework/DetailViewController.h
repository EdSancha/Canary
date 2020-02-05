//
//  DetailViewController.h
//  CanaryHomework
//
//  Created by Michael Schroeder on 9/24/19.
//  Copyright © 2019 Michael Schroeder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Device+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithDevice:(Device *)device;

@end

NS_ASSUME_NONNULL_END
