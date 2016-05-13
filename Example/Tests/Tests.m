//
//  ReactiveKiwiTests.m
//  ReactiveKiwiTests
//
//  Created by Hai Feng Kao on 05/13/2016.
//  Copyright (c) 2016 Hai Feng Kao. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import "ReactiveKiwi.h"

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{

    it(@"can do maths", ^{
        [[[RACSignal return:@(1)].kwFuture shouldEventually] equal:@(1)];
    });

    it(@"can complete", ^{
        [[[RACSignal return:@(1)].kwCompletionFuture shouldEventually] beYes];
    });

    it(@"can get error", ^{
        NSError* error = [NSError errorWithDomain:@"ReactiveKiwi" code:0 userInfo:@{NSLocalizedDescriptionKey:@""}];
        [[[RACSignal error:error].kwErrorFuture shouldEventually] equal:error];
    });

    it(@"can be released", ^{
        KWFutureObject* future = nil;

        @autoreleasepool {
            RACSignal* signal = [RACSignal return:@(1)];
            future = signal.kwDeallocFuture;
        }

        [[future shouldEventually] beYes];
    });
});

SPEC_END

