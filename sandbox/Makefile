
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

disp_list.cmi       : disp_list.mli
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

disp_list.cmo       : disp_list.ml disp_list.cmi
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

str_split.cmo       : str_split.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

str_split           : str_split.cmo disp_list.cmi disp_list.cmo
				@ echo "$@"
				$(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) disp_list.cmo str_split.cmo
				@ echo

string_after.cmo    : string_after.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

string_after        : string_after.cmo
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $<
				@ echo

param_str_value.cmo : param_str_value.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

param_str_value     : param_str_value.cmo
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) disp_list.cmo $<
				@ echo

param.cmo           : param.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

param               : param.cmo
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -o $@ $(LIBS_CMA) $<
				@ echo

grep.cmo            : grep.ml
				@ echo "$@"
				@ $(OCAMLC) $(OCAML_OPTS) -c $<
				@ echo

grep                : grep.cmo
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

