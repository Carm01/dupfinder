#include <Array.au3>

Global $aArray[10] = [1,1,2,3,3,3,3,4,5,5]
Global $aRes = Example( $aArray )
_ArrayDisplay( $aRes )


Global $iItems = 1000
ReDim $aArray[$iItems]
For $i = 0 To $iItems - 1 Step 2
  $aArray[$i] = $i/2
  $aArray[$i+1] = $i/2
Next
_ArrayDisplay( $aArray )
$aRes = Example( $aArray )
_ArrayDisplay( $aRes )


Func Example( $aArray )
  Local $oTst = ObjCreate( "Scripting.Dictionary" )
  Local $oRes = ObjCreate( "Scripting.Dictionary" )

  For $i = 0 To UBound( $aArray ) - 1
    If Not $oTst.Exists( $aArray[$i] ) Then
      $oTst( $aArray[$i] ) = 1
    ElseIf Not $oRes.Exists( $aArray[$i] ) Then
      $oRes( $aArray[$i] ) = 1
    EndIf
  Next

  Return $oRes.Keys()
EndFunc
