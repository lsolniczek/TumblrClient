//
//  DetailsTableViewController.h
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewProtocol.h"

@interface DetailsTableViewController : UITableViewController<DetailsViewProtocol>

@property (nonatomic, strong) NSString *name;

@end
