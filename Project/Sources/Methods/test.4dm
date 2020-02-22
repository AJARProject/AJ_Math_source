//%attributes = {}
  // Is it really needed ?

C_OBJECT:C1216($math)
$math:=Math ()
C_OBJECT:C1216($test)
$test:=New AJ_Tools_UT_describe ("imul";Current method name:C684;"Test Math formula")

$test.given:="multiply -MAXLONG with 125"
$test.should:="return -2147483523"
$test.expected:=-2147483523
$test.actual:=$math.imul(2147483647;-125)
$test.assert()

$test.given:="multiply 0x7FFFFFFF with 0x7FFFFFFF"
$test.should:="return 1"
$test.expected:=1
$test.actual:=$math.imul(0x7FFFFFFF;0x7FFFFFFF)
$test.assert()


