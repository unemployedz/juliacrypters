TARGET := iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = Snapchat

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SecretShot

SecretShot_FILES = Tweak.x
SecretShot_CFLAGS = -fobjc-arc
SecretShot_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
