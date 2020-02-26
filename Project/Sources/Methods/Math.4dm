//%attributes = {"shared":true}

  // Math ( ) -> Class
  //
  // Class : (object) return the object class Math

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 10.02.20, 11:59:00
	  // ----------------------------------------------------
	  // Method: Math
	  // Description
	  // 
	  //
	  // No Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$o)
C_TEXT:C284($1;$text)
C_OBJECT:C1216($2;$o)
C_COLLECTION:C1488($col)
C_REAL:C285($a;$b;$y)
C_LONGINT:C283($a_l;$b_l)
C_VARIANT:C1683($value)

  // ------------------Constructor---------------------
If (This:C1470[""]=Null:C1517)
	
	If (Count parameters:C259>=1)
		
		$text:=$1
		
	End if 
	  //"E";Formula(Math ("E").value);
	$o:=New object:C1471(\
		"";"Math";\
		"value";$text;\
		"success";False:C215;\
		"errors";New collection:C1472;\
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
		"abs";Formula:C1597(Math ("abs";New object:C1471("num";$1)).value);\
		"cos";Formula:C1597(Math ("cos";New object:C1471("num";$1)).value);\
		"cosh";Formula:C1597(Math ("cosh";New object:C1471("num";$1)).value);\
		"acosh";Formula:C1597(Math ("acosh";New object:C1471("num";$1)).value);\
		"sin";Formula:C1597(Math ("sin";New object:C1471("num";$1)).value);\
		"asinh";Formula:C1597(Math ("asinh";New object:C1471("num";$1)).value);\
		"tan";Formula:C1597(Math ("tan";New object:C1471("num";$1)).value);\
		"atan";Formula:C1597(Math ("atan";New object:C1471("num";$1)).value);\
		"atanh";Formula:C1597(Math ("atanh";New object:C1471("num";$1)).value);\
		"floor";Formula:C1597(Math ("floor";New object:C1471("num";$1)).value);\
		"ceil";Formula:C1597(Math ("ceil";New object:C1471("num";$1)).value);\
		"log";Formula:C1597(Math ("log";New object:C1471("num";$1)).value);\
		"log10";Formula:C1597(Math ("log10";New object:C1471("num";$1)).value);\
		"log2";Formula:C1597(Math ("log2";New object:C1471("num";$1)).value);\
		"sqrt";Formula:C1597(Math ("sqrt";New object:C1471("num";$1)).value);\
		"cbrt";Formula:C1597(Math ("cbrt";New object:C1471("num";$1)).value);\
		"clz32";Formula:C1597(Math ("clz32";New object:C1471("num";$1)).value);\
		"exp";Formula:C1597(Math ("exp";New object:C1471("num";$1)).value);\
		"expm1";Formula:C1597(Math ("expm1";New object:C1471("num";$1)).value);\
		"hypot";Formula:C1597(Math ("hypot";New object:C1471("num";$1)).value);\
		"imul";Formula:C1597(Math ("imul";New object:C1471("num1";$1;"num2";$2)).value);\
		"log1p";Formula:C1597(Math ("log1p";New object:C1471("num";$1)).value);\
		"max";Formula:C1597(Math ("max";New object:C1471("num";$1)).value);\
		"min";Formula:C1597(Math ("min";New object:C1471("num";$1)).value);\
		"pow";Formula:C1597(Math ("pow";New object:C1471("base";$1;"exponent";$2)).value);\
		"random";Formula:C1597(Math ("random";New object:C1471("num";$1)).value);\
		"round";Formula:C1597(Math ("round";New object:C1471("num";$1)).value);\
		"sign";Formula:C1597(Math ("sign";New object:C1471("num";$1)).value);\
		"sinh";Formula:C1597(Math ("sinh";New object:C1471("num";$1)).value);\
		"sqrt";Formula:C1597(Math ("sqrt";New object:C1471("num";$1)).value);\
		"tanh";Formula:C1597(Math ("tanh";New object:C1471("num";$1)).value);\
		"trunc";Formula:C1597(Math ("trunc";New object:C1471("num";$1)).value);\
		"spherodistance";Formula:C1597(Math ("spherodistance";$1).value)\
		)
	
	  //"spherodistance";Formula(Math ("spherodistance";New object("longitude1";$1;"latitude1";$2;"longitude2";$3;"latitude2";$4;"radius";$5)).value)
	
