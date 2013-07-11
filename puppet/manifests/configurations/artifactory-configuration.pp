#Apache as proxy server
import "configurations/httpd-default-configuration"
$httpsRedirects = [{path => "/artifactory", redirectPath => "http://localhost:8081/artifactory"}]

#client configuration
$artifactory_server_address="172.18.2.1:8081" # ipaddress:port or domainname:port or proxyaddress
$maven_user="go"
$m2_folder="/var/go/.m2" # Expand users ~/.m2