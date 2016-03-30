//
//  Post.h
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;

-(id)initWithTitle:(NSString *)title;
-(void)addBody:(NSString *)body;

@end
