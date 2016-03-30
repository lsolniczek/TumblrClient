//
//  DispalyPresenterProtocol.h
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

@protocol DispalyPresenterProtocol <NSObject>

-(void)fetchPostsWithBlogName:(NSString *)name;
-(void)setFetchedPostWithResult:(NSArray *)posts;

@end
