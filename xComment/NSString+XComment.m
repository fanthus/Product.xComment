//
//  NSString+XComment.m
//  xComment
//
//  Created by xiushanfan on 14/10/2016.
//  Copyright © 2016 Fan. All rights reserved.
//

#import "NSString+XComment.h"

#define kCommentSign    @"//"

@implementation NSString (XComment)


- (NSString *)addCommentSign {
    NSString *commentSignStr = [NSString stringWithFormat:@"%@%@",kCommentSign,self];
    return commentSignStr;
}

- (NSString *)deleteCommentSign {
    NSMutableString *originStr = [NSMutableString stringWithString:self] ;
    NSRange commentCommandRange = [originStr rangeOfString:kCommentSign options:NSCaseInsensitiveSearch];
    [originStr deleteCharactersInRange:commentCommandRange];
    return originStr;
}

- (BOOL)haveCommentSign {
    NSString *pureStr = [self pureString];
    if ([pureStr hasPrefix:kCommentSign]) {
        return YES;
    }
    return NO;
}

- (NSString *)pureString {
    NSMutableString *tOriginStr = [NSMutableString stringWithString:self];
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [tOriginStr stringByTrimmingCharactersInSet:charSet];
}

@end
