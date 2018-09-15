//
//  Post.h
//  Scheduler
//
//  Created by Ruy Gonzalez on 9/15/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import "PFObject.h"
#import "Parse/Parse.h"
@interface Post : PFObject<PFSubclassing>
    @property (nonatomic, strong) NSString *postID;
    @property (nonatomic, strong) NSString *userID;
    @property (nonatomic, strong) NSString *description;
    @property (nonatomic, strong) NSDate *duedate;
    @property (nonatomic, strong) NSNumber *priority;

@end
