## Ready to use kernel installation script by @AXON
## I strictly provide the rights to use this script with GearLock only.
## For proper developer documentation, visit https://supreme-gamers.com/gearlock
# Check `!zygote.sh` to configure your package functions or gearlock can also guide you during the build process.


#####--- Import Functions ---#####
get_base_dir # Returns execution directory path in $BD variable
# check_compat 6.8.8 # Returns yes in $COMPAT variable if the user is running at least 6.8 GearLock
#####--- Import Functions ---#####

# # # Do not allow GearLock versions below 6.8.8
# # # # if ! check_compat 6.8.8; then geco "+[!!!] Please update GearLock to install this"; exit 101; fi
# # test "$COMPAT" != "yes" && geco "\n[!!!] Please update GearLock to install this" && exit 101
#
# # Since GearLock 6.8 I decided to hold native installation scripts inside gearlock/core instead.
# # To overcome the issue of needing to repack kernel packages just to update their install/uninstall scripts.
# # It's recommended that you use native-scripts, but if you prefer to add your own functions then you may remove/mask this line.
# ## Load native scripts
# # rsync "$CORE/gxpm/kernel-native/uninstall.sh" "$CORE/gxpm/kernel-native/install.sh" "$BD" && exec "$BD/install.sh"


###
### Start of un-native installer script.
###

# Define variables
FIRMDIR="$SYSTEM_DIR/lib/firmware"
FIRMDIR_OLD="$FIRMDIR.old"
FIRMDIR_UPDATE="$FIRMDIR.update"
DALVIKDIR="/data/dalvik-cache"
PKG_KERNEL_IMAGE="$BD/kernel"
EFFECTIVE_FIRMDIR_PLACEHOLDER="effective-kernel"
GBSCRIPT[1]="$GBDIR/init/UpdateKernelFirmware"
GBSCRIPT[2]="$GBDIR/init/ClearDalvikForKernelUpdate"

# Define functions
handleError ()
{
    
    if [ $? != 0 ]; then
        # Revert back any incomplete changes
        test ! -e "$FIRMDIR" && test -e "$FIRMDIR_OLD" && mv "$FIRMDIR_OLD" "$FIRMDIR"
        geco "\n[!!!] Error: $1" && exit "${2:-101}"
    fi
    
}

make_gbscript_UpdateFirmware ()
{
    
cat << EOF > "${GBSCRIPT[1]}"

## Kernel firmware updater gearboot script for live system installation
#######################################################################

handleError ()
{
	test \$? != 0 && geco "\n++++ Error: \$1" && exit \${2:-101}
}

if [ -d "$FIRMDIR_UPDATE" ]; then
	geco "--+ Updating pending kernel firmware"
	if [ -e "$FIRMDIR_OLD" ]; then nout rm -r "$FIRMDIR_OLD"; handleError "Failed to cleanup firmware.old"; fi
	if [ -e "$FIRMDIR" ]; then mv "$FIRMDIR" "$FIRMDIR_OLD"; handleError "Failed to backup old firmware"; fi
	mv "$FIRMDIR_UPDATE" "$FIRMDIR"; handleError "Failed to install firmware update"
	write_gblog "Kernel Firmware Update Successful"
fi

rm "\$0" # Remove GBSCRIPT

EOF
    
}

make_gbscript_clearDalvik ()
{
    
cat << EOF > "${GBSCRIPT[2]}"

## Dalvik cache cleaning gearboot script for live system installation
######################################################################

test -d "$DALVIKDIR" && geco "--+ Clearing dalvik-cache, it may take a bit long on this bootup" && rm -rf "$DALVIKDIR"/*
rm "\$0"

EOF
    
}

doJob ()
{
    # Merge files
    gclone "$BD/system/" "$SYSTEM_DIR"; handleError "Failed to place files"
    
	# Install new kernel image
	kdir=$(ls "$BD"/system/lib/modules/*)
	kflavor=${kdir##*-}
    nout rsync "$PKG_KERNEL_IMAGE" "/boot/vmlinuz-$kflavor"; handleError "Failed to update kernel image"
	mkinitfs "${kdir##*/}"
	grub-mkconfig -o /boot/grub/grub.cfg
    
    # Cleanup package firmware before uninstallation script generation (GEN_UNINS)
    test -d "$BD$FIRMDIR" && rm -r "$BD$FIRMDIR"
    
}


# Warning info for installation from GUI to avoid system crash
test "$BOOTCOMP" == "yes" && geco "[!!!] You seem to be installing from a live system, best practice is to install from RECOVERY-MODE.\n"

# Check if /system is writable
! touch -c "$SYSTEM_DIR/lib" >/dev/null 2>&1 && geco "[!!!] $SYSTEM_DIR is not writable, did you ${PINK}SuperCharge${RC} it yet ?" && exit 101

# Main Loop
if [ -d "$BD$FIRMDIR" ]; then
    geco "This kernel package also provides additional firmware."
    while true
    do
        read -rn1 -p "$(geco "Do you want to replace system firmware with the ${BLUE}firmware${RC} provided by this kernel package? [${GREEN}Y${RC}/n]") " i
        case $i in
            
            [Yy] ) geco "\n\n+ Placing the kernel module and firmware files into your system"
                
                if [ "$TERMINAL_EMULATOR" == "yes" ]; then
                    make_gbscript_UpdateFirmware; mv "${BD}${FIRMDIR}" "${BD}${FIRMDIR_UPDATE}"; handleError "Failed to rename package firmware to firmware.update"
                    echo "${NAME}_${VERSION}" > "${BD}${FIRMDIR_UPDATE}/${EFFECTIVE_FIRMDIR_PLACEHOLDER}"; doJob; break
                else
                    if [ -e "$FIRMDIR_OLD" ]; then
                        nout rm -r "$FIRMDIR_OLD"; handleError "Failed to cleanup firmware.old"
                    fi
                    if [ -e "$FIRMDIR" ]; then
                        mv "$FIRMDIR" "$FIRMDIR_OLD"; handleError "Failed to backup old firmware"
                    fi
                    doJob; echo "${NAME}_${VERSION}" > "${FIRMDIR}/${EFFECTIVE_FIRMDIR_PLACEHOLDER}"; break
                fi
                
            ;;
            
            [Nn] ) geco "\n\n+ Placing the kernel module files into your system"
                
                rm -f "${GBSCRIPT[1]}" "${GBSCRIPT[2]}"
                rm -rf "${BD}${FIRMDIR}"; handleError "Failed to cleanup package firmware"; doJob; break
                
            ;;
            
            *) geco "\n- Enter either ${GREEN}Y${RC}es or no"
                
            ;;
            
        esac
    done
else
    rm -f "${GBSCRIPT[1]}" "${GBSCRIPT[2]}"
    geco "\n+ Placing the kernel module files into your system" && doJob
fi

# Clear dalvik-cache
if test "$TERMINAL_EMULATOR" == "no" && test -d "$DALVIKDIR"; then
    geco "\n+ Clearing dalvik-cache, it may take a bit long on your next boot" && rm -rf "$DALVIKDIR"/*
    elif test "$TERMINAL_EMULATOR" == "yes" && test -d "$DALVIKDIR"; then
    make_gbscript_clearDalvik
fi
