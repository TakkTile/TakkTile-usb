RED='\033[0;31m' &&
GREEN='\033[0;32m' &&
YELLOW='\033[0;33m' &&
NC='\033[0m' && # No Color
failMessage="${RED}\n\nFAILED\n###############################################\n\n\n${NC}"


printf "${YELLOW}###############################################\n"
printf "ERASING CHIP ...\n"
printf "###############################################${NC}\n"
avrdude -p x32a4 -c avrispmkII -e || printf $failMessage

printf "${YELLOW}###############################################\n"
printf "UPLOADING FUSE BITS\n"
printf "###############################################\n${NC}"
avrdude -p x32a4 -c avrispmkII -U fuse2:w:0xBF:m || printf $failMessage

printf "${YELLOW}###############################################\n"
printf "UPLOADING BOOTLOADER\n"
printf "###############################################\n${NC}"
avrdude -p x32a4 -c avrispmkII -U boot:w:bootmemory.hex || printf $failMessage

printf "${YELLOW}###############################################\n"
printf "UPLOADING FLASH MEMORY PROGRAM\n"
printf "###############################################\n${NC}"
avrdude -p x32a4 -c avrispmkII -U flash:w:flashmemory.hex

