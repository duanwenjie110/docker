<?php
require('config.php');
require('common.php');
require('database.php');

class UploadProcessing
{
	function __construct()
	{
		$this->policeID = '';
		$this->tempFileName = '';
		$this->beginTime = '';
		$this->endTime = '';
		$this->fileSize = '';
		$this->fileName = '';
		$this->playUrl = '';
		
		$this->db = new CDatabase;
	}
	
	protected function isPreprocessing()
	{
		return count($_POST) != 0;
	}
	
	protected function delTempFile($tempFileName)
	{
		$filePath = tempPath.'/'.$tempFileName;
		#如果文件不存在，返回成功
		if(!file_exists($filePath))
			return true;
		
		return unlink($filePath);
	}

	#移动临时文件
	protected function moveFile($tempFileName, $fileName)
	{
		# 原文件不存在
		if(!file_exists(tempPath.'/'.$tempFileName))
			return false;
		
		#目的目录不存在
		if(!file_exists(workPath."/$this->policeID"))
		{
			#创建目录
			if(!mkdir(workPath."/$this->policeID"))
				return false;		
		}
		
		#如果已经在正式目录下有此文件，rename也会成功
		return rename(tempPath.'/'.$tempFileName, workPath."/$this->policeID".'/'.$fileName);	
	}

	#删除正式目录下的文件
	protected function delWorkFile($filename)
	{	
		$filePath = workPath."/$this->policeID/".$filename;
		#如果文件不存在，返回成功
		if(!file_exists($filePath))
			return true;
		
		#删除文件后，如果目录为空，是否删除此目录，暂不作处理
		
		return unlink($filePath);
	}

	#文件是否已存在于本服务
	protected function isExistingInLocalServer($dbIP, $dbPort, $localIp, $uploadPort)
	{
		return ($dbIP == $localIp) && ($dbPort == $uploadPort); 	
	}
	
