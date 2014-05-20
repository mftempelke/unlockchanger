ARCHS = armv7 arm64
include $(THEOS_MAKE_PATH)/common.mk

TWEAK_NAME = UnlockChanger
UnlockChanger_FILES = Tweak.xm MyClass.m
UnlockChanger_FRAMEWORKS = UIKit EventKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += unlockchangersub
include $(THEOS_MAKE_PATH)/aggregate.mk
