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

/*
The distance between Big Ben in London(51.5007° N, 0.1246° W)and The Statue of Liberty in
New York(40.6892° N, 74.0445° W)is 5574.8 km. This is not the exact measurement because the
formula assumes that the Earth is a perfect sphere when in fact it is an oblate spheroid.
*/


$result:=$math.roundDecimal(1.222;0.1;"ROUND_UP")

$test:=New AJ_Tools_UT_describe ("acos";Current method name:C684;"Test Math formula")
$test.given:=" the arccos of 2 is 0"
$test.should:="return 0"
$test.expected:=0
$test.actual:=$math.acos(2)
$test.assert()

$test:=New AJ_Tools_UT_describe ("acos";Current method name:C684;"Test Math formula")
$test.given:=" the arccos of -2 is 0"
$test.should:="return 0"
$test.expected:=0
$test.actual:=$math.acos(-2)
$test.assert()

$test:=New AJ_Tools_UT_describe ("atan2";Current method name:C684;"Test Math formula")
$test.given:="atan2(90, 15) return 1.40564764938"
$test.should:="return 1.40564764938"
$test.expected:=1.40564764938
$test.actual:=$math.atan2(90;15)
$test.assert()

$test:=New AJ_Tools_UT_describe ("atan2";Current method name:C684;"Test Math formula")
$test.given:="atan2(15, 90) return 0.1651486774146"
$test.should:="return 0.1651486774146"
$test.expected:=0.1651486774146
$test.actual:=$math.atan2(15;90)
$test.assert()

$test:=New AJ_Tools_UT_describe ("atan2";Current method name:C684;"Test Math formula")
$test.given:="atan2(0,0) return 0"
$test.should:="return 0"
$test.expected:=0
$test.actual:=$math.atan2(0;0)
$test.assert()

$test:=New AJ_Tools_UT_describe ("atan2";Current method name:C684;"Test Math formula")
$test.given:="atan2(1,2) return 0.4636476090008"
$test.should:="return 0.4636476090008"
$test.expected:=0.4636476090008
$test.actual:=$math.atan2(1;2)
$test.assert()

$test:=New AJ_Tools_UT_describe ("toDegrees";Current method name:C684;"Test Math formula")
$test.given:="0.7853981633975 radians equal 45 degrees"
$test.should:="return 45"
$test.expected:=45
$test.actual:=$math.toDegrees(0.7853981633975)
$test.assert()

$test:=New AJ_Tools_UT_describe ("toRadians";Current method name:C684;"Test Math formula")
$test.given:="45 degrees equal 0.7853981633975 radian"
$test.should:="return 0.7853981633975"
$test.expected:=0.7853981633975
$test.actual:=$math.toRadians(45)
$test.assert()

$test:=New AJ_Tools_UT_describe ("acos";Current method name:C684;"Test Math formula")
$test.given:=" the arccos of 0.866 is 0.5236495809318 in radian"
$test.should:="return 0.5236495809318"
$test.expected:=0.5236495809318
$test.actual:=$math.acos(0.866)
$test.assert()

$test:=New AJ_Tools_UT_describe ("asin";Current method name:C684;"Test Math formula")
$test.given:=" the arcsine of 0.5 is 0.5235987755983 radian"
$test.should:="return 0.5235987755983"
$test.expected:=0.5235987755983
$test.actual:=$math.asin(0.5)
$test.assert()

$test:=New AJ_Tools_UT_describe ("asin";Current method name:C684;"Test Math formula")
$test.given:=" the arcsine of 0.95 is 1.253235897503"
$test.should:="return 1.253235897503"
$test.expected:=1.253235897503
$test.actual:=$math.asin(0.95)
$test.assert()

  // between 
$test:=New AJ_Tools_UT_describe ("spherodistance";Current method name:C684;"Test Math formula")
$test.given:="no Radius parameter set local"  //59.3293371,13.4877472,59.3225525,13.461942
$test.should:="return 1.646803375856 km"  //1.6 km // 2.961711431589
$test.expected:=1.646803375856
$test.actual:=$math.spherodistance(New object:C1471("latitude1";59.3293371;"longitude1";13.4877472;"latitude2";59.3225525;"longitude2";13.461942))
$test.assert()

  // between BigBen London and statue of Liberty New york
$test:=New AJ_Tools_UT_describe ("spherodistance";Current method name:C684;"Test Math formula")
$test.given:="no Radius parameter set"
$test.should:="return 5567.660292921 km"  //5567.660292921
$test.expected:=5567.660292921
$test.actual:=$math.spherodistance(New object:C1471("latitude1";51.5007;"longitude1";-0.1246;"latitude2";40.6892;"longitude2";-73.935242))
$test.assert()

  // between Milan and statue of Liberty New york
$test:=New AJ_Tools_UT_describe ("spherodistance";Current method name:C684;"Test Math formula")
$test.given:="no Radius parameter set"
$test.should:="return 5149.995533938 km"  //5149.995533938
$test.expected:=5149.995533938
$test.actual:=$math.spherodistance(New object:C1471("latitude1";45.46427;"longitude1";9.18951;"latitude2";40.6892;"longitude2";74.0445))
$test.assert()

  // between Geneva and Washington
$test:=New AJ_Tools_UT_describe ("spherodistance";Current method name:C684;"Test Math formula")
$test.given:="no Radius parameter set"
$test.should:="return 5637.518685164km"  //5637.518685164
$test.expected:=5637.518685164
$test.actual:=$math.spherodistance(New object:C1471("latitude1";46.12;"longitude1";6.9;"latitude2";38.53;"longitude2";77.02))
$test.assert()

  //
$test:=New AJ_Tools_UT_describe ("spherodistance";Current method name:C684;"Test Math formula")
$test.given:="distance with radius parameter set to 1000 km"
$test.should:="return 1601.723467947 km"
$test.expected:=1601.723467947
$test.actual:=$math.spherodistance(New object:C1471("latitude1";-50.81;"longitude1";10.35;"latitude2";40.98;"longitude2";-80.53;"radius";1000))
$test.assert()

$test:=New AJ_Tools_UT_describe ("spherodistance";Current method name:C684;"Test Math formula")
$test.given:="distance with no radius parameter"
$test.should:="return 13458.79337831 km"
$test.expected:=13458.79337831
$test.actual:=$math.spherodistance(New object:C1471("latitude1";-50.81;"longitude1";10.35;"latitude2";40.98;"longitude2";-80.53))
$test.assert()