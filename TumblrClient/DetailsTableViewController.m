//
//  DetailsTableViewController.m
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "DispalyPresenterProtocol.h"
#import "DetailsViewPresenter.h"
#import "PostCell.h"
#import "Post.h"

@interface DetailsTableViewController ()

@property (nonatomic, strong) NSArray *posts;
@property (nonatomic, strong) id<DispalyPresenterProtocol> presenter;

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _presenter = [[DetailsViewPresenter alloc] init:self];
    [_presenter fetchPostsWithBlogName:self.name];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    
    Post *post = _posts[indexPath.row];
    
    [cell.title setText:post.title];
    [cell.body setText:post.body];
    
    return cell;
}

#pragma mark - DetailsViewProtocol methods

-(void)displayPosts:(NSArray *)posts {
    _posts = posts;
    [self.tableView reloadData];
}

-(void)displayAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Blog Post Info" message:@"You have provided wrong blog name or this blog has no posts." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
