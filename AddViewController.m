//
//  AddViewController.m
//  Scheduler
//
//  Created by Ruy Gonzalez on 9/14/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UISlider *prioritySlider;
@property (weak, nonatomic) IBOutlet UILabel *sliderlabel;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// remove keyboard when done typing and screen touched
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

// change value displayed when slider moved
- (IBAction)onSliderMoved:(id)sender {
    self.sliderlabel.text = [NSString stringWithFormat:@"%d", (int) self.prioritySlider.value];
}

- (IBAction)submit:(id)sender {
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
