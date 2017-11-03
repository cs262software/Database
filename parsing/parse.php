<?php
	/**
	 * @brief: A script for parsing text files into poorly formed script XML.
	 *
	 * Usage: php parse.php data/1524.txt > output/1524poor.xml
	 * @author: zjd7@students.calvin.edu (earboxer)
	 */
	// Take the first command line argument.
	$handle = fopen($argv[1], "r");

	// For our state machine we need to just remember what the last line was.
	$previous = 'blank';

	$title = NULL;// Title of the piece
	
	/**
	 * All of the characters in the play, formatted like
	 * array(
	 *  'Ber.' => 0,
	 *  'Fran.' => 1,
	 *  ...
	 * );
	 */
	$chars = array();
	
	$array = array();

	
	// Roman numeral parsing index
	$romans = array(
	    'M' => 1000,
	    'CM' => 900,
	    'D' => 500,
	    'CD' => 400,
	    'C' => 100,
	    'XC' => 90,
	    'L' => 50,
	    'XL' => 40,
	    'X' => 10,
	    'IX' => 9,
	    'V' => 5,
	    'IV' => 4,
	    'I' => 1,
	);
	
	// TODO: Optimize script for memory usage by writing directly to file.
	$script = '';

	// Read each line.
	if ( $handle ){while (($line = fgets($handle)) !== false)
	{
		// If the line was just whitespace,
		if ( trim( $line ) == "" )
		{
			// remember that, and go to the next line.
			$previous = 'blank';
		}
		// If the string starts with 'act'
		else if ( $previous == 'blank' && preg_match( "/\s*ACT\W+(?P<act>\w*)/i", $line, $array ) )
		{
			$roman = $array["act"];
			$result = 0;	
			foreach ($romans as $key => $value) {
			    while (strpos($roman, $key) === 0) {
			        $result += $value;
			        $roman = substr($roman, strlen($key));
			    }
			}
			$script .= "<act id='$result'>\n";
			$previous = 'act';
		}
		// If the string starts with 'scene'
		else if ( $previous == 'blank' && preg_match( "/\s*Scene\W+(\w*)/i", $line, $array ) )
		{
			
			$script .= "<scene id='$array[1]'>\n";
			$previous = 'scene';
		}
		// Parse lines
		else if ( $previous == 'blank' && preg_match( "/\s*(?P<name1>\w*\.)?\s*(?P<name2>\w*\.)?\s*(?P<text>.*)?/", $line, $array ) )
		{
			$character = isset( $array['name1'] ) ? $array['name1'] : '';
			$character .= isset( $array['name2'] ) ? $array['name2'] : '';
			$characterID = '';
			if( $character && isset( $chars[$character] ) )
			{
				$characterID = "characterID='$chars[$character]'";
			}
			else if ( $character )
			{
				$chars[$character] = count($chars);
				$characterID = "characterID='$chars[$character]'";
			}
			$previous = 'line';
			// TODO: Generate proper line IDs.
			$script .= "<line id='1'$characterID><text>$array[text]\n";
		}
		else
		{
			$script .= trim($line) . "\n";
			$previous = 'line';
		}
	}
	
	$characters = "<roles>\n";
	foreach( $chars as $name => $id )
	{
		$characters .= "\t<character id='$id' name='$name'/>\n";
	}
	$characters .= "</roles>\n";
	
	echo "<script title='$title'>\n$characters$script</script>\n";
}

