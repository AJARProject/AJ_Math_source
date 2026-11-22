//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}

  // Math ( ) -> Class
  //
  // Class : (object) return the object class Math

#DECLARE($param1 : Text; $param2 : Object) -> $return : Object
var $o : Object
var $text; $roundType : Text
var $col : Collection
var $a; $b; $c; $y; $dlat; $lon1; $lon2; $x : Real
var $lat1rad; $Lon1rad; $lat2rad; $lon2rad; $dlon; $Radius : Real
var $Distance; $Lat1; $Lat2; $Long1; $Long2 : Real
var $valueToRound; $precision; $valueRounded; $roundedDif; $multiple : Real
var $a_l; $b_l : Integer
var $value : Variant
var $vtype : Integer
var $count : Real
var $sum : Real
var $str; $vDecSep : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 10.02.20, 11:59:00
	  // ----------------------------------------------------
	  // Method: Math
	  // Description
	  // 
	  // Test
	  // No Parameters
	  // ----------------------------------------------------
End if 


  // ------------------Constructor---------------------
If (This[""]=Null)
	
	If (Count parameters>=1)
		
		$text:=$param1
		
	End if 
	  //"E";Formula(Math ("E").value);
	$o:=New object(\
		"";"Math";\
		"value";$text;\
		"success";False;\
		"errors";New collection;\
		"E";2.718281828459;\
		"LN2";0.6931471805599;\
		"LN10";2.302585092994;\
		"LOG10E";0.4342944819033;\
		"LOG2E";1.442695040889;\
		"PI";3.14159265359;\
		"SQRT2";1.414213562373;\
		"SQRT1_2";0.7071067811865;\
		"Degree";0.01745329251994;\
		"Radian";57.29577951308;\
		"toRadians";Formula(Math ("toRadians";New object("num";$1)).value);\
		"toDegrees";Formula(Math ("toDegrees";New object("num";$1)).value);\
		"abs";Formula(Math ("abs";New object("num";$1)).value);\
		"cos";Formula(Math ("cos";New object("num";$1)).value);\
		"cosh";Formula(Math ("cosh";New object("num";$1)).value);\
		"acos";Formula(Math ("acos";New object("num";$1)).value);\
		"acosh";Formula(Math ("acosh";New object("num";$1)).value);\
		"sin";Formula(Math ("sin";New object("num";$1)).value);\
		"asin";Formula(Math ("asin";New object("num";$1)).value);\
		"asinh";Formula(Math ("asinh";New object("num";$1)).value);\
		"tan";Formula(Math ("tan";New object("num";$1)).value);\
		"atan";Formula(Math ("atan";New object("num";$1)).value);\
		"atan2";Formula(Math ("atan2";New object("y";$1;"x";$2)).value);\
		"atanh";Formula(Math ("atanh";New object("num";$1)).value);\
		"floor";Formula(Math ("floor";New object("num";$1)).value);\
		"ceil";Formula(Math ("ceil";New object("num";$1)).value);\
		"log";Formula(Math ("log";New object("num";$1)).value);\
		"log10";Formula(Math ("log10";New object("num";$1)).value);\
		"log2";Formula(Math ("log2";New object("num";$1)).value);\
		"sqrt";Formula(Math ("sqrt";New object("num";$1)).value);\
		"cbrt";Formula(Math ("cbrt";New object("num";$1)).value);\
		"clz32";Formula(Math ("clz32";New object("num";$1)).value);\
		"exp";Formula(Math ("exp";New object("num";$1)).value);\
		"expm1";Formula(Math ("expm1";New object("num";$1)).value);\
		"hypot";Formula(Math ("hypot";New object("num";$1)).value);\
		"imul";Formula(Math ("imul";New object("num1";$1;"num2";$2)).value);\
		"log1p";Formula(Math ("log1p";New object("num";$1)).value);\
		"max";Formula(Math ("max";New object("num";$1)).value);\
		"min";Formula(Math ("min";New object("num";$1)).value);\
		"pow";Formula(Math ("pow";New object("base";$1;"exponent";$2)).value);\
		"random";Formula(Math ("random";New object("num";$1)).value);\
		"round";Formula(Math ("round";New object("num";$1)).value);\
		"sign";Formula(Math ("sign";New object("num";$1)).value);\
		"sinh";Formula(Math ("sinh";New object("num";$1)).value);\
		"sqrt";Formula(Math ("sqrt";New object("num";$1)).value);\
		"tanh";Formula(Math ("tanh";New object("num";$1)).value);\
		"trunc";Formula(Math ("trunc";New object("num";$1)).value);\
		"spherodistance";Formula(Math ("spherodistance";$1).value);\
		"roundDecimal";Formula(Math ("roundDecimal";New object("num";$1;"precision";$2;"roundType";$3)).value)\
		)
	
	  //"spherodistance";Formula(Math ("spherodistance";New object("longitude1";$1;"latitude1";$2;"longitude2";$3;"latitude2";$4;"radius";$5)).value)
	
