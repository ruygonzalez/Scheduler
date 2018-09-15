//
//  Post.m
//  Scheduler
//
//  Created by Ruy Gonzalez on 9/15/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import "Post.h"

@implementation Post

    @dynamic postID;
    @dynamic userID;
    @dynamic description;
    @dynamic duedate;
    @dynamic priority;

    + (nonnull NSString *)parseClassName {
        return @"Post";
    }

@end
