RAWS=$(find . -name "*.nef")
RAWS=$(echo "${RAWS}")
# echo RAWS:"$RAWS"

echo Starting...
echo
parallel --bar --nice 9 -j$(nproc) -d "\n" '\
raw=$(echo {} ) ;
tif=$(echo $raw | sed -s "s#.nef#.tif#" | sed -s "s#/raw/#/tif/#") ;
test -f "$tif" || darktable-cli "$raw" "$tif" --core --conf plugins/imageio/format/tiff/bpp=16 --configdir temp/{%}
' ::: "${RAWS}"

