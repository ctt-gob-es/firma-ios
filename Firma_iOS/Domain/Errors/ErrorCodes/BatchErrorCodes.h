//
//  BatchErrorCode.h
//  Firma_iOS
//
//  Created by Desarrollo Abamobile on 14/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

// BatchErrorCodes.h

#import <Foundation/Foundation.h>

typedef NSString *BatchErrorCodes NS_TYPED_ENUM;

extern BatchErrorCodes const DownloadErrorHTTPResponse;
extern BatchErrorCodes const DownloadErrorResponseFormat;
extern BatchErrorCodes const DownloadErrorResponseFormatDictionary;
extern BatchErrorCodes const UploadErrorHTTPResponse;
extern BatchErrorCodes const UploadErrorResponseFormat;
extern BatchErrorCodes const PresignErrorHTTPResponse;
extern BatchErrorCodes const PresignErrorResponseFormat;
extern BatchErrorCodes const PresignErrorResponseFormatDictionary;
extern BatchErrorCodes const PostsignErrorHTTPResponse;
extern BatchErrorCodes const PostsignErrorResponseFormat;
extern BatchErrorCodes const PostsignErrorResponseFormatDictionary;

extern BatchErrorCodes const DownloadErrorConnection;
extern BatchErrorCodes const UploadErrorConnection;
extern BatchErrorCodes const PresignErrorConnection;
extern BatchErrorCodes const PostsignErrorConnection;
