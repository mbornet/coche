#
#    Makefile for "coche" checks
#    ~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

OBJETS              = get_param_value.cmo    \
                      lists.cmo              \
                      params.cmo

INTERFACES          = get_param_value.cmi

PROGS               = grep_first             \
                      get_param_value        \
                      mem_size               \
                      swap_size              \
                      cpu_freq               \
                      hyperthreading         \
                      virtual_cores          \
                      phys_cores             \
                      file_uid               \
                      file_gid               \
                      file_mode

ALL                 = $(PROGS)

OBJS                = lists.cmo              \
                      params.cmo

#============================================================================

all                 : $(ALL)

clean               :
				@ rm -f *.cmo *.cmi
				@ rm -f $(PROGS)

params.cmo          : lists.cmo

grep_first.cmo      : params.cmo
grep_first          : grep_first.cmo

get_param_value.cmo : params.cmo
get_param_value     : get_param_value.cmo

mem_size.cmo        : params.cmo
mem_size            : mem_size.cmo

swap_size.cmo       : params.cmo
swap_size           : swap_size.cmo

cpu_freq.cmo        : params.cmo
cpu_freq            : cpu_freq.cmo

hyperthreading.cmo  : params.cmo
hyperthreading      : hyperthreading.cmo

virtual_cores.cmo   : params.cmo
virtual_cores       : virtual_cores.cmo

phys_cores.cmo      : params.cmo
phys_cores          : phys_cores.cmo

file_uid.cmo        : params.cmo
file_uid            : file_uid.cmo

file_gid            : params.cmo
file_gid            : file_gid.cmo

file_mode.cmo       : params.cmo
file_mode           : file_mode.cmo

file_user.cmo       : params.cmo
file_user           : file_user.cmo

file_group.cmo      : params.cmo
file_group          : file_group.cmo

