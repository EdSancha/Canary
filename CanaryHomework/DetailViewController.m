//
//  DetailViewController.m
//  CanaryHomework
//
//  Created by Michael Schroeder on 9/24/19.
//  Copyright © 2019 Michael Schroeder. All rights reserved.
//

#import "DetailViewController.h"
#import "Device+CoreDataClass.h"
#import "Reading+CoreDataClass.h"
#import "CoreDataController.h"
#import "ReadingViewModel.h"
#import "ReadingDetails.h"

@interface DetailViewController ()

@property (nonatomic, strong) Device *device;

@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) UILayoutGuide *safeArea;
@property(nonatomic, retain) NSArray *details;
@property(nonatomic, retain) ReadingViewModel *readingViewModel;

@end

@implementation DetailViewController

- (instancetype)initWithDevice:(Device *)device {
    self = [super init];
    _device = device;
    _readingViewModel = [[ReadingViewModel alloc] initWithDevice:device];
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"About Device";
    self.safeArea = self.view.layoutMarginsGuide;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTableView];

    __weak typeof(self) weakSelf = self;
    [_readingViewModel getReadingsWithCompletionBlock:^(BOOL success, id  _Nonnull readings) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf.details = readings;
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [strongSelf.tableView reloadData];
                });
            }
        }
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)setupTableView {
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.tableView];
    [[self.tableView.topAnchor constraintEqualToAnchor:self.safeArea.topAnchor] setActive:true];
    [[self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:true];
    [[self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:true];
    [[self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:true];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


#pragma mark - UITableView Data Source

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ReadingDetails *details = (ReadingDetails *)self.details[indexPath.item];
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.text = [NSString stringWithFormat:@"%@\nMin:%@ Max:%@ Average:%@", details.name.capitalizedString, details.min, details.max, details.average];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.details.count;
}

#pragma mark UITableView Delegate

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


@end
