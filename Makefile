ARCHS = armv7 arm64
include $(THEOS_MAKE_PATH)/common.mk

TWEAK_NAME = UnlockChanger
UnlockChanger_FILES = Tweak.xm
UnlockChanger_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += unlockchanger
include $(THEOS_MAKE_PATH)/aggregate.mk
