// SecretShot - screenshot / screen-recording bypass for Snapchat (sideloaded)
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <stdio.h>
#import <string.h>

static BOOL (*orig_isCaptured)(id, SEL);

static BOOL hooked_isCaptured(id self, SEL _cmd) {
    return NO;
}

// Force the binary to contain real data so size can't be tiny
static const char kPadding[32768] = {0};

__attribute__((constructor)) static void secretshot_init(void) {
    // touch the padding so linker keeps it
    volatile char c = kPadding[0] + kPadding[32767];
    (void)c;

    Class cls = objc_getClass("UIScreen");
    if (!cls) return;

    Method m = class_getInstanceMethod(cls, @selector(isCaptured));
    if (m) {
        orig_isCaptured = (BOOL (*)(id, SEL))method_getImplementation(m);
        method_setImplementation(m, (IMP)hooked_isCaptured);
    }
}
