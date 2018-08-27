﻿<#
MIT License
------------

Copyright 2018 Sql Undrcover

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files 
(the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, 
publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
#>

#import dbatools
Import-Module dbatools

#configuration variables
$ConfigServer = "{configuration instance}"
$SQLUndercoverDatabase = "SQLUndercover"
$ScriptVersion = "0.1.0"

Clear-Host

####################     Get configuration parameters from catalogue.configPoSH   #######################################

Write-Host "=============================================================================" -ForegroundColor White -BackgroundColor Black
Write-Host "|                         .lkx;.        'lkx,                               |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                        .oNMMNk:.  .;lxXWMW0'                              |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                        :XMMMMMWKOOKWMMMMMMWd.                             |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                       .kWMMMMMMMMMMMMMMMMMMX:                             |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                       cXMMMMMMMMMMMMMMMMMMMWx.                            |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                      .kWMMMMMMMMMMMMMMMMMMMMX:                            |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                      ;KMMMMMMMMMMMMMMMMMMMMMWd.                           |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                      oWMMMMMMMMMMMMMMMMMMMMMMK,                           |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                     .OMMMMMMMMMMMMMMMMMMMMMMMNl                           |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                     .;codxkkOO00KKKKKK00OOkxoc'                           |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                               ..........                                  |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                                                 .                         |" -ForegroundColor White -BackgroundColor Black
Write-Host "|            ..,:loxk0Oxoc:,'..............',;:ldk0Okdoc;'..                |" -ForegroundColor White -BackgroundColor Black
Write-Host "|      .,:ldOKXNWMMMMMMMMMWWNNXKKKKKKKKKKXXNNWMMMMMMMMMMWNX0Odl:'.          |" -ForegroundColor White -BackgroundColor Black
Write-Host "|   .lkKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKkc.       |" -ForegroundColor White -BackgroundColor Black
Write-Host "|   'd0NWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWXOl.       |" -ForegroundColor White -BackgroundColor Black
Write-Host "|     .';coxO0XNWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWNNK0kdl:,.          |" -ForegroundColor White -BackgroundColor Black
Write-Host "|            ..',;:clodxkkO00KKKKXXXXXXXKKKK0OOkxddolc:,,'..                |" -ForegroundColor White -BackgroundColor Black
Write-Host "|          .:dxdolc'  .,,''''',''',,,,,''''''.'',,.  .coodxkxc.             |" -ForegroundColor White -BackgroundColor Black
Write-Host "|        'l0WMMMMMMK; ;0NXXKK000Od:,,cdkOOO00KKXNk.  cNMMMMMMWXxc.          |" -ForegroundColor White -BackgroundColor Black
Write-Host "|     .;xXWMMMMMMMMMK:.;kXWWMWWXd'   ..:ONWMWWNKd'  .xWMMMMMMMMMWXkc.       |" -ForegroundColor White -BackgroundColor Black
Write-Host "|   .cONMMMMMMMMMMMMMXl. .,:c:;.        .';cc;,.   .dNMMMMMMMMMMMMMWXk:.    |" -ForegroundColor White -BackgroundColor Black
Write-Host "|   .;clodkOKNWWMMMMMMNd.                       .;xXWMMMMMMMWNX0Okdolc;.    |" -ForegroundColor White -BackgroundColor Black
Write-Host "|           .',:ldk0NWMW0:                    .cONMMMMNKOxoc;'..            |" -ForegroundColor White -BackgroundColor Black       
Write-Host "|                 .:OWMMMNx'                .lKWMMMMWKo'.                   |" -ForegroundColor White -BackgroundColor Black           
Write-Host "|               .;xXWMMMMMWXo.            .c0WMMMMMMMWXOd:'.                |" -ForegroundColor White -BackgroundColor Black            
Write-Host "|              'xXWMMMMMMMMMWKo'         ,kWMMMMMMMMMWX0kd:.                |" -ForegroundColor White -BackgroundColor Black            
Write-Host "|              ..,cdOKNWMMMMMMMXd,.    .cKMMMMMMWN0xl;..                    |" -ForegroundColor White -BackgroundColor Black                
Write-Host "|                    .,cx0NWMMMMMNO; .,dNMMMMWKkl,.                         |" -ForegroundColor White -BackgroundColor Black                    
Write-Host "|                        .':dOXWMMXc.dXNMMMXkc.                             |" -ForegroundColor White -BackgroundColor Black                        
Write-Host "|                             .:oOo.lNMMWKo,                                |" -ForegroundColor White -BackgroundColor Black                          
Write-Host "|                                  '0MWXo.                                  |" -ForegroundColor White -BackgroundColor Black                           
Write-Host "|                                  cKkl,                                    |" -ForegroundColor White -BackgroundColor Black                            
Write-Host "|                                  ;c.                                      |" -ForegroundColor White -BackgroundColor Black                                                                      
Write-Host "=============================================================================" -ForegroundColor White -BackgroundColor Black
Write-Host "|                           Undercover Catalogue                            |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                               version 0.1                                 |" -ForegroundColor White -BackgroundColor Black
Write-Host "|                          ©2018 sqlundercover.com                          |" -ForegroundColor White -BackgroundColor Black
Write-Host "=============================================================================" -ForegroundColor White -BackgroundColor Black
Write-Host "=============================================================================" -ForegroundColor White -BackgroundColor Black
Write-Host "getting configuration parameters..." -ForegroundColor Yellow

$Config = Invoke-DbaSqlQuery -ServerInstance $ConfigServer -Database $SQLUndercoverDatabase -Query "SELECT ParameterName, ParameterValue FROM catalogue.configPoSH" -As DataSet

$dbatoolsRequiredVersion = $Config.Tables[0].Select("ParameterName = 'DBAToolsRequirement'").ItemArray[1].ToString()
$CatalogueVersion = $Config.Tables[0].Select("ParameterName = 'CatalogueVersion'").ItemArray[1].ToString()
$AutoDiscoverInstances = $Config.Tables[0].Select("ParameterName = 'AutoDiscoverInstances'").ItemArray[1].ToString()
$AutoUpdate = $Config.Tables[0].Select("ParameterName = 'AutoUpdate'").ItemArray[1].ToString()
$AutoInstall= $Config.Tables[0].Select("ParameterName = 'AutoInstall'").ItemArray[1].ToString()

####################     Display congif info    #########################################################################

Write-Host "Undercover Catalogue Version:" $CatalogueVersion -ForegroundColor Green
Write-Host "Central Configuration Server:" $ConfigServer -ForegroundColor Green
Write-Host "SQL Undercover Database:" $SQLUndercoverDatabase -ForegroundColor Green


####################     Check dbatools is installed and at supported version    ########################################

$module =Get-Module dbatools

If ($module.Version -lt $dbatoolsRequiredVersion) {Throw "Your either don't have dbatools installed or your installed module doesn't meet the required version.  Check out dbatools.io for full details."}
ELSE
{Write-Host "dbatools, installed version: "$module.Version ", required version: "$dbatoolsRequiredVersion -ForegroundColor Green}

####################    Check Script Version Matches Config Database Version     ########################################

If ($ScriptVersion -eq $CatalogueVersion) {Write-Host "Config Version Check - OK" -ForegroundColor Green}
ELSE
{Throw "There is a version mismatch between the Powershell collector and the version of the Catalogue config database"}

###################    auto discover SQL instances     ##################################################################

If ($AutoDiscoverInstances -eq "1")
{
    Write-Host "Auto Discover Instances: Enabled" -ForegroundColor Green
    Write-Host "Discovering SQL Instances..." -ForegroundColor Yellow

    $SQLServers = [System.Data.Sql.SqlDataSourceEnumerator]::Instance.GetDataSources()

    #for each instance discovered
    ForEach ($SQLServer IN $SQLServers.rows)
    {

    If ($SQLServer.ItemArray[1].ToString() -eq [String]::Empty) #if instance is a default instance
    {
        #create insert command where instance is a default instance
        $InsertCmd = "IF NOT EXISTS (SELECT 1 FROM Catalogue.ConfigInstances 
                        WHERE ServerName = '" + $SQLServer.ItemArray[0].ToString() + "')
                        INSERT INTO Catalogue.ConfigInstances(ServerName, Active) 
                        VALUES('" + $SQLServer.ItemArray[0].ToString() + "',0)"
    }
    else
    {
        #create insert command where instance is a named instance
        $InsertCmd = "IF NOT EXISTS (SELECT 1 FROM Catalogue.ConfigInstances 
                        WHERE ServerName = '" + $SQLServer.ItemArray[0].ToString() + "\" + $SQLServer.ItemArray[1].ToString() + "')
                        INSERT INTO Catalogue.ConfigInstances(ServerName, Active) 
                        VALUES('" + $SQLServer.ItemArray[0].ToString() + "\" + $SQLServer.ItemArray[1].ToString() + "',0)"
    }

    Invoke-DbaSqlQuery -ServerInstance $ConfigServer -Database $SQLUndercoverDatabase -Query $InsertCmd
    }
}
Else
{
Write-Host "Auto Discover Instances: Disabled" -ForegroundColor Yellow
}

