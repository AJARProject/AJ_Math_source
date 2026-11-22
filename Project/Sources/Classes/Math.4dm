Class constructor
	This.E:=2.718281828459
	This.LN2:=0.6931471805599
	This.PI:=3.14159265359
	This.LN10:=2.302585092994
	This.LOG10E:=0.4342944819033
	This.LOG2E:=1.442695040889
	This.PI:=3.14159265359
	This.SQRT2:=1.414213562373
	This.SQRT1_2:=0.7071067811865
	This.Degree:=0.01745329251994
	This.Radian:=57.29577951308
	This.NaN:=Log(-1)
	This.POSITIVE_INFINITY:=1/0
	This.NEGATIVE_INFINITY:=-1/0
	
	
Function abs($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs
	
	If (Count parameters=1)
		$return:=Abs($1)
	Else 
		$return:=This.NaN
	End if 
	
	
Function acos($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acos
	
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		
		If ($value>1) | ($value<-1)
			$result:=This.NaN
		Else 
			
			Case of 
				: ($value=0)  // évitons une division par zéro
					$result:=This.PI/2
					
				: ($value<0)
					// Question? Le code dans le if et le else est le meme? je ne comprend pas ce test
					// Et PI est toujours <4... ???
					If (This.PI>4)  // Correction d'un bug 4D sur la valeur de Pi dans certaines conditions.
						$result:=This.PI-This.atan(This.sqrt(1-This.pow($value;2))/This.abs($value))
					Else 
						$result:=This.PI-This.atan(This.sqrt(1-This.pow($value;2))/This.abs($value))
					End if 
					
				: ($value>0)
					$result:=This.atan(This.sqrt(1-This.pow($value;2))/$value)
			End case 
			
		End if 
		
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function acosh($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh
	
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=This.log($value+This.sqrt(($value*($value))-1))
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function asin($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asin
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		If ($value>1) | ($value<-1)
			$result:=This.NaN
		Else 
			If ($value=1)
				$result:=This.PI/2
			Else 
				$result:=This.atan($value/(This.sqrt(1-This.pow($value;2))))  // result in radian
			End if 
		End if 
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function asinh($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=This.log($value+This.sqrt(($value*($value))+1))
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function atan($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan
	var $result; $value : Real
	
	If (Count parameters=1)
		$result:=Arctan($1)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function atan2($param1 : Real; $param2 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan2
	
	var $result; $y; $x : Real
	$y:=$1
	$x:=$2
	
	If (Count parameters=2)
		
		Case of 
			: ($x>0)
				$result:=This.atan($y/$x)
			: ($x<0) & ($y>=0)
				$result:=This.atan($y/$x)+This.PI
			: ($x<0) & ($y<0)
				$result:=This.atan($y/$x)-This.PI
			: ($x=0) & ($y>0)
				$result:=(This.PI/2)
			: ($x=0) & ($y<0)
				$result:=-(This.PI/2)
			: ($x=0) & ($y=0)
				$result:=0
			Else 
				$result:=This.NaN
		End case 
		
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function atanh($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atanh
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Log((1+$value)/(1-($value)))/2
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function cbrt($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		
		If ($value<0)
			$result:=-(-$value^(1/3))  // ensure negative numbers remain negative:
		Else 
			$result:=$value^(1/3)
		End if 
		
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function ceil($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=-Int(-$value)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function clz32($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Position("1";LongInt2BinaryString($value);1)-1
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function cos($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cos
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Cos($value)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function cosh($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cosh
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=(Exp($value)+Exp(-$value))/2
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function exp($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/exp
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Exp($value)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function expm1($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Exp($value)-1
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function floor($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Int($value)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function hypot(... : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot
	//C_REAL($0;$result)
	//C_REAL(${1})
	var $result : Real
	
	If (Count parameters>0)
		$sum:=0
		For ($i;1;Count parameters)
			$sum:=$sum+(${$i}^2)
		End for 
		$result:=This.sqrt($sum)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function imul($param1 : Integer; $param2 : Integer) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul
	var $result : Real
	
	If (Count parameters=1)
		$result:=$1*$2
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function log($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
	
	var $result; $value : Real
	If (Count parameters=1)
		$value:=$1
		$result:=Log($value)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
Function log10($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Log($value)*This.LOG10E
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function log1p($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log1p
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=This.log(1+$value)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function log2($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$return:=Log($value)*This.LOG2E
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function max($param1 : Collection) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max
	$return:=$1.max()
	
Function min($param1 : Collection) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min
	$return:=$1.min()
	
	
Function pow($param1 : Real; $param2 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow
	var $result : Real
	
	If (Count parameters=2)
		$result:=$1^$2
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function random -> $return : Integer
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
	$return:=Random/MAXINT
	
	
Function round($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		If ($value<0)
			$result:=Round($value+0.01;0)
		Else 
			$result:=Round($value;0)
		End if 
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
	
Function sign($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		Case of 
			: ($value>0)
				$result:=1
			: ($value=0)
				$result:=0
			: ($value<0)
				$result:=-1
			Else 
				$result:=This.NaN
		End case 
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function sin($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sin
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Sin(($value))
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function sinh($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sinh
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$y:=This.exp($value)
		$result:=($y-(1/$y))/2
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function sqrt($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Square root($value)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function tan($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tan
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$result:=Tan($value)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
	
Function tanh($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tanh
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$a:=This.exp($value)
		$b:=This.exp(-$value)
		$result:=($a-$b)/($a+$b)
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
Function toRadians($param1 : Real) -> $return : Real
	If (Count parameters=1)
		$return:=$1*This.PI/180
	Else 
		$result:=0
	End if 
	
Function toDegrees($param1 : Real) -> $return : Real
	If (Count parameters=1)
		$return:=$1*180/This.PI
	Else 
		$result:=0
	End if 
	
Function trunc($param1 : Real) -> $return : Real
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc
	var $result; $value : Real
	
	If (Count parameters=1)
		$value:=$1
		$str:=String($value)
		GET SYSTEM FORMAT(Decimal separator;$vDecSep)
		$result:=Num(Substring($str;1;Position($vDecSep;$str)-1))
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
Function roundDecimal($param1 : Real; $param2 : Real; $param3 : Text) -> $return : Real
	// roundDecimal ( $valueToRound ; $precision ; $roundType ) -> return $valueRounded
	//
	// $valueToRound : (real) value to be rounded
	// $precision : (real) precision of the rounding
	// $roundType : (text) type of rounding
	// $valueRounded : (real) (return) value rounded
	//
	// Return a rounded value based on the given options
	
	If (False)
		// ----------------------------------------------------
		// User name (OS): gabriel inzirillo
		// Date and time: 23.01.19, 11:26:55
		// ----------------------------------------------------
		// Method: AJ_Tools_RoundDecimal
		// Description
		// This method can be used to round a value.
		// $precision : The precision of the value that we want to round. Ex. 0.1, 0.5, 2, 0.01
		// $roundType : The list of existing round type must use one of those constants:
		//   ROUND_UP : Round UP away from 0 (<-0->)
		//   ROUND_DOWN : Round DOWN toward 0 (->0<-)
		//   ROUND_CEILING : Round UP (<-0<-)
		//   ROUND_FLOOR : Round DOWN (->0->)
		//   ROUND_HALF_UP : Round UP toward the nearest neighbor, round UP (<-0->) if equal distances to neighbors
		//   ROUND_HALF_DOWN : Round DOWN toward the nearest neighbor, round DOWN (->0<-) if equal distances to neighbors
		//   ROUND_HALF_CEILING : Round UP toward the nearest neighbor, round CEILING (<-0<-) if equal distances to neighbors
		//   ROUND_HALF_FLOOR : Round DOWN toward the nearest neighbor, round FLOOR (->0->) if equal distances to neighbors
		//   ROUND_HALF_EVEN : Round to the nearest neighbor, round to the EVEN neighbor if equal distances to neighbors
		//
		// Examples : 
		//   AJ_Tools_RoundDecimal(1.222;0.1;"ROUND_UP") -> 1.3
		//   AJ_Tools_RoundDecimal(-1.222;0.1;"ROUND_UP") -> -1.3
		// 
		//   AJ_Tools_RoundDecimal(1.222;0.1;"ROUND_DOWN") -> 1.2
		//   AJ_Tools_RoundDecimal(-1.222;0.1;"ROUND_DOWN") -> -1.2
		// 
		//   AJ_Tools_RoundDecimal(1.222;0.1;"ROUND_CEILING") -> 1.3
		//   AJ_Tools_RoundDecimal(-1.222;0.1;"ROUND_CEILING") -> -1.2
		// 
		//   AJ_Tools_RoundDecimal(1.222;0.1;"ROUND_FLOOR") -> 1.2
		//   AJ_Tools_RoundDecimal(-1.222;0.1;"ROUND_FLOOR") -> -1.3
		// 
		//   AJ_Tools_RoundDecimal(1.25;0.1;"ROUND_HALF_UP") -> 1.3
		//   AJ_Tools_RoundDecimal(-1.25;0.1;"ROUND_HALF_UP") -> -1.3
		// 
		//   AJ_Tools_RoundDecimal(1.25;0.1;"ROUND_HALF_DOWN") -> 1.2
		//   AJ_Tools_RoundDecimal(-1.25;0.1;"ROUND_HALF_DOWN") -> -1.2
		// 
		//   AJ_Tools_RoundDecimal(1.25;0.1;"ROUND_HALF_CEILING") -> 1.3
		//   AJ_Tools_RoundDecimal(-1.25;0.1;"ROUND_HALF_CEILING") -> -1.2
		// 
		//   AJ_Tools_RoundDecimal(1.25;0.1;"ROUND_HALF_FLOOR") -> 1.2
		//   AJ_Tools_RoundDecimal(-1.25;0.1;"ROUND_HALF_FLOOR") -> -1.3
		// 
		//   AJ_Tools_RoundDecimal(1.25;0.1;"ROUND_HALF_EVEN") -> 1.2
		//   AJ_Tools_RoundDecimal(-1.25;0.1;"ROUND_HALF_EVEN") -> -1.2
		// 
		//   AJ_Tools_RoundDecimal(1.15;0.1;"ROUND_HALF_EVEN") -> 1.2
		//   AJ_Tools_RoundDecimal(-1.15;0.1;"ROUND_HALF_EVEN") -> -1.2
		// 
		// ----------------------------------------------------
		// Copyrights (C) AJAR SA - 2019
	End if 
	
	var $valueToRound; $precision; $valueRounded; $roundedDif; $multiple : Real
	var $roundType : Text
	
	If (Count parameters#3)
		$valueRounded:=This.NaN
	Else 
		$valueToRound:=$1
		$precision:=$2
		$roundType:=$3
		
		If ($precision#0)
			// $multiple is the multiple that will help to do the rounding using the 4D Round command
			// We will use it to divide the initial value to then do a rounding to 1 and then multiple again the result to come back on our feet.
			// Ex. (1.222;0.1;AJ_ROUND_DOWN) -> $multiple = 1/0.1 = 10 -> Round(1.222*10;0)/10 = Round(12.22)/10 = 12/10 = 1.2
			$multiple:=1/$precision
		End if 
		
		$valueRounded:=Round($valueToRound*$multiple;0)/$multiple
		$roundedDif:=Abs(($valueRounded-$valueToRound)*$multiple)  // Difference between the rounded value and the notRounded value to see if it is in the half (=0.5)
		
		// Cast the good rounding type
		// Can depend of the sign of the number (positive or negative)
		// Can depend on the rounded difference for the ROUND_HALF_@ cases
		// ROUND_UP (<-0->) 
		// ROUND_DOWN (->0<-)
		Case of 
			: ($roundType="ROUND_UP") & ($valueToRound>0)
				// ROUND_CEILING for positive numbers
				$roundType:="ROUND_CEILING"
			: ($roundType="ROUND_UP") & ($valueToRound<0)
				// ROUND_FLOOR for negative numbers
				$roundType:="ROUND_FLOOR"
				
			: ($roundType="ROUND_DOWN") & ($valueToRound>0)
				// ROUND_FLOOR for positive numbers
				$roundType:="ROUND_FLOOR"
			: ($roundType="ROUND_DOWN") & ($valueToRound<0)
				// ROUND_CEILING for negative numbers
				$roundType:="ROUND_CEILING"
				
			: ($roundType="ROUND_HALF_DOWN") & ($roundedDif=0.5) & ($valueToRound>0)
				// ROUND_HALF_DOWN when rounded difference is 0.5 and value is positive is a ROUND_FLOOR
				$roundType:="ROUND_FLOOR"
				
			: ($roundType="ROUND_HALF_DOWN") & ($roundedDif=0.5) & ($valueToRound<0)
				// ROUND_HALF_DOWN when rounded difference is 0.5 and value is negative is a ROUND_CEILING
				$roundType:="ROUND_CEILING"
				
			: ($roundType="ROUND_HALF_CEILING") & ($roundedDif=0.5)
				// ROUND_HALF_CEILING when rounded difference is 0.5 is a ROUND_CEILING
				$roundType:="ROUND_CEILING"
				
			: ($roundType="ROUND_HALF_FLOOR") & ($roundedDif=0.5)
				// ROUND_HALF_FLOOR when rounded difference is 0.5 is a ROUND_FLOOR
				$roundType:="ROUND_FLOOR"
				
			: ($roundType="ROUND_HALF_EVEN") & ((Int(Abs($valueToRound*$multiple))%2)=0) & ($valueToRound>0)
				// ROUND_HALF_EVEN when nearest neighbor is even and value is positive is a ROUND_FLOOR
				$roundType:="ROUND_FLOOR"
			: ($roundType="ROUND_HALF_EVEN") & ((Int(Abs($valueToRound*$multiple))%2)=0) & ($valueToRound<0)
				// ROUND_HALF_EVEN when nearest neighbor is even and value is negative is a ROUND_CEILING
				$roundType:="ROUND_CEILING"
			: ($roundType="ROUND_HALF_EVEN") & ((Int(Abs($valueToRound*$multiple))%2)=1) & ($valueToRound>0)
				// ROUND_HALF_EVEN when nearest neighbor is odd and value is positive is a ROUND_CEILING
				$roundType:="ROUND_CEILING"
			: ($roundType="ROUND_HALF_EVEN") & ((Int(Abs($valueToRound*$multiple))%2)=1) & ($valueToRound<0)
				// ROUND_HALF_EVEN when nearest neighbor is odd and value is negative is a ROUND_FLOOR
				$roundType:="ROUND_FLOOR"
		End case 
		
		Case of 
			: ($roundType="ROUND_CEILING")
				If ($valueRounded<$valueToRound)
					$valueRounded:=$valueRounded+$precision
				End if 
				
			: ($roundType="ROUND_FLOOR")
				If ($valueRounded>$valueToRound)
					$valueRounded:=$valueRounded-$precision
				End if 
				
			: ($roundType="ROUND_HALF_UP")
				// Default 4D rounding is ROUND_HALF_UP
				// Don't need to do anything
			: ($roundType="ROUND_HALF_DOWN")
				// Special case are trap on the first caseof
			: ($roundType="ROUND_HALF_CEILING")
				// Special case are trap on the first caseof
			: ($roundType="ROUND_HALF_FLOOR")
				// Special case are trap on the first caseof
			: ($roundType="ROUND_HALF_UP")
				// Special case are trap on the first caseof
			: ($roundType="ROUND_HALF_EVEN")
				// Special case are trap on the first caseof
			Else 
				$valueRounded:=$valueToRound
		End case 
		
	End if 
	
	$return:=$valueRounded
	
	
Function spherodistance($param1 : Real; $param2 : Real; $param3 : Real; $param4 : Real; $param5 : Real) -> $return : Real
	// Olivier Deschanels request and code
	// calculates the distance between two points on earth
	// (or any other sphere, if a fifth parameter is given to define the radius)
	
	// the parameters are the geographical positions of the points
	// in DECIMAL DEGREES and the optional radius in any unit (result will depend on th
	// the default value is 6371 kilometers and the result in kilometers too
	
	// calcule la distance, en km, entre deux points terrestres dont les coordonnées
	// XY sont données en paramètres, exprimés en degrés décimaux
	// ex : g_calculateDistance(14,5;45,33;-12,15;18)
	
	//  cos(angle) = sin(latitude1)sin(latitude2)…
	//  …+cos(latitude1)cos(latitude2)cos(Longitude1-longitude2)
	
	//SAMPLE : 
	//4D_CalculateDistance (-50,81;10,35;40,98;-80,53{;6371})
	
	var $lat1rad; $Lon1rad; $lat2rad; $lon2rad; $dlon; $Radius; $result; $Distance; $x; $Lat1; $Lat2; $Long1; $Long2 : Real
	
	If (Count parameters=4) | (Count parameters=5)
		$lon1:=$1
		$lat1:=$2
		$lon2:=$3
		$lat2:=$4
		
		// Harvesine Formula
		If (Count parameters=5)
			$Radius:=$5
		Else 
			$Radius:=6371  //6371 = earth radius
		End if 
		$lat1rad:=This.toRadians($lat1)
		$lat2rad:=This.toRadians($lat2)
		$dlat:=This.toRadians($lat2-$lat1)
		$dlon:=This.toRadians($lon2-$lon1)
		$a:=(This.pow(This.sin($dlat/2);2))+(This.cos($lat1rad)*This.cos($lat2rad)*This.pow(This.sin($dlon/2);2))
		$c:=2*This.atan2(This.sqrt($a);This.sqrt(1-$a))
		$result:=$Radius*$c
	Else 
		$result:=This.NaN
	End if 
	
	$return:=$result
	
