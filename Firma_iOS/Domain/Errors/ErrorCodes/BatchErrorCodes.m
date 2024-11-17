//
//  BatchErrorCodes.m
//  Autofirma
//
//  Created by Desarrollo Abamobile on 14/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
#import "BatchErrorCodes.h"


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


// Errores de software de terceros
BatchErrorCodes const DownloadErrorHTTPResponse = @"300201";
BatchErrorCodes const DownloadErrorResponseFormat = @"300202";
BatchErrorCodes const DownloadErrorResponseFormatDictionary = @"300203";
BatchErrorCodes const UploadErrorHTTPResponse = @"300301";
BatchErrorCodes const UploadErrorResponseFormat = @"300302";
BatchErrorCodes const PresignErrorHTTPResponse = @"300401";
BatchErrorCodes const PresignErrorResponseFormat = @"300402";
BatchErrorCodes const PresignErrorResponseFormatDictionary = @"300403";
BatchErrorCodes const PostsignErrorHTTPResponse = @"300404";
BatchErrorCodes const PostsignErrorResponseFormat = @"300405";
BatchErrorCodes const PostsignErrorResponseFormatDictionary = @"300406";


// Errores de comunicacion
BatchErrorCodes const DownloadErrorConnection = @"404101";
BatchErrorCodes const UploadErrorConnection = @"404201";
BatchErrorCodes const PresignErrorConnection = @"404301";
BatchErrorCodes const PostsignErrorConnection = @"404302";
