
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
                      file_mode

ALL                 = $(PROGS)

OBJS                = lists.cmo              \
                      params.cmo

#============================================================================

all                 : $(ALL)

clean               :
				@ rm -f *.cmo *.cmi
				@ rm -f $(PROGS)

grep_first.cmo      : grep_first.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

grep_first          : grep_first.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

get_param_value.cmo : get_param_value.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

get_param_value     : get_param_value.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

lists.cmo           : lists.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

params.cmo          : params.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

mem_size.cmo        : mem_size.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

mem_size            : mem_size.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

swap_size.cmo       : swap_size.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

swap_size           : swap_size.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

cpu_freq.cmo        : cpu_freq.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

cpu_freq            : cpu_freq.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

hyperthreading.cmo  : hyperthreading.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

hyperthreading      : hyperthreading.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

virtual_cores.cmo   : virtual_cores.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

virtual_cores       : virtual_cores.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

phys_cores.cmo      : phys_cores.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

phys_cores          : phys_cores.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

file_uid.cmo        : file_uid.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

file_uid            : file_uid.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

file_mode.cmo       : file_mode.ml $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<

file_mode           : file_mode.cmo $(OBJS)
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $(OBJS) $<

