//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/cms/NullOutputStream.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleCmsNullOutputStream")
#ifdef RESTRICT_OrgBouncycastleCmsNullOutputStream
#define INCLUDE_ALL_OrgBouncycastleCmsNullOutputStream 0
#else
#define INCLUDE_ALL_OrgBouncycastleCmsNullOutputStream 1
#endif
#undef RESTRICT_OrgBouncycastleCmsNullOutputStream

#if !defined (OrgBouncycastleCmsNullOutputStream_) && (INCLUDE_ALL_OrgBouncycastleCmsNullOutputStream || defined(INCLUDE_OrgBouncycastleCmsNullOutputStream))
#define OrgBouncycastleCmsNullOutputStream_

#define RESTRICT_JavaIoOutputStream 1
#define INCLUDE_JavaIoOutputStream 1
#include "java/io/OutputStream.h"

@class IOSByteArray;

@interface OrgBouncycastleCmsNullOutputStream : JavaIoOutputStream

#pragma mark Public

- (void)writeWithByteArray:(IOSByteArray *)buf;

- (void)writeWithByteArray:(IOSByteArray *)buf
                   withInt:(jint)off
                   withInt:(jint)len;

- (void)writeWithInt:(jint)b;

#pragma mark Package-Private

- (instancetype)initPackagePrivate;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCmsNullOutputStream)

FOUNDATION_EXPORT void OrgBouncycastleCmsNullOutputStream_initPackagePrivate(OrgBouncycastleCmsNullOutputStream *self);

FOUNDATION_EXPORT OrgBouncycastleCmsNullOutputStream *new_OrgBouncycastleCmsNullOutputStream_initPackagePrivate(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleCmsNullOutputStream *create_OrgBouncycastleCmsNullOutputStream_initPackagePrivate(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCmsNullOutputStream)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleCmsNullOutputStream")
