(* filesystem size :
 * df -P | grep $(grep /home /proc/mounts  | awk '{ print $1}') | awk '{ print $2 }'
 *)
