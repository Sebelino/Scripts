# Copies the initramfs and kernel to the EFI partition. Should be performed after each
# pacman -Syu in order to avoid system failure.

cp /boot/initramfs-linux.img /boot/efi/EFI/arch/initramfs-arch.img
cp /boot/initramfs-linux-fallback.img /boot/efi/EFI/arch/initramfs-arch-fallback.img
cp /boot/vmlinuz-linux /boot/efi/EFI/arch/vmlinuz-arch.efi
