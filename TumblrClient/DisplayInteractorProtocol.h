//
//  DisplayInteractorProtocol.h
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

@protocol DisplayInteractorProtocol <NSObject>

-(void)downloadPostsForBlogWithName:(NSString *)blogName;

@end
