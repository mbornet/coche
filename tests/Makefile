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

#LIBS_CMA            = str.cma                \
#                      unix.cma

#INTERFACES          = get_param_value.cmi

PROGS               = check_prgms			 \
				 sort				 \
				 power				 \
				 exp

ALL                 = $(PROGS)

OBJS                = lists.cmo

#============================================================================

all                 : $(OBJS) $(ALL)

clean               :
				@ rm -f *.cmo *.cmi $(PROGS)

clean_objs          :
				@ rm -f *.cmo *.cmi


check_prgms.cmo     : lists.cmo
sort.cmo			: lists.cmo
power.cmo			:
exp.cmo			:
t001_last.cmo       :
t003_kth_elt.cmo	:
t004_list_sz.cmo    :