####################    update catalogue     ##########################################################################

#get all instances
$Instances = Invoke-DbaSqlQuery -ServerInstance $ConfigServer -Database $SQLUndercoverDatabase -Query "SELECT [ServerName] FROM Catalogue.ConfigInstances WHERE Active = 1" -As DataSet

#get all active modules
$Modules = Invoke-DbaSqlQuery -ServerInstance $ConfigServer -Database $SQLUndercoverDatabase -Query "SELECT [ModuleName], [GetProcName], [UpdateProcName], [StageTableName], [MainTableName] FROM Catalogue.ConfigModules WHERE Active = 1" -As DataSet

#for every instance in the ConfigInstances table
ForEach ($instance in $Instances.Tables[0].Rows)
{
    Try
    {
        Write-Host "Interrogating Instance: "$instance.ItemArray[0].ToString() "..." -ForegroundColor Yellow

        Write-Host "Checking Local Catalogue Version..." -ForegroundColor Yellow
        #check local catalogue version
        $LocalConfig = Invoke-DbaSqlQuery -ServerInstance $instance.ItemArray[0].ToString() -Database $SQLUndercoverDatabase -Query "SELECT ParameterName, ParameterValue FROM catalogue.configPoSH" -As DataSet -WarningVariable WarningMessage
        $LocalCatalogueVersion = $LocalConfig.Tables[0].Select("ParameterName = 'CatalogueVersion'").ItemArray[1].ToString()
        If ($LocalCatalogueVersion -eq $CatalogueVersion) #if catalogue version ok, carry on with interrogation
        {Write-Host "Version Check OK" -ForegroundColor Green
        #for every active module in the ConfigModules table
        ForEach ($row in $Modules.Tables[0].Rows)
        {
            Write-Host "   Processing Module: "$row.ItemArray[0].ToString() "..." -ForegroundColor Yellow

            #set execution variables
            $GetProcName = "EXEC Catalogue." + $row.ItemArray[1].ToString()
            $UpdateProcName = "EXEC Catalogue." + $row.ItemArray[2]
            $StageTableName = $row.ItemArray[3].ToString()

            #process module
            #Run the get procedure against remote instance
            $DataSet = Invoke-DbaSqlQuery -ServerInstance $instance.ItemArray[0].ToString() -Database $SQLUndercoverDatabase -Query $GetProcName -As DataSet
            #insert data from get procedure into staging table on central server
            Write-DbaDataTable -SqlServer $ConfigServer -InputObject $DataSet.Tables[0] -Database $SQLUndercoverDatabase -Schema "Catalogue" -Table $StageTableName -Truncate -confirm:$false
            #run the update procedure on the central server
            Invoke-DbaSqlQuery -ServerInstance $ConfigServer -Database $SQLUndercoverDatabase -Query $UpdateProcName
            }
        }
        Else {
        $ErrorMessage = "The Catalogue version on " + $instance.ItemArray[0].ToString() + " does not match the configuration database.  Interrogation cannot continue."
    Throw $ErrorMessage}
    }
    catch
    {
        Write-Host "Interrogation encountered an error and could not continue." -ForegroundColor Red
        #Write-Host $WarningMessage -ForegroundColor Red
        #if version mismatch
        If ($Error[0].Exception.Message -like "*The Catalogue version*") 
        #if auto update is enabled
        {
            Write-Host $Error[0].Exception.Message -ForegroundColor Red
            If ($AutoUpdate -eq 1)
                {Write-Host "***Auto-update enabled but is not available in this release, update the Undercover Catalogue manually on the remote host***" -ForegroundColor Yellow}
            Else
                {Write-Host "Auto-update Disabled, update the Undercover Catalogue manually on the remote host or enable auto-update" -ForegroundColor Yellow}
        }
        ElseIf ($WarningMessage -like "*Cannot open database*") 
                {
            Write-Host "Cannot access Catalogue, install Catalogue on remote host or allow access" -ForegroundColor Red
            If ($AutoInstall -eq 1)
                {Write-Host "***Auto-install enabled but is not available in this release, install the Undercover Catalogue manually on the remote host***" -ForegroundColor Yellow}
            Else
                {Write-Host "Auto-install Disabled, install the Undercover Catalogue manually on the remote host or enable auto-install" -ForegroundColor Yellow}
        }
        Else
        {
            Write-Host "An fatal error occured during interrogation" -ForegroundColor Red
        }
    }
}

Write-Host "Interrogation Completed" -ForegroundColor Green