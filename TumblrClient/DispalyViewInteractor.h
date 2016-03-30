//
//  DispalyViewInteractor.h
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisplayInteractorProtocol.h"
#import "DispalyPresenterProtocol.h"

@interface DispalyViewInteractor : NSObject<DisplayInteractorProtocol, NSXMLParserDelegate>

-(id)init:(id<DispalyPresenterProtocol>)presenter;

@end
