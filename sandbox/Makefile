
OCAMLC              = ocamlc
#OCAML_OPTS         = -g -i
OCAML_OPTS          = 

LIBS_CMA            = str.cma

OBJETS              = get_param_value.cmo

INTERFACES          = get_param_value.cmi

PROGS               = grep_first             \
                      get_param_value        \
                      mem_size

ALL                 = $(OBJETS)              \
                      $(INTERFACES)          \
                      $(PROGS)

#============================================================================

all                 : $(ALL)

grep_first.cmo      : grep_first.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

grep_first          : grep_first.cmo
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $<
				@ echo

get_param_value.cmo : get_param_value.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

get_param_value     : get_param_value.cmo
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $<
				@ echo

mem_size.cmo        : mem_size.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

mem_size            : mem_size.cmo
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $<
				@ echo

