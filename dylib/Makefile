TARGET := iphone:clang:latest:15.0
ARCHS = arm64
include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = SecretShot

SecretShot_FILES = Tweak.m
SecretShot_CFLAGS = -fobjc-arc -fvisibility=hidden
SecretShot_FRAMEWORKS = UIKit
SecretShot_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS_MAKE_PATH)/library.mk
