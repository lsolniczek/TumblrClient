//
//  DetailsViewPresenter.h
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DispalyPresenterProtocol.h"
#import "DetailsViewProtocol.h"

@interface DetailsViewPresenter : NSObject<DispalyPresenterProtocol>

-(id)init:(id<DetailsViewProtocol>)controller;

@end
