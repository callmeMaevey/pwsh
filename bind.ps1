# more a sketch in the style of powershell, this doesnt compile
# it supports these features and Im pretty sure my syntax is close
# I dont have a linter rn though so big shrug
class Maybe{
	$value;

	[Maybe]Maybe($value){
		$this.value = $value ;
	}

	function bind ( $func ){
		$val = $this.value
		$tmp = $func( $val )  ;	
		return [Maybe]::new($tmp) ;
	}

}





$maybe = [Maybe]::new(1)
$maybe.bind( { param( $x ) return $x+2 } )
	.bind #big shrug?





#late night bonus section

function new-Bind ($value){
	$local = $value;

	$bind = { param($func)
		$binding = . { $func $local }

		return new-Bind($binding)

	}
	# unfinished ????? 
	return @{ $bind 
	
}
