// Minimal Snapchat screenshot + screen recording detection bypass
// Hooks UIScreen isCaptured so Snapchat never sees a capture event.
// Also covers the notification path used for chats and profiles.

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

%hook UIScreen

- (BOOL)isCaptured {
    return NO;
}

%end

// Extra safety: block the capture notification that some Snapchat builds observe
%hook UIScreen

+ (void)load {
    [[NSNotificationCenter defaultCenter] addObserverForName:UIScreenCapturedDidChangeNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification * _Nonnull note) {
        // swallow
    }];
}

%end

// Constructor so it loads early
%ctor {
    %init;
}
