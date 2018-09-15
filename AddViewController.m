//
//  AddViewController.m
//  Scheduler
//
//  Created by Ruy Gonzalez on 9/14/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import "AddViewController.h"
#import "Post.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UISlider *prioritySlider;
@property (weak, nonatomic) IBOutlet UILabel *sliderlabel;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicker;
@property (weak, nonatomic) IBOutlet UITextView *descriptiontext;
@property (nonatomic, strong) NSString *inputtext;
@property (nonatomic, strong) NSDate *inputdate;
@property (nonatomic, strong) NSNumber *inputnum;

@end

@implementation AddViewController

// set default values for post
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.inputtext = @"";
    self.inputnum = @(50);
    self.inputdate = self.datepicker.date;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// remove keyboard when done typing and screen touched
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

// save date when date is changed
- (IBAction)datechanged:(id)sender {
    self.inputdate = self.datepicker.date;
}

// change value displayed when slider moved
- (IBAction)onSliderMoved:(id)sender {
    self.sliderlabel.text = [NSString stringWithFormat:@"%d", (int) self.prioritySlider.value];
    self.inputnum = @((int)self.prioritySlider.value);
}

// create Post and save to parse when submit button is pressed, then return to previous view
- (IBAction)submit:(id)sender {
    Post *post = [Post new];
    post.postID = @"PostID";
    post.userID = @"userID";
    NSString *textValue = [NSString stringWithFormat:@"%@", _descriptiontext.text];
    post.description = textValue;
    post.priority = self.inputnum;
    post.duedate = self.inputdate;
    
    [post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
    [self.navigationController popViewControllerAnimated:YES];
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
