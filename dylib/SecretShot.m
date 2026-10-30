// SecretShot - screenshot & screen-recording detection bypass
// Pure Objective-C runtime swizzle - no Substrate required
// Works in sideloaded IPAs (Feather, Sideloadly, TrollStore, etc.)

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static BOOL (*orig_isCaptured)(id, SEL);

static BOOL hooked_isCaptured(id self, SEL _cmd) {
    return NO;
}

__attribute__((constructor)) static void secretshot_init(void) {
    Class cls = objc_getClass("UIScreen");
    if (!cls) return;

    Method m = class_getInstanceMethod(cls, @selector(isCaptured));
    if (m) {
        orig_isCaptured = (BOOL (*)(id, SEL))method_getImplementation(m);
        method_setImplementation(m, (IMP)hooked_isCaptured);
    }
}
