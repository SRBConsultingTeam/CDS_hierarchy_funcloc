@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'hierarchy definition'

//The CDS DDL statement DEFINE HIERARCHY that can be used in the DDL source code
//editor of ADT defines a CDS hierarchy as a CDS entity that can be accessed in CDS views
//or ABAP SQL as a SQL hierarchy.
//https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/abencds_f1_define_hierarchy.htm

define hierarchy ZI_FuncLoc_Hierarchy

  with parameters
    @EndUserText.label: 'start with functional location'
    p_funcloc : abap.sstring(30)

  as parent child hierarchy(
    source ZI_FuncLoc_Tree

    child to parent association _tree
    start where
      FunctionalLocation = :p_funcloc

    siblings order by
      FunctionalLocation ascending

    //multiple parents allowed
    //depth 1
  )
{

      FunctionalLocation,
      FunctionalLocationLabelName,
      FunctionalLocationName,
      SuperiorFunctionalLocation
      
}
