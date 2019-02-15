<?php
require('config.php');
require('common.php');

class CGetFreeSpace 
{
	function __construct()
	{
		$this->freespace='';
	}
	
	public function process()
	{
		if( !$this->getFreeSpace() )
		{
			$this->setHeader("HTTP/1.1 520 GetFreeSpace Failed");
			return;
		}
		else
		{
			echo "FreeSpace:".$this->freespace;
			return;
		}	
	}	
	
	public function getFreeSpace()
	{
		return getFreeSpace(totalSpace,$this->freespace);
	}
	
	protected function setHeader($message)
	{
		header($message);
	}
	
	public $freespace;
}
?>