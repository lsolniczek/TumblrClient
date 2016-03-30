//
//  PostCell.h
//  TumblrClient
//
//  Created by Lukasz on 30/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *body;

@end
