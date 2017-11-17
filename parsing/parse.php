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
	
	// The tags that are currently open.
	// (ordered this way so they will be closed correctly)
	$openTags = array(
		'text' => 0,
		'line' => 0,
		'scene' => 0,
		'act' => 0,
	);

	// TODO: Optimize script for memory usage by writing directly to file.
	$script = '';

	$count = 0;
	$actCount = 0;
	$sceneCount = 0;

	$regex = array(
		'default' => array(
			'act' => "/^\s*ACT\W+(?P<act>\w*)(?P<remaining>.*)/i",
			'scene' => "/^\s*Scene\W+(?P<scene>\w*)/i",
			'line' => "/\s*(?P<name>\w*(\s*\w*)?:)?\s*(?P<text>.*)?/",
		),
	);
	$regex['shakes'] = $regex['default'];
	$regex['shakes']['line'] = "/\s*(?P<name>\w*\.(\s*\w*\.)?)?\s*(?P<text>.*)?/";

	$parsingType = 'shakes';

	// Read each line.
	if ( $handle ){while (($line = fgets($handle)) !== false)
	{
		$line = str_replace( '&', '&amp;', $line );
		// Count actual lines (for deterministically generating line IDs)
		$count++;
		// Tag for "goto-ing"
		reparseLine:
		// If the line was just whitespace,
		if ( trim( $line ) == "" )
		{
			// remember that, and go to the next line.
			$previous = 'blank';
		}
		else if ( $title == NULL )
		{
			$title = trim($line);
		}
		// If the string starts with 'act'
		else if ( $previous == 'blank'
			&& preg_match( $regex[$parsingType]['act'], $line, $array ) )
		{
			$script .= closeTags( $openTags, 'act' );
			$script .= "<act id='$actCount' name='$array[act]'>\n";
			$sceneCount = 0;
			$actCount++;
			$previous = 'act';
			$openTags[$previous] = 1;
			// Sometimes, the line contains "Act II Scene I", so
			// split the line so it runs through the parser again.
			$line = $array['remaining'];
			goto reparseLine;
		}
		// If the string starts with 'scene'
		else if ( ($previous == 'blank' || $previous == 'act')
			&& preg_match( $regex[$parsingType]['scene'], $line, $array ) )
		{
			$script .= closeTags( $openTags, 'scene' );
			$script .= "<scene id='$sceneCount' name='$array[scene]'>\n";
			$sceneCount++;
			$previous = 'scene';
			$openTags[$previous] = 1;
		}
		// Parse lines
		else if ( $previous == 'blank' && preg_match( $regex[$parsingType]['line'], $line, $array ) )
		{
			$script .= closeTags( $openTags, 'line' );
			$character = isset( $array['name'] ) ? $array['name'] : '';
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
			$openTags[$previous] = 1; $openTags['text'] = 1;
		}
		else
		{
			$script .= trim($line) . "\n";
			$previous = 'line';
		}
	}
	$script .= closeTags( $openTags );
	$characters = "<roles>\n";
	foreach( $chars as $name => $id )
	{
		$characters .= "\t<character id='$id' name='$name'/>\n";
	}
	$characters .= "</roles>\n";
	
	echo "<script title='$title'>\n$characters$script</script>\n";
}

/**
 * Close the tags that need to be closed before this one can be opened.
 */
function closeTags( &$openTags, $level = 'act' )
{
	$output = '';
	$continue = FALSE;
	foreach( $openTags as $tag => $number )
	{
		while( $number > 0 )
		{
			$output .= "</$tag>\n";
			$number--;
		}
		$openTags[$tag] = 0;
		if ( $tag == $level )
		{
			break;
		}
	}
	return $output;
}
