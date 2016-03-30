//
//  Post.m
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import "Post.h"

@interface Post()
@end

@implementation Post

-(id)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

-(void)addBody:(NSString *)body {
    self.body = body;
}

@end
