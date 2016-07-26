//
//  ViewController.m
//  GYCirCleProgress
//
//  Created by ronmei on 16/7/25.
//  Copyright © 2016年 gaoyu. All rights reserved.
//

#import "ViewController.h"
#import "GYCircleProgressView.h"
#import "GYProgressCell.h"

static NSString *ID = @"GYProgressCell";
@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GYCircleProgressView *progressView = [[GYCircleProgressView alloc] initWithFrame:CGRectMake(150, 20, 100, 100)];
    progressView.duration = 1.75;
    progressView.progressBarColor = [UIColor redColor];
    progressView.ballColor = [UIColor redColor];
    progressView.ratioLabel.textColor = [UIColor redColor];
    [progressView setProgress:0.83 animated:YES];
    [self.view addSubview:progressView];
    
    [self.tableView registerNib:[UINib nibWithNibName: NSStringFromClass([GYProgressCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GYProgressCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.progress = indexPath.row / 10.0;
    
    return cell;
}




@end
