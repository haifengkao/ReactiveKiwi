//
//  RACSignal+Kiwi.h
//  ReactiveKiwi
//
//  Created by Hai Feng Kao on 2016/05/13.
//
//

#import <Foundation/Foundation.h>
#import "RACSignal.h"
#import "Kiwi.h"

@interface NSObject (KiwiDealloc)
- (KWFutureObject *)kwDeallocFuture;
@end

@interface RACSignal (Kiwi)

- (KWFutureObject *)kwFuture;
- (KWFutureObject *)kwFutureWithDefault:(id)defaultValue;
- (KWFutureObject *)kwCompletionFuture;
- (KWFutureObject *)kwErrorFuture;
@end

