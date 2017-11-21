<?php
	/**
	 * @brief: A script for parsing text files into poorly formed script XML.
	 *
	 * Usage: php parse.php data/1524.txt shakes > output/1524poor.xml
	 * php parse.php data/TheInterview.txt > output/theinterview.xml
	 * @author: zjd7@students.calvin.edu (earboxer)
	 */
	// Take the first command line argument.
	$handle = fopen($argv[1], "r");

	// For our state machine we need to just remember what the last line was.
	$previous = 'blank';

	$title = '';// Title of the piece
	$author = '';// Author of the piece
	
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
	define("INDEX_NUMBER", 1);
	$increment = array(
		'act' => INDEX_NUMBER,
		'scene' => INDEX_NUMBER,
	);

	$regex = array(
		'default' => array(
			'act' => "/^\s*ACT\W+(?P<act>\w*)\.?(?P<remaining>.*)/i",
			'scene' => "/^\s*Scene\W+(?P<scene>\w*)/i",
			'line' => "/\s*((?P<name>\w*(\s*\w*)?):)?\s*(?P<text>.*)?/",
		),
	);
	$regex['shakes'] = $regex['default'];
	$regex['shakes']['line'] = "/\s*(?P<name>\w*\.(\s*\w*\.)?)?\s*(?P<text>.*)?/";

	$parsingType = 'default';
	if ( $argc == 3 )
	{
		if ( isset( $regex[$argv[2]] ) )
		{
			$parsingType = $argv[2];
		}
	}

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
		else if ( $title == '' )
		{
			$title = trim($line);
		}
		else if ( $author == '' )
		{
			$author = trim(preg_replace("/^by /i", "", $line));
		}
		// If the string starts with 'act'
		else if ( $previous == 'blank'
			&& preg_match( $regex[$parsingType]['act'], $line, $array ) )
		{
			$script .= closeTags( $openTags, 'act' );
			// Since this is the lowest level, we don't need `$script .= openTags( $openTags, $increment, 'act' );`
			$script .= "<act id='$increment[act]' name='$array[act]'>\n";
			$increment['scene'] = INDEX_NUMBER;
			$increment['act']++;
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
			$script .= openTags( $openTags, $increment, 'scene' );
			$script .= "<scene id='$increment[scene]' name='$array[scene]'>\n";
			$increment['scene']++;
			$previous = 'scene';
			$openTags[$previous] = 1;
		}
		// Parse lines
		else if ( $previous != 'line' && preg_match( $regex[$parsingType]['line'], $line, $array ) )
		{
			$script .= closeTags( $openTags, 'line' );
			$script .= openTags( $openTags, $increment, 'line' );
			$character = isset( $array['name'] ) ? $array['name'] : '';
			$characterID = '';
			if( $character && isset( $chars[$character] ) )
			{
				$characterID = " characterID='$chars[$character]'";
			}
			else if ( $character )
			{
				$chars[$character] = count($chars) + INDEX_NUMBER;
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
	
	echo "<script title='$title' author='$author'>\n$characters$script</script>\n";
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

/**
 * Open the tags that need to be open before this one can be opened.
 */
function openTags( &$openTags, &$increment, $level = 'line' )
{
	$output = '';

	foreach( array_reverse($openTags) as $tag => $number )
	{
		if ( $tag == $level )
		{
			break;
		}
		if ( $number == 0 )
		{
			$id = $increment[$tag];
			$output .= "<$tag id='$id'>\n";
			$openTags[$tag] = 1;
			$increment[$tag]++;
			if ( $tag == 'act' )
			{
				$increment['scene'] = INDEX_NUMBER;
			}
		}
	}

	return $output;
}