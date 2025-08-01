//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/PolynomialRingGF2.java
//

#include "J2ObjC_source.h"
#include "java/io/PrintStream.h"
#include "java/lang/System.h"
#include "org/bouncycastle/pqc/math/linearalgebra/PolynomialRingGF2.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/math/linearalgebra/PolynomialRingGF2 must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2 ()

/*!
 @brief Default constructor (private).
 */
- (instancetype)init;

@end

__attribute__((unused)) static void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_init(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2 *self);

__attribute__((unused)) static OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2 *new_OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_init(void) NS_RETURNS_RETAINED;

__attribute__((unused)) static OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2 *create_OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_init(void);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/PolynomialRingGF2.java"


#line 13
@implementation OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 19
- (instancetype)init {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 32
+ (jint)addWithInt:(jint)p
           withInt:(jint)q {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_addWithInt_withInt_(p, q);
}


#line 45
+ (jlong)multiplyWithInt:(jint)p
                 withInt:(jint)q {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_multiplyWithInt_withInt_(p, q);
}


#line 75
+ (jint)modMultiplyWithInt:(jint)a
                   withInt:(jint)b
                   withInt:(jint)r {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_modMultiplyWithInt_withInt_withInt_(a, b, r);
}


#line 109
+ (jint)degreeWithInt:(jint)p {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(p);
}


#line 127
+ (jint)degreeWithLong:(jlong)p {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithLong_(p);
}


#line 145
+ (jint)remainderWithInt:(jint)p
                 withInt:(jint)q {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_remainderWithInt_withInt_(p, q);
}


#line 172
+ (jint)restWithLong:(jlong)p
             withInt:(jint)q {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_restWithLong_withInt_(p, q);
}


#line 204
+ (jint)gcdWithInt:(jint)p
           withInt:(jint)q {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_gcdWithInt_withInt_(p, q);
}


#line 226
+ (jboolean)isIrreducibleWithInt:(jint)p {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_isIrreducibleWithInt_(p);
}


#line 251
+ (jint)getIrreduciblePolynomialWithInt:(jint)deg {
  return OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_getIrreduciblePolynomialWithInt_(deg);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x2, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 0, 1, -1, -1, -1, -1 },
    { NULL, "J", 0x9, 2, 1, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 3, 4, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 5, 6, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 5, 7, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 8, 1, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 9, 10, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 11, 1, -1, -1, -1, -1 },
    { NULL, "Z", 0x9, 12, 6, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 13, 6, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(addWithInt:withInt:);
  methods[2].selector = @selector(multiplyWithInt:withInt:);
  methods[3].selector = @selector(modMultiplyWithInt:withInt:withInt:);
  methods[4].selector = @selector(degreeWithInt:);
  methods[5].selector = @selector(degreeWithLong:);
  methods[6].selector = @selector(remainderWithInt:withInt:);
  methods[7].selector = @selector(restWithLong:withInt:);
  methods[8].selector = @selector(gcdWithInt:withInt:);
  methods[9].selector = @selector(isIrreducibleWithInt:);
  methods[10].selector = @selector(getIrreduciblePolynomialWithInt:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "add", "II", "multiply", "modMultiply", "III", "degree", "I", "J", "remainder", "rest", "JI", "gcd", "isIrreducible", "getIrreduciblePolynomial" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2 = { "PolynomialRingGF2", "org.bouncycastle.pqc.math.linearalgebra", ptrTable, methods, NULL, 7, 0x11, 11, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2;
}

@end


#line 19
void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_init(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2 *self) {
  NSObject_init(self);
}


#line 19
OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2 *new_OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2, init)
}


#line 19
OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2 *create_OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2, init)
}


#line 32
jint OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_addWithInt_withInt_(jint p, jint q) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  return p ^ q;
}


#line 45
jlong OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_multiplyWithInt_withInt_(jint p, jint q) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  jlong result = 0;
  if (q != 0) {
    
#line 50
    jlong q1 = q & (jlong) 0x00000000ffffffffLL;
    
#line 52
    while (p != 0) {
      
#line 54
      jbyte b = (jbyte) (p & (jint) 0x01);
      if (b == 1) {
        
#line 57
        result ^= q1;
      }
      JreURShiftAssignInt(&p, 1);
      JreLShiftAssignLong(&q1, 1);
    }
  }
  
#line 64
  return result;
}


