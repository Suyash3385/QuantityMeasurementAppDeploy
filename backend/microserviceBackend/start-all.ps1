$services = @("eureka-server", "api-gateway", "auth-service", "user-service", "measurement-service")
foreach($service in $services) {
    Write-Host "Starting $service..."
    cd $PSScriptRoot\$service
    
    # Run maven command in background process
    Start-Process -NoNewWindow -FilePath ".\mvnw.cmd" -ArgumentList "spring-boot:run" -RedirectStandardOutput "$PSScriptRoot\$service.log" -RedirectStandardError "$PSScriptRoot\$service-error.log"
}
Write-Host "All services are starting. Check logs for details."
cd $PSScriptRoot
