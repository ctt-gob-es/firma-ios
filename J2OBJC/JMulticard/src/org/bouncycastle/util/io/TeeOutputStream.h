//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/util/io/TeeOutputStream.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleUtilIoTeeOutputStream")
#ifdef RESTRICT_OrgBouncycastleUtilIoTeeOutputStream
#define INCLUDE_ALL_OrgBouncycastleUtilIoTeeOutputStream 0
#else
#define INCLUDE_ALL_OrgBouncycastleUtilIoTeeOutputStream 1
#endif
#undef RESTRICT_OrgBouncycastleUtilIoTeeOutputStream

#if !defined (OrgBouncycastleUtilIoTeeOutputStream_) && (INCLUDE_ALL_OrgBouncycastleUtilIoTeeOutputStream || defined(INCLUDE_OrgBouncycastleUtilIoTeeOutputStream))
#define OrgBouncycastleUtilIoTeeOutputStream_

#define RESTRICT_JavaIoOutputStream 1
#define INCLUDE_JavaIoOutputStream 1
#include "java/io/OutputStream.h"

@class IOSByteArray;

/*!
 @brief An output stream which copies anything written into it to another stream.
 */
@interface OrgBouncycastleUtilIoTeeOutputStream : JavaIoOutputStream

#pragma mark Public

/*!
 @brief Base constructor.
 @param output1 the output stream that is wrapped.
 @param output2 a secondary stream that anything written to output1 is also written to.
 */
- (instancetype)initWithJavaIoOutputStream:(JavaIoOutputStream *)output1
                    withJavaIoOutputStream:(JavaIoOutputStream *)output2;

- (void)close;

- (void)flush;

- (void)writeWithByteArray:(IOSByteArray *)buf;

- (void)writeWithByteArray:(IOSByteArray *)buf
                   withInt:(jint)off
                   withInt:(jint)len;

- (void)writeWithInt:(jint)b;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleUtilIoTeeOutputStream)

FOUNDATION_EXPORT void OrgBouncycastleUtilIoTeeOutputStream_initWithJavaIoOutputStream_withJavaIoOutputStream_(OrgBouncycastleUtilIoTeeOutputStream *self, JavaIoOutputStream *output1, JavaIoOutputStream *output2);

FOUNDATION_EXPORT OrgBouncycastleUtilIoTeeOutputStream *new_OrgBouncycastleUtilIoTeeOutputStream_initWithJavaIoOutputStream_withJavaIoOutputStream_(JavaIoOutputStream *output1, JavaIoOutputStream *output2) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleUtilIoTeeOutputStream *create_OrgBouncycastleUtilIoTeeOutputStream_initWithJavaIoOutputStream_withJavaIoOutputStream_(JavaIoOutputStream *output1, JavaIoOutputStream *output2);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleUtilIoTeeOutputStream)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleUtilIoTeeOutputStream")
