<?php
require('config.php');

class CDatabase
{
	# 连接数据库
	# 成功返回true，失败返回false
	public function connect( $dbIp, $dbPort, $dbUser, $dbPass )
	{
		$this->m_mysqli = mysqli_init();
		if( !$this->m_mysqli )
		{
			return false;
		}
		if( !$this->m_mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, DBConnectTimeout) )//设置超时时间
		{
			return false;
		}

		if( !$this->m_mysqli->real_connect('p:'.$dbIp, $dbUser, $dbPass, DBName, $dbPort) )
		{
			return false;
		}
		
		return true;
	}
	
	# 文件是否存在于数据库中
	# 如果文件存在于数据库中，返回true, $mssIp $mssPort返回文件所在的存储服务器地址
	# 如果文件不存在于数据库中，返回false
	public function isFileInDB( $fileName, &$mssIp, &$mssPort )
	{
		$isExist = false;
	
		$sql = "select * from ".DBTable." where filename = '$fileName'";
		if( !$this->queryInner( $sql, $result ) )
			return false;
		
		if( mysqli_num_rows( $result ) > 0 )
		{
			$rows = $result->fetch_all(MYSQLI_BOTH);
			$mssIp = $rows[0]["mssip"];
			$mssPort = $rows[0]["mssport"];
			
			return true;
		}
		else
			return false;
		
	}
	
	# 将文件信息插入到数据库中
	# 成功返回true，失败返回false
	public function insertFileToDB( $fileName, $mssIP, $mssPort, $beginTime, $endTime, $policeId, $fileSize, $playUrl )
	{
		$sql = "insert into ".DBTable." values('$fileName', $fileSize, '$beginTime', '$endTime', '$policeId', '$mssIP', '$mssPort', '$playUrl');";
		if( !$this->queryInner( $sql, $result ) )
			return false;
		
		return true;
	}
	
	private function queryInner( $sql, &$result )
	{
		$result = $this->m_mysqli->query($sql);
		if ( !$result ) 
		{ 
			return false;
		} 
		else 
		{
			return true;
		} 
	}
	
	private $m_mysqli;
}


?>