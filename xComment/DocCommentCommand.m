//
//  SourceEditorCommand.m
//  XComment
//
//  Created by xiushanfan on 14/10/2016.
//  Copyright © 2016 Fan. All rights reserved.
//

#import "DocCommentCommand.h"
#import "NSString+XComment.h"

@implementation DocCommentCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler {
    NSMutableArray *bufferLines = invocation.buffer.lines;
    if (invocation.buffer.selections.count > 0) {
        NSInteger startLine = ((XCSourceTextRange *)[invocation.buffer.selections objectAtIndex:0]).start.line;
        NSInteger endLine = ((XCSourceTextRange *)[invocation.buffer.selections objectAtIndex:0]).end.line;
        if (startLine == endLine) {
            if ([bufferLines[startLine] haveCommentSign]) {
                bufferLines[startLine] = [bufferLines[startLine] deleteCommentSign];
            } else {
                bufferLines[startLine] = [bufferLines[startLine] addCommentSign];
            }
        } else {
            BOOL allLinesComment = YES;
            for (NSInteger index = startLine; index <= endLine; index++) {
                if (NO == [bufferLines[index] haveCommentSign]) {
                    allLinesComment = NO;
                }
            }
            if (allLinesComment == NO) {
                for (NSInteger index = startLine; index <= endLine; index++) {
                   bufferLines[index] =  [bufferLines[index] addCommentSign];
                }
            } else {
                for (NSInteger index = startLine; index <= endLine; index++) {
                    bufferLines[index] = [bufferLines[index] deleteCommentSign];
                }
            }
        }
    }
    completionHandler(nil);
}



@end
