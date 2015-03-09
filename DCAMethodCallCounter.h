//
//  DCAMethodCallCounter.h
//  
//
//  Created by Alex Yu on 3/9/15.
//  Copyright (c) 2015 no. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCAMethodCallCounter : NSObject

+ (DCAMethodCallCounter *)sharedInstance;

- (void)callMethed:(NSString *)methodName;

- (void)printResult;

@end