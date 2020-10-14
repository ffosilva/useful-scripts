#!/bin/bash

vboxmanage modifyvm $1 --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff
vboxmanage setextradata $1 "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
vboxmanage setextradata $1 "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
vboxmanage setextradata $1 "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-2BD1B31983FE1663"
VBoxManage setextradata $1 "VBoxInternal/Devices/efi/0/Config/DmiSystemSerial" "W82NTXZWG3QP"
vboxmanage setextradata $1 "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
vboxmanage setextradata $1 "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
