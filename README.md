# CDS_hierarchy_funcloc
ABAP CDS hierarchy select example with functional locations

Hierarchies can be used to select tree-like data structures like it is the case with functional locations in SAP. (the structure in this case is represented by the field IFLOT-TPLMA)

This example includes 2 CDS views:
- ZI_FuncLoc_Tree (hierarchy source view with self association)
- ZI_FuncLoc_Hierarchy (hierachy definition - parent/child)

and an example ABAP report to test these views and show different possibilities: Z_SELECT_FUNCLOC_TREE
