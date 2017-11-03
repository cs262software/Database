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
	
	// TODO: Optimize script for memory usage by writing directly to file.
	$script = '';

	$count = 0;

	// Read each line.
	if ( $handle ){while (($line = fgets($handle)) !== false)
	{
		$count++;
		// If the line was just whitespace,
		if ( trim( $line ) == "" )
		{
			// remember that, and go to the next line.
			$previous = 'blank';
		}
		// If the string starts with 'act'
		else if ( $previous == 'blank' && preg_match( "/\s*ACT\W+(\w*)/i", $line, $array ) )
		{
			
			$script .= "<act id='$array[1]'>\n";
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
				$characterID = " characterID='$chars[$character]'";
			}
			else if ( $character )
			{
				$chars[$character] = count($chars);
				$characterID = " characterID='$chars[$character]'";
			}
			$previous = 'line';
			// TODO: Generate proper line IDs.
			$lineID = hash( 'crc32', "$line $count" );

			$script .= "<line id='$lineID'$characterID><text>$array[text]\n";
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

