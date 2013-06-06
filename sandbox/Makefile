
OCAMLC              = ocamlc
OCAML_OPTS          = 

LIBS_CMA            = str.cma

OBJETS              = get_param_value.cmo    \
                      lists.cmo              \
                      params.cmo

INTERFACES          = get_param_value.cmi

PROGS               = grep_first             \
                      get_param_value        \
                      mem_size               \
                      swap_size              \
                      cpu_freq

ALL                 = $(PROGS)

OBJS                = lists.cmo              \
                      params.cmo

#============================================================================

all                 : $(ALL)

grep_first.cmo      : grep_first.ml
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

