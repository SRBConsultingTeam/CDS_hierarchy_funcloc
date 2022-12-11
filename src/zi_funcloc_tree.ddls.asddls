@AbapCatalog.sqlViewName: 'ZIFUNCLOCTREE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'hierarchy composite view'
@VDM.viewType: #COMPOSITE

//hierarchy source is a CDS view that exposes a hierarchy association

define view ZI_FuncLoc_Tree as select from I_FunctionalLocation

  //self association
  association [1..1] to ZI_FuncLoc_Tree as _tree  on  $projection.SuperiorFunctionalLocation = _tree.FunctionalLocation

{
      _tree, // make tree public

  key FunctionalLocation,
      _FunctionalLocationLabel.FunctionalLocationLabelName,
      I_FunctionalLocation._FunctionalLocationText.FunctionalLocationName,
      SuperiorFunctionalLocation

}
