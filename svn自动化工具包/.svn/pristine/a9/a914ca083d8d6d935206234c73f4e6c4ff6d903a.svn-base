<?php
require('config.php');
require('common.php');
class CDeleteVideoProcessing
{
	function __construct()
	{
		$this->params=$_POST;
		$this->fileName="";
		$this->policeID="";
	}
	
	protected function deleteVideo($policeID,$fileName)
	{
		// 删除正式文件
		if(file_exists(workPath.'/'.$policeID.'/'.$fileName))
		{		
			if(!unlink(workPath.'/'.$policeID.'/'.$fileName))
			{
				return false;
			}	
			else
			{
				return true;
			}
		}
		else
		{
			$this->mss_log("[delete] info ：file not exist");
			return true;
		}
	}
	//获取post的参数
	protected function getParam()
	{
		if( isset($this->params["Filename"]) && isset($this->params["PoliceID"]))
		{
			$this->fileName = $this->params["Filename"];
			$this->policeID = $this->params["PoliceID"];
			return true;
		}
		else
		{
			return false;
		}
	}

	protected function setHeader($message)
	{
		header($message);
	}
	
	protected function mss_log($message)
	{
		$curTime = date("Y-m-d").date(" H:i:s");	
		#日志写入失败，不用处理
		error_log("$curTime $message, policeID: $this->policeID, filename: $this->fileName\n", 3, LOGPATH);
		return;
	}

	public function process()
	{
		if(!$this->getParam())
		{
			$this->setHeader("HTTP/1.1 520 GetParam Failed");
			$this->mss_log("[delete] error ：getParam failed");
			return;
		}

		if(!$this->deleteVideo( $this->policeID, $this->fileName ))
		{
			$this->setHeader("HTTP/1.1 520 Del File Failed");
			$this->mss_log("[delete] error ：del file failed");
			return;
		}
		else
		{
			$this->mss_log("[delete] info ：del file success");
			return;
		}
	}
	protected  $fileName;
	protected  $policeID;
	protected  $params;
}
?>