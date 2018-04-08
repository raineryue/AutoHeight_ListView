//
//  ViewController.m
//  AutoHeight_ListView
//
//  Created by Rainer on 2018/4/8.
//  Copyright © 2018年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCellAutoHeightController.h"
#import "UICollectionViewCellAutoHeightController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tableViewListClickedAction:(UIButton *)sender {
    UITableViewCellAutoHeightController *tableViewCellAutoHeightController = [[UITableViewCellAutoHeightController alloc] init];
    
    [self.navigationController pushViewController:tableViewCellAutoHeightController animated:YES];
}

- (IBAction)collectionViewListClickedAction:(UIButton *)sender {
    UICollectionViewCellAutoHeightController *collectionViewCellAutoHeightController = [[UICollectionViewCellAutoHeightController alloc] init];
    
    [self.navigationController pushViewController:collectionViewCellAutoHeightController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
