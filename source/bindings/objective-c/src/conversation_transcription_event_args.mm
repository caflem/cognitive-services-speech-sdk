//
// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE.md file in the project root for full license information.
//

#import "speechapi_private.h"

@implementation SPXConversationTranscriptionEventArgs

- (instancetype)init:(const TranscriptionImpl::ConversationTranscriptionEventArgs&)e
{
    self = [super init:e];
    _result = [[SPXConversationTranscriptionResult alloc] init :e.GetResult()];

    return self;
}

@end

@implementation SPXConversationTranscriptionCanceledEventArgs

- (instancetype)init:(const TranscriptionImpl::ConversationTranscriptionCanceledEventArgs&)e
{
    self = [super init:e];
    auto cancellationDetails = e.GetCancellationDetails();
    _reason = [Util fromCancellationReasonImpl:cancellationDetails->Reason];
    _errorCode = [Util fromCancellationErrorCodeImpl:cancellationDetails->ErrorCode];
    _errorDetails = [NSString StringWithStdString:cancellationDetails->ErrorDetails];
    
    return self;
}

@end

