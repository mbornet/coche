#
#    Makefile for "coche" checks
#    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#============================================================================
#
#	Targets :
#		all		     : make all programs
#		clean	     : remove objects, interfaces and programs
#		clean_objs	: remove objects, interfaces, keep programs
#		checks	     : run some tests
#
#============================================================================

#============================================================================
%.cmo               : %.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

%.cmi               : %.mli
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

%                   : %.cmo
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

#============================================================================
OCAMLC              = ocamlc
OCAML_OPTS          = 

LIBS_CMA            = str.cma                \
                      unix.cma

INTERFACES          = get_param_value.cmi

PROGS               = bcast                  \
                      cpu_freq               \
                      cpu_max_freq           \
                      dev_size               \
                      distrib                \
                      file_gid               \
                      file_group             \
                      file_mode              \
                      file_uid               \
                      file_user              \
                      get_field              \
                      get_param_value        \
                      grep_first             \
                      hostname               \
                      hyperthreading         \
                      ip                     \
                      kernel_version         \
                      mac                    \
                      make_list              \
                      mask                   \
                      match                  \
                      mem_size               \
                      mount                  \
                      phys_cores             \
                      pkglist                \
                      system_name            \
                      system_type            \
                      swap_size              \
                      virtual_cores

ALL                 = $(PROGS)

OBJS                = lists.cmo              \
                      params.cmo             \
                      proc.cmo

#============================================================================

all                 : $(OBJS) $(ALL)

help								: usage
usage								:
				@ echo "Usage: make [usage|all|clean|clean_objs|checks]"

clean               :
				@ rm -f *.cmo *.cmi $(PROGS)

clean_objs          :
				@ rm -f *.cmo *.cmi

ETH                 = eth0

checks              : $(PROGS)
				@ echo "================ CHECKS ================"
				@ ./hostname
				@ ./system_name
				@ ./system_type
				@ ./kernel_version
				@ ./mem_size
				@ ./swap_size
				@ ./cpu_freq
				@ ./cpu_max_freq
				@ ./hyperthreading
				@ ./phys_cores
				@ ./virtual_cores
				@ echo
				@ ./file_uid
				@ ./file_uid   /toto
				@ ./file_uid   /etc
				@ ./file_uid   /etc/hosts
				@ echo
				@ ./file_gid 
				@ ./file_gid   /toto
				@ ./file_gid   /etc
				@ ./file_gid   /etc/hosts
				@ echo
				@ ./file_mode
				@ ./file_mode  /toto
				@ ./file_mode  /etc
				@ ./file_mode  /etc/hosts
				@ echo
				@ ./file_user
				@ ./file_user  /toto
				@ ./file_user  /etc
				@ ./file_user  /etc/hosts
				@ echo
				@ ./file_group 
				@ ./file_group /toto
				@ ./file_group /etc
				@ ./file_group /etc/hosts
				@ echo
				@ ./ip $(ETH)
				@ ./bcast $(ETH)
				@ ./mask $(ETH)
				@ ./mac $(ETH)
				@ echo
				@ ./dev_size /dev/sda1


bcast.cmo           : params.cmo
cpu_freq.cmo        : params.cmo
cpu_max_freq.cmo    : params.cmo
dev_size.cmo        :
distrib.cmo         : params.cmo
file_gid.cmo        : params.cmo
file_group.cmo      : params.cmo
file_mode.cmo       : params.cmo
file_uid.cmo        : params.cmo
file_user.cmo       : params.cmo
get_param_value.cmo : params.cmo
grep_first.cmo      : params.cmo
hostname.cmo        : 
hyperthreading.cmo  : params.cmo
ip.cmo              : params.cmo
kernel_version.cmo  : params.cmo
lists.cmo           : lists.cmi
mac.cmo             : params.cmo
make_list.cmo       : params.cmo
mask.cmo            : params.cmo
match.cmo           : params.cmo
mem_size.cmo        : params.cmo
mount.cmo           : mount.cmi params.cmo lists.cmo
params.cmo          : params.cmi lists.cmo
phys_cores.cmo      : params.cmo
pkglist.cmo         : params.cmo
proc.cmo            : proc.cmi
swap_size.cmo       : params.cmo
system_name.cmo     : 
system_type.cmo     : params.cmo
virtual_cores.cmo   : params.cmo

get_field.cmo       : params.cmo