Else 
	
	
	Case of 
			  //=======================================================================================================
		: (This:C1470=Null:C1517)
			
			ASSERT:C1129(False:C215;"OOPS, this method must be called from a member method")
			
			  //=======================================================================================================
		: ($1="setValue")  // Defines the value & returns the updated object
			
			$o:=This:C1470
			$o.value:=$2.value
			
			  //=======================================================================================================
		Else 
			
			$o:=New object:C1471(\
				"value";"")
			
			If (Count parameters:C259>1)
				  // argument filters
				$vtype:=Value type:C1509($2)
				$o.value:=0
				Case of 
					: ($vtype=Is object:K8:27)
						  //If (Not(Undefined($2.num)))
						If ($2.num#Null:C1517)
							If (Value type:C1509($2.num)#Is object:K8:27)
								If (Value type:C1509($2.num)=Is collection:K8:32)
									$col:=$2.num
									If ($col.length=1)
										$o.value:=$col[0]
									End if 
								Else 
									If (Value type:C1509($2.num)#Is real:K8:4)
										If ($2.num="-INF")
											$o.value:=$2.num
										Else 
											$o.value:=Num:C11($2.num)
										End if 
									Else 
										$o.value:=Num:C11($2.num)
									End if 
									
								End if 
							End if 
						End if 
						  //End if 
					Else 
						$o.value:=Num:C11($2.num)
				End case 
			End if 
			
			$o.success:=True:C214
			
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
				: ($1="abs")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs
					$o.value:=Abs:C99($o.value)
					  //______________________________________________________
				: ($1="cos")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acos
					$o.value:=Cos:C18(Num:C11($o.value))
					  //______________________________________________________
				: ($1="cosh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acos
					$o.value:=(Exp:C21(Num:C11($o.value))+Exp:C21(-Num:C11($o.value)))/2
					  //______________________________________________________
				: ($1="sin")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sin
					$o.value:=Sin:C17((Num:C11($o.value)))
					  //______________________________________________________
				: ($1="asinh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh
					$o.value:=This:C1470.log(Num:C11($o.value)+This:C1470.sqrt((Num:C11($o.value)*(Num:C11($o.value)))+1))
					  //______________________________________________________
				: ($1="tan")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tan
					$o.value:=Tan:C19((Num:C11($o.value)))
					  //______________________________________________________
				: ($1="atan")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan
					$o.value:=Arctan:C20(Num:C11($o.value))
					  //______________________________________________________
				: ($1="atanh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atanh
					$o.value:=Log:C22((1+Num:C11($o.value))/(1-(Num:C11($o.value))))/2
					  //______________________________________________________
				: ($1="floor")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor
					$o.value:=Int:C8(Num:C11($o.value))
					  //______________________________________________________
				: ($1="ceil")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil
					$o.value:=-Int:C8(-Num:C11($o.value))
					  //______________________________________________________
				: ($1="log")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
					$o.value:=Log:C22(Num:C11($o.value))
					  //______________________________________________________
				: ($1="log10")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
					$o.value:=Log:C22(Num:C11($o.value))*This:C1470.LOG10E
					  //______________________________________________________
				: ($1="log2")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log
					$o.value:=Log:C22(Num:C11($o.value))*This:C1470.LOG2E
					  //______________________________________________________
				: ($1="acosh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh
					$o.value:=This:C1470.log(Num:C11($o.value)+This:C1470.sqrt((Num:C11($o.value)*(Num:C11($o.value)))-1))
					  //______________________________________________________
				: ($1="sqrt")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt
					$o.value:=Square root:C539(Num:C11($o.value))
					  //______________________________________________________
				: ($1="cbrt")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt
					If (Value type:C1509($o.value)#Is real:K8:4)
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
				: ($1="clz32")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32
					$o.value:=Position:C15("1";LongInt2BinaryString (Num:C11($o.value));1)-1
					  //______________________________________________________
				: ($1="exp")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/exp
					$o.value:=Exp:C21(Num:C11($o.value))
					  //______________________________________________________
				: ($1="expm1")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1
					$o.value:=Exp:C21(Num:C11($o.value))-1
					  //______________________________________________________
				: ($1="hypot")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot
					$count:=$col.length
					
					Case of 
						: (Value type:C1509($col)=Is collection:K8:32) & ($count>1)
							$sum:=0
							For each ($value;$col)
								$sum:=$sum+(Num:C11($value)^2)
							End for each 
							$o.value:=This:C1470.sqrt($sum)
						: (Value type:C1509($o.value)=Is real:K8:4)
							$o.value:=This:C1470.sqrt(Num:C11($o.value)^2)
							
						Else 
							
					End case 
					  //______________________________________________________
				: ($1="imul")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul
					$a_l:=$2.num1
					$b_l:=$2.num2
					$o.value:=$a_l*$b_l
					  //______________________________________________________
				: ($1="log1p")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log1p
					$o.value:=This:C1470.log(1+Num:C11($o.value))
					  //______________________________________________________
				: ($1="max")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max
					$o.value:=$col.max()
					  //______________________________________________________
				: ($1="min")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min
					$o.value:=$col.min()
					  //______________________________________________________
				: ($1="pow")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow
					$o.value:=$2.base^$2.exponent
					  //______________________________________________________
				: ($1="random")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
					$o.value:=Random:C100/MAXINT:K35:1
					  //______________________________________________________
				: ($1="round")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round
					If (Num:C11($o.value)<0)
						$o.value:=Round:C94(Num:C11($o.value)+0.01;0)
					Else 
						$o.value:=Round:C94(Num:C11($o.value);0)
					End if 
					  //______________________________________________________
				: ($1="sign")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign
					Case of 
						: (Num:C11($o.value)>0)
							$o.value:=1
						: (Num:C11($o.value)=0)
							$o.value:=0
						: (Num:C11($o.value)<0)
							$o.value:=-1
					End case 
					  //______________________________________________________
				: ($1="sinh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sinh
					$y:=This:C1470.exp(Num:C11($o.value))
					$o.value:=($y-(1/$y))/2
					
					  //______________________________________________________
				: ($1="sqrt")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt
					$y:=This:C1470.exp(Num:C11($o.value))
					$o.value:=($y-(1/$y))/2
					  //______________________________________________________
				: ($1="tanh")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tanh
					$a:=This:C1470.exp(Num:C11($o.value))
					$b:=This:C1470.exp(-Num:C11($o.value))
					$o.value:=($a-$b)/($a+$b)
					  //______________________________________________________
				: ($1="trunc")
					  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc
					$str:=String:C10(Num:C11($o.value))
					GET SYSTEM FORMAT:C994(Decimal separator:K60:1;$vDecSep)
					$o.value:=Num:C11(Substring:C12($str;1;Position:C15($vDecSep;$str)-1))
					  //______________________________________________________
				: ($1="spherodistance")
					  // Olivier Deschanels request and code
					  //calculates the distance between two points on earth
					  //(or any other sphere, if a fifth parameter is given to define the radius)
					
					  //the parameters are the geographical positions of the points
					  //in DECIMAL DEGREES and the optional radius in any unit (result will depend on th
					  //the default value is 6371 kilometers and the result in kilometers too
					
					  //calcule la distance, en km, entre deux points terrestres dont les coordonnées
					  //XY sont données en paramètres, exprimés en degrés décimaux
					  //ex : g_calculateDistance(14,5;45,33;-12,15;18)
					
					  //  cos(angle) = sin(latitude1)sin(latitude2)…
					  //  …+cos(latitude1)cos(latitude2)cos(Longitude1-longitude2)
					
					  //SAMPLE : 
					  //4D_CalculateDistance (-50,81;10,35;40,98;-80,53{;6371})
					  // "latitude1";$1;"longitude1";$2;"latitude2";$3;"longitude2";$4;"radius";$5
					
					C_REAL:C285($Latitude1;$Longitude1;$Latitude2;$Longitude2;$DeltaLongitude;$Radius)
					C_REAL:C285($Distance;$x;$Lat1;$Lat2;$Long1;$Long2)
					
					$Long1:=$2.longitude1
					$Lat1:=$2.$latitude1
					$Long2:=$2.longitude2
					$Lat2:=$2.$latitude2
					
					$Longitude1:=$Long1*This:C1470.PI/180
					$Latitude1:=$Lat1*This:C1470.PI/180
					$Longitude2:=$Long2*This:C1470.PI/180
					$Latitude2:=$Lat2*This:C1470.PI/180
					
					If ($2.radius#Null:C1517)
						$Radius:=$2.radius
					Else 
						$Radius:=6371  //6371 = earth radius
					End if 
					
					$DeltaLongitude:=This:C1470.abs($Longitude1-$Longitude2)
					If ($DeltaLongitude>This:C1470.PI)
						$DeltaLongitude:=(2*This:C1470.PI)-$DeltaLongitude
					End if 
					
					$Cos_x:=(This:C1470.sin($Latitude1)*This:C1470.sin($Latitude2))+(This:C1470.cos($Latitude1)*This:C1470.cos($Latitude2)*This:C1470.cos($DeltaLongitude))  //-1 to 1
					If ($Cos_x>0)
						$x:=This:C1470.atan(((1-($Cos_x^2))^0.5)/$Cos_x)  //in radian
					Else 
						$x:=This:C1470.PI-This:C1470.abs(This:C1470.atan(((1-($Cos_x^2))^0.5)/$Cos_x))  //in radian
					End if 
					
					$Distance:=$Radius*$x
					$o.value:=This:C1470.abs($distance)
					
					
				Else 
					$o.success:=False:C215
			End case 
	End case 
End if 

  // ----------------------------------------------------
  // Return
$0:=$o

