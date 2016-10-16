//
//  NSString+XComment.h
//  xComment
//
//  Created by xiushanfan on 14/10/2016.
//  Copyright © 2016 Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XComment)

- (NSString *)addCommentSign;

- (NSString *)deleteCommentSign;

- (BOOL)haveCommentSign;

- (NSString *)pureString;

@end
