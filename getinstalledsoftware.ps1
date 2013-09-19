$System=Get-WmiObject -Class Win32_OperatingSystem -Computer .
		$system=$System.CSName
		$appList=get-WmiObject -Class Win32_Product
		
		$installedsoftware=@()
	 
		$compname = Get-Content env:computername

		Foreach($app in $appList){
			$properties=@{
				Source = $compname
				Name = $app.name;
				Version = $app.version
				}
			$software = New-Object -TypeName PSObject -Property $properties
		 	$installedsoftware += $software
		}
		
		$installedsoftware
