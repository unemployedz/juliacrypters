// SecretShot - Substrate-free screenshot & screen-recording bypass for Snapchat
// Uses pure Objective-C runtime method swizzling (works in sideloaded/jailed IPAs)

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static BOOL (*orig_isCaptured)(id, SEL);

static BOOL hooked_isCaptured(id self, SEL _cmd) {
    return NO;   // always report "not captured"
}

__attribute__((constructor)) static void secretshot_init(void) {
    Class cls = objc_getClass("UIScreen");
    if (!cls) return;

    Method m = class_getInstanceMethod(cls, @selector(isCaptured));
    if (m) {
        orig_isCaptured = (void *)method_getImplementation(m);
        method_setImplementation(m, (IMP)hooked_isCaptured);
    }

    // Also silence the notification that some Snapchat builds observe
    // (best-effort – we can't fully remove system notifications)
}
