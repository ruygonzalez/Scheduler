//
//  TaskTableViewCell.h
//  Scheduler
//
//  Created by Ruy Gonzalez on 9/16/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *descriptiontv;
@property (weak, nonatomic) IBOutlet UILabel *datelabel;
@property (weak, nonatomic) IBOutlet UILabel *prioritylabel;

@end