#line 75
jint OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_modMultiplyWithInt_withInt_withInt_(jint a, jint b, jint r) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  jint result = 0;
  jint p = OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_remainderWithInt_withInt_(a, r);
  jint q = OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_remainderWithInt_withInt_(b, r);
  if (q != 0) {
    
#line 82
    jint d = JreLShift32(1, OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(r));
    
#line 84
    while (p != 0) {
      
#line 86
      jbyte pMod2 = (jbyte) (p & (jint) 0x01);
      if (pMod2 == 1) {
        
#line 89
        result ^= q;
      }
      JreURShiftAssignInt(&p, 1);
      JreLShiftAssignInt(&q, 1);
      if (q >= d) {
        
#line 95
        q ^= r;
      }
    }
  }
  return result;
}


#line 109
jint OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(jint p) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  jint result = -1;
  while (p != 0) {
    
#line 114
    result++;
    JreURShiftAssignInt(&p, 1);
  }
  return result;
}


#line 127
jint OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithLong_(jlong p) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  jint result = 0;
  while (p != 0) {
    
#line 132
    result++;
    JreURShiftAssignLong(&p, 1);
  }
  return result - 1;
}


#line 145
jint OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_remainderWithInt_withInt_(jint p, jint q) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  jint result = p;
  
#line 149
  if (q == 0) {
    
#line 152
    [((JavaIoPrintStream *) nil_chk(JreLoadStatic(JavaLangSystem, err))) printlnWithNSString:@"Error: to be divided by 0"];
    return 0;
  }
  
#line 156
  while (OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(result) >= OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(q)) {
    
#line 158
    result ^= JreLShift32(q, (OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(result) - OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(q)));
  }
  
#line 161
  return result;
}


#line 172
jint OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_restWithLong_withInt_(jlong p, jint q) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  jlong p1 = p;
  if (q == 0) {
    
#line 178
    [((JavaIoPrintStream *) nil_chk(JreLoadStatic(JavaLangSystem, err))) printlnWithNSString:@"Error: to be divided by 0"];
    return 0;
  }
  jlong q1 = q & (jlong) 0x00000000ffffffffLL;
  while ((JreURShift64(p1, 32)) != 0) {
    
#line 184
    p1 ^= JreLShift64(q1, (OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithLong_(p1) - OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithLong_(q1)));
  }
  
#line 187
  jint result = (jint) (p1 & (jint) 0xffffffff);
  while (OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(result) >= OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(q)) {
    
#line 190
    result ^= JreLShift32(q, (OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(result) - OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(q)));
  }
  
#line 193
  return result;
}


#line 204
jint OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_gcdWithInt_withInt_(jint p, jint q) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  jint a;
  
#line 206
  jint b;
  
#line 206
  jint c;
  a = p;
  b = q;
  while (b != 0) {
    
#line 211
    c = OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_remainderWithInt_withInt_(a, b);
    a = b;
    b = c;
  }
  
#line 216
  return a;
}


#line 226
jboolean OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_isIrreducibleWithInt_(jint p) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  if (p == 0) {
    
#line 230
    return false;
  }
  jint d = JreURShift32(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_degreeWithInt_(p), 1);
  jint u = 2;
  for (jint i = 0; i < d; i++) {
    
#line 236
    u = OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_modMultiplyWithInt_withInt_withInt_(u, u, p);
    if (OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_gcdWithInt_withInt_(u ^ 2, p) != 1) {
      
#line 239
      return false;
    }
  }
  return true;
}


#line 251
jint OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_getIrreduciblePolynomialWithInt_(jint deg) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_initialize();
  if (deg < 0) {
    
#line 256
    [((JavaIoPrintStream *) nil_chk(JreLoadStatic(JavaLangSystem, err))) printlnWithNSString:@"The Degree is negative"];
    return 0;
  }
  if (deg > 31) {
    
#line 262
    [((JavaIoPrintStream *) nil_chk(JreLoadStatic(JavaLangSystem, err))) printlnWithNSString:@"The Degree is more then 31"];
    return 0;
  }
  if (deg == 0) {
    
#line 267
    return 1;
  }
  jint a = JreLShift32(1, deg);
  a++;
  jint b = JreLShift32(1, (deg + 1));
  for (jint i = a; i < b; i += 2) {
    
#line 274
    if (OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2_isIrreducibleWithInt_(i)) {
      
#line 276
      return i;
    }
  }
  return 0;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2)
