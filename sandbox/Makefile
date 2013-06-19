#
#    Makefile for "coche" checks
#    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#============================================================================
#
#	Targets :
#		all		: make all programs
#		clean	: remove objects, interfaces and programs
#		checks	: run some tests
#
#============================================================================

#============================================================================
%.cmo               : %.ml
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

PROGS               = cpu_freq               \
                      file_gid               \
                      file_group             \
                      file_mode              \
                      file_uid               \
                      file_user              \
                      get_param_value        \
                      grep_first             \
                      hyperthreading         \
                      mem_size               \
                      phys_cores             \
                      swap_size              \
                      virtual_cores

ALL                 = $(PROGS)

OBJS                = lists.cmo              \
                      params.cmo

#============================================================================

all                 : $(ALL)

clean               :
				@ rm -f *.cmo *.cmi $(PROGS)

checks              : $(PROGS)
				@ echo "================ CHECKS ================"
				@ ./mem_size
				@ ./swap_size
				@ ./cpu_freq
				@ ./hyperthreading
				@ ./phys_cores
				@ ./virtual_cores
				@ ./file_uid
				@ ./file_uid   /toto
				@ ./file_uid   /etc
				@ ./file_uid   /etc/hosts
				@ ./file_gid 
				@ ./file_gid   /toto
				@ ./file_gid   /etc
				@ ./file_gid   /etc/hosts
				@ ./file_mode
				@ ./file_mode  /toto
				@ ./file_mode  /etc
				@ ./file_mode  /etc/hosts
				@ ./file_user
				@ ./file_user  /toto
				@ ./file_user  /etc
				@ ./file_user  /etc/hosts
				@ ./file_group 
				@ ./file_group /toto
				@ ./file_group /etc
				@ ./file_group /etc/hosts

params.cmo          : lists.cmo

cpu_freq.cmo        : params.cmo
file_gid.cmo        : params.cmo
file_group.cmo      : params.cmo
file_mode.cmo       : params.cmo
file_uid.cmo        : params.cmo
file_user.cmo       : params.cmo
get_param_value.cmo : params.cmo
grep_first.cmo      : params.cmo
hyperthreading.cmo  : params.cmo
mem_size.cmo        : params.cmo
phys_cores.cmo      : params.cmo
swap_size.cmo       : params.cmo
virtual_cores.cmo   : params.cmo
