//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}

  // LongInt2BinaryString ( longint ) -> return
  //
  // longint : (longint) any value
  // return : (text) return a bianry string

#DECLARE($param1 : Integer) -> $return : Text
var $longint : Integer
var $string : Text
var $i : Integer
var $test : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 17.02.20, 14:45:56
	  // ----------------------------------------------------
	  // Method: LongInt2BinaryString
	  // Description
	  // 
	  //
	  // No Parameters
	  // ----------------------------------------------------
End if 

$longint:=$param1
$string:=""

For ($i;0;31)  // 4 bytes
	$test:=$longint ?? $i
	$string:=Choose($test;"1";"0")+$string
End for 

$return:=$string
