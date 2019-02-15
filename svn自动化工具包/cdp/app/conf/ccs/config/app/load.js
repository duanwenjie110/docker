function addServicePackages()
{
    mainApp.addServicePackage( "FsProxy", "FsProxy" );
    mainApp.addServicePackage( "RealCallMgr", "RealCallMgr" );
}

function addServiceInstances()
{
    mainApp.addServiceInstance( "FsProxy", "FsProxy" );
    mainApp.addServiceInstance( "RealCallMgr", "RealCallMgr" );
}
