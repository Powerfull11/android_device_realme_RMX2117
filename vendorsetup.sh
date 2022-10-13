#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="RMX2117"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	# Configure some default settings for the build
	export ALLOW_MISSING_DEPENDENCIES=true
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
	export OF_VANILLA_BUILD=1
	export OF_SKIP_ORANGEFOX_PROCESS=1
	export OF_SUPPORT_OZIP_DECRYPTION=1
	export FOX_USE_BASH_SHELL=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export LC_ALL="C"
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_PATCH_AVB20=1
        export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/recovery"

	# Some device specific flags
	export OF_STATUS_H="102"
	export OF_STATUS_INDENT_LEFT="155"
	export OF_STATUS_INDENT_RIGHT="48"
	export OF_SCREEN_H="2400"
	export OF_TWRP_COMPATIBILITY_MODE=1
	export OF_FL_PATH1="/system/flashlight"
	export OF_FL_PATH2=""
	export OF_FLASHLIGHT_ENABLE=1
	export OF_MAINTAINER="Powerfull11"
	export OF_TARGET_DEVICES="RMX2117, RMX2111, RMX2117L1, RMX2111CN, RMX2117IN"
	export TARGET_DEVICE_ALT="RMX2117, RMX2111"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

	# Some Extra Vars
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_GREP_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_TAR_BINARY=1
	export OF_QUICK_BACKUP_LIST="/super;/boot;/dtbo;/vbmeta;/vbmeta_system;/vbmeta_vendor;/data"
	export OF_USE_TWRP_SAR_DETECT=1
	export OF_CHECK_OVERWRITE_ATTEMPTS=1
	export OF_HIDE_NOTCH=1
	export OF_USE_GREEN_LED=0
	export OF_SUPPORT_PRE_FLASH_SCRIPT=1
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_ALLOW_DISABLE_NAVBAR=0
	export FOX_ENABLE_APP_MANAGER=1

	#R11
	export FOX_R11=1
	export FOX_VERSION="R11.1_1"
	export FOX_BUILD_TYPE="Stable"
	export FOX_VARIANT="RUI2.0"

	# maximum permissible splash image size (in kilobytes); do *NOT* increase!
	export OF_SPLASH_MAX_SIZE="104"

	# run a process after formatting data to work-around MTP issues
	export OF_RUN_POST_FORMAT_PROCESS=1

	# Custom pic for the maintainer's info in about section
	export OF_MAINTAINER_AVATAR="$PWD/device/realme/RMX2117/maintainer.png"

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
	  export | grep "FOX" >> $FOX_BUILD_LOG_FILE
	  export | grep "OF_" >> $FOX_BUILD_LOG_FILE
	  export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
	  export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi
