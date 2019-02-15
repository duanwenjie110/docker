<?php

#获取空闲容量
function getFreeSpace($totalSpace, &$freeSpace)
{
	# du -sm 
	# shell_exec需要在安全模式下运行，这里改用exec
	exec("du -sm ".SAVEPATH." | awk '{print int($1)}'", $result, $ret);
	#du -sm data | awk '{print int($1)}'
	
/*	$space = explode('	',$result[0]);
	if(COUNT($space) == 0)
	{
		return false;
	}
*/	

	if(COUNT($result) == 0)
	{
		return false;
	}
	
	if($ret == 0)
	{
		$freeSpace = $totalSpace - (int)($result[0]); 
		return true;
	}
	
	return false;	
}

?>