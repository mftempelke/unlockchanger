ARCHS = armv7 arm64
include theos/makefiles/common.mk

BUNDLE_NAME = UnlockChangerMFOK
UnlockChangerMFOK_FILES = UnlockChangerMM.mm // FlipLaunch.mm
UnlockChangerMFOK_INSTALL_PATH = /Library/PreferenceBundles
UnlockChangerMFOK_FRAMEWORKS = UIKit
UnlockChangerMFOK_PRIVATE_FRAMEWORKS = Preferences
UnlockChangerMFOK_LIBRARIES = applist

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/UnlockChangerMFOK.plist$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FlipLaunch.plist$(ECHO_END)