	protected function getParams()
	{
		#通过_SERVER获取提交的各字段的值
		$this->tempFileName = $_SERVER['HTTP_SESSION_ID'];
		$this->policeID = $_SERVER['HTTP_POLICEID'];
		$this->beginTime = $_SERVER['HTTP_STARTTIME'];
		$this->endTime = $_SERVER['HTTP_ENDTIME'];
		$this->fileSize = $_SERVER['HTTP_FILESIZE'];
		$disposition = explode('"',$_SERVER['HTTP_CONTENT_DISPOSITION']);
		if(COUNT($disposition) == 0)
		{
			return false;
		}
		$this->fileName = $disposition[1];
		$this->playUrl = "http://".localIp.":".playPort."/work/".$this->policeID."/".$this->fileName;
		return true;
	}
	
	
	public function process()
	{
		if(!$this->getParams())
		{
			$this->setHeader('HTTP/1.1 520 get params failed');
			$this->mss_log('[upload] error: get params failed');
			return;
		}
		
		#如果预处理失败
		if(!$this->isPreprocessing())
		{
			$this->setHeader('HTTP/1.1 520 pre-process failed');
			$this->mss_log('[upload] error: pre-process failed');
			return;
		}

		$freeSpace = 0;
		#如果获取空闲容量失败
		if(!$this->getFreeSpace($freeSpace))
		{
			#删除临时文件
			if(!$this->delTempFile($this->tempFileName))
			{
				#返回错误
				$this->setHeader('HTTP/1.1 520 del temp file failed');
				$this->mss_log('[upload] error: del temp file failed');
				return;
			}
			
			#返回错误
			$this->setHeader('HTTP/1.1 520 get free space failed');
			$this->mss_log('[upload] error: get free space failed');
			return;
		}

		#获取空闲容量成功，写日志
		#成功是否有必要写日志，会导致日志文件不断增大，暂时去掉
		$this->mss_log("[upload] free space: $freeSpace");

		#如果移动临时文件到正式目录失败
		if(!$this->moveFile($this->tempFileName, $this->fileName))
		{
			#删除临时文件
			if(!$this->delTempFile($this->tempFileName))
			{
				#返回错误
				$this->setHeader('HTTP/1.1 520 del temp file failed');
				$this->mss_log('[upload] error: del temp file failed');
				return;
			}
			
			#返回错误
			$this->setHeader('HTTP/1.1 520 move file failed');
			$this->mss_log('[upload] error: move file failed');
			return;
		}

		$dbIP = '';
		$dbPort = 0;		
		#连接数据库
		if( !$this->connectDB(DBIP,DBPort,DBUserName,DBPassword) )
		{
			#删除正式目录下的文件
			if(!$this->delWorkFile($this->fileName))
			{
				#返回错误
				$this->setHeader('HTTP/1.1 520 del work file failed');
				$this->mss_log('[upload] error: del work file failed');
				return;
			}
			
			#返回错误
			$this->setHeader('HTTP/1.1 520  connect database failed');
			$this->mss_log('[upload] error: connect database failed');
			return;
		}


		#文件在数据库中不存在
		if(!$this->isFileInDB($this->fileName, $dbIP, $dbPort))
		{
			#写数据库失败
			if(!$this->insertFileToDB($this->fileName, localIp, uploadPort, $this->beginTime, $this->endTime, $this->policeID, $this->fileSize, $this->playUrl))
			{
				#删除正式目录下的文件
				if(!$this->delWorkFile($this->fileName))
				{
					#返回错误
					$this->setHeader('HTTP/1.1 520 del work file failed');
					$this->mss_log('[upload] error: del work file failed');
					return;
				}
				
				#返回错误
				$this->setHeader('HTTP/1.1 520  write database failed');
				$this->mss_log('[upload] error: write database failed');
				return;
			}	
			else
			{
				#写数据库成功，返回成功及容量
				$this->setHeader('HTTP/1.1 200 OK');
				$this->setBody("Freespace: $freeSpace");
				return;	
			}
		}
		else
		{
			#文件已存在于数据库中
			$this->setHeader('HTTP/1.1 200 OK');
			
			#文件不存在于本服务
			if(!$this->isExistingInLocalServer($dbIP, $dbPort, localIp, uploadPort))
			{
				#删除正式目录下的文件
				if(!$this->delWorkFile($this->fileName))
				{
					#返回成功及容量
					$this->setBody("Freespace: $freeSpace");
					$this->mss_log('[upload] error: del work file failed');
					return;
				}
				#返回成功及容量
				$this->setBody("Freespace: $freeSpace");
				$this->mss_log("[upload] notise: file is existing in DB.");
				return;			
			}
			else
			{
				#返回成功及容量
				$this->setBody("Freespace: $freeSpace");
				$this->mss_log("[upload] notise: file is existing in DB.");
				return;	
			}	
		}
	}
	
	protected function mss_log($message)
	{		
		$curTime = date("Y-m-d").date(" H:i:s");
		
		#日志写入失败，不用处理
		error_log("$curTime $message, policeID: $this->policeID, filename: $this->fileName, tempFileName: $this->tempFileName\n", 3, LOGPATH);
		return;
	}
	
	protected function setHeader($message)
	{
		header($message);
	}
	
	protected function setBody($message)
	{
		echo $message;
	}
	
	protected function getFreeSpace(&$freeSpace)
	{
		return getFreeSpace(totalSpace, $freeSpace);
	}
	
	protected function connectDB( $dbIp, $dbPort, $dbUser, $dbPass )
	{
		return $this->db->connect($dbIp, $dbPort, $dbUser, $dbPass);
	}
	
	protected function isFileInDB( $fileName, &$dbIP, &$dbPort )
	{
		return $this->db->isFileInDB($fileName, $dbIP, $dbPort);
	}
	
	protected function insertFileToDB( $fileName, $localIp, $uploadPort, $beginTime, $endTime, $policeID, $fileSize, $playUrl )
	{
		return $this->db->insertFileToDB($fileName, $localIp, $uploadPort, $beginTime, $endTime, $policeID, $fileSize, $playUrl);
	}
	
	private $policeID;
	private $tempFileName;  #临时文件名
	private $beginTime;
	private $endTime;
	private $fileSize;
	private $fileName;  #正式文件名
	private $playUrl;
	
	private $db;
		
}


?>