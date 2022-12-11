*&---------------------------------------------------------------------*
*& Report Z_CDS_HIER_IFLOT
*&---------------------------------------------------------------------*
*& example: use hierarchies in report
*&---------------------------------------------------------------------*
report z_select_funcloc_tree.

parameters: p_tplnr type tplnr.

*hierarchies from release 7.53 on
*The parent-child relation must be defined by a self-association which we call hierarchy association
*From a hierarchy source, that is a data source exposing a hierarchy association, an SQL hierarchy can be created

*sources:

*https://help.sap.com/doc/abapdocu_753_index_htm/7.53/en-US/abenselect_hierarchy_definition.htm

*http://sapabapcentral.blogspot.com/2021/12/working-with-hierarchies-in-abap-sql.html

write: 'select from hierarchy source and select from SQL hierarchy lead to the same result'.
write: /.

* select from hierarchy source
select from hierarchy( source ZI_Funcloc_Tree
                       child to parent association _tree
                       start where FunctionalLocation = @p_tplnr )
                       "multiple parents allowed
                       "depth 1 )
       fields *
       into table @data(lt_result1).

loop at lt_result1 into data(ls_result1).
  write: / ls_result1.
endloop.

write: /.

* select from hierarchy
select from ZI_FuncLoc_Hierarchy( p_funcloc = @p_tplnr )
       fields *
           into table @data(lt_result2).

loop at lt_result2 into data(ls_result2).
  write: / ls_result2.
endloop.
