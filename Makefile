ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BrickFix
BrickFix_FILES = Tweak.xm
BrickFix_CFLAGS = -fobjc-arc
BrickFix_PRIVATE_FRAMEWORKS = IMCore

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
