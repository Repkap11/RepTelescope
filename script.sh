for n in `seq 1 1 10`
do
	echo Capture $n
	gphoto2 --delete-all-files -R
	# sleep 1
	gphoto2 --set-config shutterspeed=53
	# sleep 1
	gphoto2 --set-config bulb=1 --wait-event=120s --set-config bulb=0
	sleep 1
	gphoto2 --filename=light-$(date +"%H-%M-%S").nef --get-all-files --skip-existing
	sleep 1
done