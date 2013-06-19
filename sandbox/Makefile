#
#    Makefile for "coche" checks
#    ~~~~~~~~~~~~~~~~~~~~~~~~~~~

#============================================================================
%.cmo               : %.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

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

grep_first          : grep_first.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

get_param_value     : get_param_value.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

mem_size            : mem_size.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

swap_size           : swap_size.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

cpu_freq            : cpu_freq.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

hyperthreading      : hyperthreading.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

virtual_cores       : virtual_cores.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

phys_cores          : phys_cores.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

file_uid            : file_uid.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

file_gid            : file_gid.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

file_mode           : file_mode.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

file_user           : file_user.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

file_group          : file_group.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

