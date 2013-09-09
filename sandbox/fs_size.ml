(* filesystem size :
 * df -P | grep $(grep $MOUNT_POINT /proc/mounts  | awk '{ print $1}') | awk '{ print $2 }'
 *)
