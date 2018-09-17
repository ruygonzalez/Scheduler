//
//  PendingViewController.m
//  Scheduler
//
//  Created by Ruy Gonzalez on 9/15/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import "PendingViewController.h"
#import "TaskTableViewCell.h"

@interface PendingViewController ()

@end

@implementation PendingViewController

// array with object data to be displayed in table
NSArray *data;
//NSString *CellIdentifier = @"identifiercustom";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = @[@"One", @"Two", @"Three"];
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 117;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 117;
    // implement reuse cells
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifiercustom" forIndexPath:indexPath];
    cell.descriptiontv.text = @"ayy";
    cell.datelabel.text = @"January 12";
    cell.prioritylabel.text = @"99";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.textLabel.text = data[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 117;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
