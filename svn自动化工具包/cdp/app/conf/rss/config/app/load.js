function addServicePackages()
{    
    mainApp.addServicePackage( "LinkMgr", "LinkMgr" );
		mainApp.addServicePackage( "LoadBalanceMgr", "LoadBalanceMgr" );
    mainApp.addServicePackage( "RssService", "RssService" );
}

function addServiceInstances()
{   
    mainApp.addServiceInstance( "LinkMgr", "LinkMgr" );
		mainApp.addServiceInstance( "LoadBalanceMgr", "LoadBalanceMgr" );
		mainApp.addServiceInstance( "RssService", "RssService" );
}
