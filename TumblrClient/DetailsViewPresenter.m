//
//  DetailsViewPresenter.m
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import "DetailsViewPresenter.h"
#import "DisplayInteractorProtocol.h"
#import "DispalyViewInteractor.h"

@interface DetailsViewPresenter()

@property (nonatomic, weak) id<DetailsViewProtocol> controller;
@property (nonatomic, strong) id<DisplayInteractorProtocol> interactor;

@end

@implementation DetailsViewPresenter

-(id)init:(id<DetailsViewProtocol>)controller {
    self = [super init];
    if (self) {
        self.controller = controller;
        self.interactor = [[DispalyViewInteractor alloc] init:self];
    }
    return self;
}

#pragma mark - DispalyPresenterProtocol methods
-(void)fetchPostsWithBlogName:(NSString *)name {
    [_interactor downloadPostsForBlogWithName:name];
}

-(void)setFetchedPostWithResult:(NSArray *)posts {
    if (posts.count) {
        [_controller displayPosts:posts];
    } else {
        [_controller displayAlert];
    }
}

@end
