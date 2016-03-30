//
//  DispalyViewInteractor.m
//  TumblrClient
//
//  Created by Lukasz on 29/03/16.
//  Copyright © 2016 Lukasz. All rights reserved.
//

#import "DispalyViewInteractor.h"
#import "Post.h"

@interface DispalyViewInteractor()

@property (nonatomic, weak) id<DispalyPresenterProtocol> presenter;
@property (nonatomic, strong) NSMutableArray *serializedPosts;
@property (nonatomic, strong) NSString *currentElement;
@property (nonatomic, strong) NSString *foundTitle;
@property (nonatomic, strong) NSString *foundBody;
@property (nonatomic, strong) Post *post;
@end

@implementation DispalyViewInteractor

-(id)init:(id<DispalyPresenterProtocol>)presenter {
    self = [super init];
    if (self) {
        self.presenter = presenter;
    }
    return self;
}

#pragma mark - DisplayInteractorProtocol methods

-(void)downloadPostsForBlogWithName:(NSString *)blogName {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSString *path = [NSString stringWithFormat:@"http://%@.tumblr.com/api/read?type=text", blogName];
    NSURL *url = [[NSURL alloc] initWithString:path];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSXMLParser *xml = [[NSXMLParser alloc] initWithData:data];
            xml.delegate = self;
            [xml parse];
        }
    }];
    [task resume];
}

#pragma mark - NSXMLParserDelegate methods

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    _serializedPosts = [NSMutableArray new];
    _foundTitle = @"";
    _foundBody = @"";
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    [_presenter setFetchedPostWithResult:_serializedPosts];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"regular-title"]) {
        _currentElement = elementName;
    }
    if ([elementName isEqualToString:@"regular-body"]) {
        _currentElement = elementName;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([_currentElement isEqualToString:@"regular-title"]) {
        _foundTitle = [_foundTitle stringByAppendingString:string];
    }
    if ([_currentElement isEqualToString:@"regular-body"]) {
        _foundBody = [_foundBody stringByAppendingString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"regular-title"]) {
        _post = [[Post alloc] initWithTitle:_foundTitle];
        _foundTitle = @"";
    }
    if ([elementName isEqualToString:@"regular-body"]) {
        _foundBody = [self strippingHTMLWithString:_foundBody];
        [_post addBody:_foundBody];
        [_serializedPosts addObject:_post];
        _post = nil;
        _foundBody = @"";
    }
}

-(NSString *) strippingHTMLWithString:(NSString *)s {
    NSRange r;
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
