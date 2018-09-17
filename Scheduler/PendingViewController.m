//
//  PendingViewController.m
//  Scheduler
//
//  Created by Ruy Gonzalez on 9/15/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import "PendingViewController.h"
#import "TaskTableViewCell.h"
#import "Post.h"

@interface PendingViewController ()

@end

@implementation PendingViewController

// array with object data to be displayed in table
NSMutableArray *data;
//NSString *CellIdentifier = @"identifiercustom";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // do a parse query for data
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    //fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error){
        if(posts != nil){
            data = [NSMutableArray arrayWithArray:posts];
            //data = [data arrayByAddingObjectsFromArray: posts];
            NSLog(@"%d", posts.count);
            NSLog(@"%d", data.count);
            NSLog(@"query returned posts");
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
    
   //data = @[@"One", @"Two", @"Three"];
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 117;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 117;
    // implement reuse cells
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifiercustom" forIndexPath:indexPath];
    NSLog(@"post about to be accessed");
    Post *post = data[indexPath.row];
    NSLog(@"Cell being generated");
    cell.descriptiontv.text = post.description;
    NSTimeInterval numberOfSecondsUntilSelectedDate = [post.duedate timeIntervalSinceNow];
    if(numberOfSecondsUntilSelectedDate <= 0)
        cell.datelabel.text = @"Overdue!";
    else if(numberOfSecondsUntilSelectedDate < 60)
        cell.datelabel.text = [NSString localizedStringWithFormat:@"%d seconds", (int) numberOfSecondsUntilSelectedDate];
    else if(numberOfSecondsUntilSelectedDate < 3600)
        cell.datelabel.text = [NSString localizedStringWithFormat:@"%d minutes", (int) numberOfSecondsUntilSelectedDate/60];
    else if(numberOfSecondsUntilSelectedDate < 86400)
        cell.datelabel.text = [NSString localizedStringWithFormat:@"%d hours and %d minutes", (int) numberOfSecondsUntilSelectedDate/3600, (int) numberOfSecondsUntilSelectedDate % 60];
    else if(numberOfSecondsUntilSelectedDate < 172800)
        cell.datelabel.text = [NSString localizedStringWithFormat:@"1 day, %d hours, and %d minutes", ((int) numberOfSecondsUntilSelectedDate % 86400) / 3600, (int) (( (int) numberOfSecondsUntilSelectedDate % 86400) % 3600) / 60];
    else
        cell.datelabel.text = [NSString localizedStringWithFormat:@"%d days, %d hours, and %d minutes", (int) numberOfSecondsUntilSelectedDate/86400, (int) ((int) numberOfSecondsUntilSelectedDate % 86400) / 3600, (int) ( ((int) numberOfSecondsUntilSelectedDate % 86400) % 3600) / 60];
    //cell.datelabel.text = @"January 12";
    cell.prioritylabel.text = [post.priority stringValue];
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.textLabel.text = data[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"Data count:");
    NSLog(@"%d", data.count);
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