Else 
	
	
	Case of 
			  //=======================================================================================================
		: (This=Null)
			
			ASSERT(False;"OOPS, this method must be called from a member method")
			
			  //=======================================================================================================
		: ($param1="setValue")  // Defines the value & returns the updated object
			
			$o:=This
			$o.value:=$param2.value
			
			  //=======================================================================================================
		Else 
			
			$o:=New object(\
				"value";"")
			
			If (Count parameters>1)
				  // argument filters
				$vtype:=Value type($param2)
				$o.value:=0
				Case of 
					: ($vtype=Is object)
						  //If (Not(Undefined($2.num)))
						If ($param2.num#Null)
							If (Value type($param2.num)#Is object)
								If (Value type($param2.num)=Is collection)
									$col:=$param2.num
									If ($col.length=1)
										$o.value:=$col[0]
									End if 
								Else 
									If (Value type($param2.num)#Is real)
										If ($param2.num="-INF")
											$o.value:=$param2.num
										Else 
											$o.value:=Num($param2.num)
										End if 
									Else 
										$o.value:=Num($param2.num)
									End if 
									
								End if 
							End if 
						End if 
						  //End if 
					Else 
						$o.value:=Num($param2.num)
				End case 
			End if 
			
			$o.success:=True
			
			Case of 
					
					  //  //______________________________________________________
					  //: ($1="E")
					  //  // Euler's constant (irrational) and the base of natural
					  //  // logarithms; approximately 2.718281828459045
					  //$o.value:=2.718281828459
					  //  //$o.value:=Exp(1)
					  //  //______________________________________________________
					  //: ($1="LN2")
					  //$o.value:=0.6931471805599
					  //  //$o.value:=Log(2)
					  //  //______________________________________________________
					  //: ($1="LN10")
					  //$o.value:=2.302585092994
					  //  //$o.value:=Log(10)
					  //  //______________________________________________________
					  //: ($1="LOG10E")
					  //$o.value:=0.4342944819033
					  //  //$o.value:=1/Log(10)
					  //  //______________________________________________________
					  //: ($1="LOG2E")
					  //$o.value:=1.442695040889
					  //  //$o.value:=1/Log(2)
					  //  //______________________________________________________
					  //: ($1="PI")
					  //$o.value:=3.14159265359
					  //  //$o.value:=Pi
					  //  //______________________________________________________
					  //: ($1="SQRT2")
					  //$o.value:=1.414213562373
					  //  //$o.value:=Square root(2)
					  //  //______________________________________________________
					  //: ($1="SQRT1_2")
					  //$o.value:=0.7071067811865
					  //  //$o.value:=Square root(1/2)
					  //  //______________________________________________________
					  //: ($1="Degree")
					  //$o.value:=0.01745329251994
					  //  //$o.value:=Degree
					  //  //______________________________________________________
					  //: ($1="Radian")
					  //$o.value:=57.29577951308
					  //  //$o.value:=Radian
					  //______________________________________________________
				: ($param1="toRadians")
					$o.value:=$o.value*This.PI/180
					  //______________________________________________________
				: ($param1="toDegrees")
					$o.value:=$o.value*180/This.PI
					  //______________________________________________________
				: ($param1="abs")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs
					$o.value:=Abs($o.value)
					  //______________________________________________________
				: ($param1="cos")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cos
					$o.value:=Cos(Num($o.value))
					  //______________________________________________________
				: ($param1="acos")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cos
					$x:=Num($o.value)
					If (This.abs($x)>1)
						$o.success:=False
						$o.value:=0
					Else 
						Case of 
							: ($x=0)  // évitons une division par zéro
								$o.value:=This.PI/2
							: ($x<0)
								If (This.PI>4)  // Correction d'un bug 4D sur la valeur de Pi dans certaines conditions.
									$o.value:=This.PI-This.atan(This.sqrt(1-This.pow($x;2))/This.abs($x))
								Else 
									$o.value:=This.PI-This.atan(This.sqrt(1-This.pow($x;2))/This.abs($x))
								End if 
							: ($x>0)
								$o.value:=This.atan(This.sqrt(1-This.pow($x;2))/$x)
						End case 
					End if 
					  //______________________________________________________
				: ($param1="cosh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acos
					$o.value:=(Exp(Num($o.value))+Exp(-Num($o.value)))/2
					  //______________________________________________________
				: ($param1="sin")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sin
					$o.value:=Sin((Num($o.value)))
					  //______________________________________________________
				: ($param1="asin")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asin
					$x:=Num($o.value)
					If (This.abs($x)>1)
						$o.success:=False
						$o.value:=0
					Else 
						If ($x=1)
							$o.value:=This.PI/2
						Else 
							$o.value:=This.atan($x/(This.sqrt(1-This.pow($x;2))))  // result in radian
						End if 
					End if 
					
					  //$o.value:=This.atan2($x;This.sqrt((1+$x)*(1-$x)))
					  //______________________________________________________
				: ($param1="asinh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh
					$o.value:=This.log(Num($o.value)+This.sqrt((Num($o.value)*(Num($o.value)))+1))
					  //______________________________________________________
				: ($param1="tan")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tan
					$o.value:=Tan((Num($o.value)))
					  //______________________________________________________
				: ($param1="atan")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan
					$o.value:=Arctan(Num($o.value))
					  //______________________________________________________
				: ($param1="atan2")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan2
					$y:=$param2.y
					$x:=$param2.x
					
					Case of 
						: ($x>0)
							$o.value:=This.atan($y/$x)
						: ($x<0) & ($y>=0)
							$o.value:=This.atan($y/$x)+This.PI
						: ($x<0) & ($y<0)
							$o.value:=This.atan($y/$x)-This.PI
						: ($x=0) & ($y>0)
							$o.value:=(This.PI/2)
						: ($x=0) & ($y<0)
							$o.value:=-(This.PI/2)
						: ($x=0) & ($y=0)
							$o.value:=0
						Else 
							$o.succes:=False
					End case 
					
					  //______________________________________________________
				: ($param1="atanh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atanh
					$o.value:=Log((1+Num($o.value))/(1-(Num($o.value))))/2
					  //______________________________________________________
				: ($param1="floor")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor
					$o.value:=Int(Num($o.value))
					  //______________________________________________________
				: ($param1="ceil")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil
					$o.value:=-Int(-Num($o.value))
					  //______________________________________________________
				: ($param1="log")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
					$o.value:=Log(Num($o.value))
					  //______________________________________________________
				: ($param1="log10")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
					$o.value:=Log(Num($o.value))*This.LOG10E
					  //______________________________________________________
				: ($param1="log2")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
					$o.value:=Log(Num($o.value))*This.LOG2E
					  //______________________________________________________
				: ($param1="acosh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh
					$o.value:=This.log(Num($o.value)+This.sqrt((Num($o.value)*(Num($o.value)))-1))
					  //______________________________________________________
				: ($param1="sqrt")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt
					$o.value:=Square root(Num($o.value))
					  //______________________________________________________
				: ($param1="cbrt")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt
					If (Value type($o.value)#Is real)
						If ($o.value="-INF") | ($o.value="INF")
							  //
						End if 
					Else 
						If ($o.value<0)
							$o.value:=-(-$o.value^(1/3))  // ensure negative numbers remain negative:
						Else 
							$o.value:=$o.value^(1/3)
						End if 
					End if 
					  //______________________________________________________
				: ($param1="clz32")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32
					$o.value:=Position("1";LongInt2BinaryString (Num($o.value));1)-1
					  //______________________________________________________
				: ($param1="exp")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/exp
					$o.value:=Exp(Num($o.value))
					  //______________________________________________________
				: ($param1="expm1")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1
					$o.value:=Exp(Num($o.value))-1
					  //______________________________________________________
				: ($param1="hypot")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot
					$count:=$col.length
					
					Case of 
						: (Value type($col)=Is collection) & ($count>1)
							$sum:=0
							For each ($value;$col)
								$sum:=$sum+(Num($value)^2)
							End for each 
							$o.value:=This.sqrt($sum)
						: (Value type($o.value)=Is real)
							$o.value:=This.sqrt(Num($o.value)^2)
							
						Else 
							
					End case 
					  //______________________________________________________
				: ($param1="imul")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul
					$a_l:=$param2.num1
					$b_l:=$param2.num2
					$o.value:=$a_l*$b_l
					  //______________________________________________________
				: ($param1="log1p")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log1p
					$o.value:=This.log(1+Num($o.value))
					  //______________________________________________________
				: ($param1="max")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max
					$o.value:=$col.max()
					  //______________________________________________________
				: ($param1="min")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min
					$o.value:=$col.min()
					  //______________________________________________________
				: ($param1="pow")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow
					$o.value:=$param2.base^$param2.exponent
					  //______________________________________________________
				: ($param1="random")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
					$o.value:=Random/MAXINT
					  //______________________________________________________
				: ($param1="round")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round
					If (Num($o.value)<0)
						$o.value:=Round(Num($o.value)+0.01;0)
					Else 
						$o.value:=Round(Num($o.value);0)
					End if 
					  //______________________________________________________
				: ($param1="sign")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign
					Case of 
						: (Num($o.value)>0)
							$o.value:=1
						: (Num($o.value)=0)
							$o.value:=0
						: (Num($o.value)<0)
							$o.value:=-1
					End case 
					  //______________________________________________________
				: ($param1="sinh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sinh
					$y:=This.exp(Num($o.value))
					$o.value:=($y-(1/$y))/2
					
					  //______________________________________________________
				: ($param1="sqrt")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt
					$y:=This.exp(Num($o.value))
					$o.value:=($y-(1/$y))/2
					  //______________________________________________________
				: ($param1="tanh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tanh
					$a:=This.exp(Num($o.value))
					$b:=This.exp(-Num($o.value))
					$o.value:=($a-$b)/($a+$b)
					  //______________________________________________________
				: ($param1="trunc")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc
					$str:=String(Num($o.value))
					GET SYSTEM FORMAT(Decimal separator;$vDecSep)
					$o.value:=Num(Substring($str;1;Position($vDecSep;$str)-1))
					  //______________________________________________________
				: ($param1="spherodistance")
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
					  // "latitude1";$1;"longitude1";$2;"latitude2";$3;"longitude2";$4;"radius";$5
					
					
					$lon1:=$param2.longitude1
					$lat1:=$param2.latitude1
					$lon2:=$param2.longitude2
					$lat2:=$param2.latitude2
					
					  // Method 1
					
					  //$Lon1rad:=This.toRadians($lon1)
					  //$lat1rad:=This.toRadians($lat1)
					  //$lon2rad:=This.toRadians($lon2)
					  //$lat2rad:=This.toRadians($lat2)
					
					  //If ($2.radius#Null)
					  //$Radius:=$2.radius
					  //Else 
					  //$Radius:=6371  //6371 = earth radius
					  //End if 
					  //$dlon:=This.abs($Lon1rad-$lon2rad)
					  //If ($dlon>This.PI)
					  //$dlon:=(2*This.PI)-$dlon
					  //End if 
					  //$Cos_x:=(This.sin($lat1rad)*This.sin($lat2rad))+(This.cos($lat1rad)*This.cos($lat2rad)*This.cos($dlon))  //-1 to 1
					  //If ($Cos_x>0)
					  //$x:=This.atan(((1-($Cos_x^2))^0.5)/$Cos_x)  //in radian
					  //Else 
					  //$x:=This.PI-This.abs(This.atan(((1-($Cos_x^2))^0.5)/$Cos_x))  //in radian
					  //End if 
					  //$Distance:=$Radius*$x
					  //$o.value:=This.abs($distance)
					
					  // Method 2
					  // distance between latitudes and longitudes 
					  //$dlat:=This.toRadians($lat2-$lat1)
					  //$dLon:=This.toRadians($lon2-$lon1)
					  //  // convert to radians 
					  //$lat1rad:=This.toRadians($lat1)
					  //$lat2rad:=This.toRadians($lat2)
					  //  // apply formulae 
					  //$a:=This.pow(This.sin($dlat/2);2)+((This.pow(This.sin($dLon/2);2)*This.cos($lat1rad)*This.cos($lat2rad)))
					  //If ($2.radius#Null)
					  //$Radius:=$2.radius
					  //Else 
					  //$Radius:=6371  //6371 = earth radius
					  //End if 
					  //$c:=2*This.asin(This.sqrt($a))
					  //$o.value:=$Radius*$c
					
					  // Method 3 - Harvesine Formula
					If ($param2.radius#Null)
						$Radius:=$param2.radius
					Else 
						$Radius:=6371  //6371 = earth radius
					End if 
					$lat1rad:=This.toRadians($lat1)
					$lat2rad:=This.toRadians($lat2)
					$dlat:=This.toRadians($lat2-$lat1)
					$dlon:=This.toRadians($lon2-$lon1)
					$a:=(This.pow(This.sin($dlat/2);2))+(This.cos($lat1rad)*This.cos($lat2rad)*This.pow(This.sin($dlon/2);2))
					$c:=2*This.atan2(This.sqrt($a);This.sqrt(1-$a))
					$o.value:=$Radius*$c
					
					  // Method 4
					  //$lat1rad:=This.toRadians($lat1)
					  //$lat2rad:=This.toRadians($lat2)
					  //$dlon:=This.toRadians($lon2-$lon1)
					  //If ($2.radius#Null)
					  //$Radius:=$2.radius
					  //Else 
					  //$Radius:=6371  //6371 = earth radius
					  //End if 
					  //$o.value:=This.acos((This.sin($lat1rad)*This.sin($lat2rad))+(This.cos($lat1rad)*This.cos($lat2rad)*This.cos($dlon)))*$Radius
					
					  // method 5
					  // Haversine formula
					  //https://stackoverflow.com/questions/18883601/function-to-calculate-distance-between-two-coordinates
					  // https://www.htmlgoodies.com/beyond/javascript/calculate-the-distance-between-two-points-in-your-web-apps.html
					  //$lat1rad:=This.toRadians($lat1)
					  //$lat2rad:=This.toRadians($lat2)
					  //$theta:=$lon1-$lon2
					  //$radtheta:=This.toRadians($theta)
					  //$distance:=(This.sin($lat1rad)*This.sin($lat2rad))+(This.cos($lat1rad)*This.cos($lat2rad)*This.cos($radtheta))
					  //$distance:=This.acos($distance)
					  //$distance:=this.toDegrees($distance)
					  //$distance:=$distance*60*1.1515
					  //$o.value:=$distance*1.609344 // km
					
				: ($param1="roundDecimal")
					  // AJ_Tools_RoundDecimal ( $valueToRound ; $precision ; $roundType ) -> return $valueRounded
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
					
					
					If ($param2.num=Null) | ($param2.precision=Null) | ($param2.roundType=Null)
						ASSERT(False;"You must give the 3 mandatory parameters to do the rounding.")
					Else 
						$valueToRound:=$param2.num
						$precision:=$param2.precision
						$roundType:=$param2.roundType
						
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
					
					$o.value:=$valueRounded
				Else 
					$o.success:=False
					$o.success:=0
			End case 
	End case 
End if 

  // ----------------------------------------------------
  // Return
$return:=$o

