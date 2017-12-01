<?php
/**
 * @brief: A script for parsing text files into script XML.
 *
 * Usage: php setup.php inputfile.txt outputfile.xml [options]
 * `php setup.php data/TheInterview.txt output/theinterview.xml`
 * `php setup.php data/1524.txt output/1524.xml parsingType=shakes`
 * Can also be run from the web:
 * `setup.php?filename=data%2F1524.txt&parsingType=shakes`
 * `setup.php?filename=data%2FTheInterview.txt`
 * @author: zjd7@students.calvin.edu (earboxer)
 */
$filename = isset($_GET['filename']) ? $_GET['filename'] :
	(isset($argv[1]) ? $argv[1] : '');
$hash = hash('crc32', time());
$outfilename = isset( $argv[2] ) ? $argv[2] : "tmp/outfile-$hash.xml";

$options = array(
	'parsingType' => isset($_GET['parsingType']) ? $_GET['parsingType'] : 'default',
);

if ( isset($argc) && $argc > 3 )
{
	for ($i=3; $i < count($argv); $i++) { 
		$parts = explode('=', $argv[$i]);
		if ( count($parts) == 2 )
			$options[$parts[0]] = $parts[1];
	}
}

if ( $filename )
{
	include "parse.php";
	ini_set('memory_limit', -1);
	echo parse($filename, $outfilename, $options);
}
else
{
	echo "error";
}