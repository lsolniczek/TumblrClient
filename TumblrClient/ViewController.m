//
//  ViewController.m
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import "ViewController.h"
#import "DetailsTableViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *blogName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"ShowDetails"]) {
        DetailsTableViewController *dest = [segue destinationViewController];
        dest.name = _blogName.text;
    }
}

@end
