//
//  RACSignal+Kiwi.m
//  ReactiveKiwi
//
//  Created by Hai Feng Kao on 2016/05/13.
//
//

#import "RACSignal+Kiwi.h"
#import "NSObject+RACDeallocating.h"

@implementation NSObject (KiwiDealloc)

- (KWFutureObject *)kwDeallocFuture {
    return [self.rac_willDeallocSignal kwCompletionFuture];
}

@end

@implementation RACSignal (Kiwi)

- (KWFutureObject *)kwFuture {
    return [self kwFutureWithDefault:nil];
}

- (KWFutureObject *)kwFutureWithDefault:(id)defaultValue {
    __block id lastValue = defaultValue;
    [self subscribeNext:^(id x) {
        lastValue = x;
    }];
    return [KWFutureObject futureObjectWithBlock:^id{
        return lastValue;
    }];
}

- (KWFutureObject *)kwCompletionFuture {
    __block BOOL completed = NO;
    [self subscribeCompleted:^{
        completed = YES;
    }];
    return [KWFutureObject futureObjectWithBlock:^id{
        return @(completed);
    }];
}

- (KWFutureObject *)kwErrorFuture {
    __block NSError *blockError = nil;
    [self subscribeError:^(NSError *error) {
        blockError = error ?: [NSError errorWithDomain:@"ReactiveKiwi" code:0
                                              userInfo:@{NSLocalizedDescriptionKey: @"Placeholder Errror"}];
    }];
    return [KWFutureObject futureObjectWithBlock:^id{
        return blockError;
    }];
}

@end
