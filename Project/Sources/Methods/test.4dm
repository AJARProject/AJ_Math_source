//%attributes = {}
  // Is it really needed ?

C_OBJECT:C1216($math)
$math:=Math ()
C_OBJECT:C1216($test)
  //$test:=New AJ_Tools_UT_describe ("imul";Current method name;"Test Math formula")

  //$test.given:="multiply -MAXLONG with 125"
  //$test.should:="return -2147483523"
  //$test.expected:=-2147483523
  //$test.actual:=$math.imul(2147483647;-125)
  //$test.assert()

  //$test.given:="multiply 0x7FFFFFFF with 0x7FFFFFFF"
  //$test.should:="return 1"
  //$test.expected:=1
  //$test.actual:=$math.imul(0x7FFFFFFF;0x7FFFFFFF)
  //$test.assert()


$test:=New AJ_Tools_UT_describe ("spherodistance";Current method name:C684;"Test Math formula")
$test.given:="distance with radius parameter set to 1000 km"
$test.should:="return 1601.723467947 km"
$test.expected:=1601.723467947
$test.actual:=$math.spherodistance(New object:C1471("longitude1";-50.81;"latitude1";10.35;"longitude2";40.98;"latitude2";-80.53;"radius";1000))
$test.assert()

$test:=New AJ_Tools_UT_describe ("spherodistance";Current method name:C684;"Test Math formula")
$test.given:="distance with no radius parameter"
$test.should:="return 10204.58021429 km"
$test.expected:=10204.58021429
$test.actual:=$math.spherodistance(New object:C1471("longitude1";-50.81;"latitude1";10.35;"longitude2";40.98;"latitude2";-80.53))
$test.assert()