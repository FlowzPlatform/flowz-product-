export default{
    // loginUrl : "http://ec2-54-88-11-110.compute-1.amazonaws.com/api/login",
    // ldapLoginUrl : "http://ec2-54-88-11-110.compute-1.amazonaws.com/api/ldapauth",
    loginUrl: "http://auth."+process.env.domainkey+"/api/login",
    ldapLoginUrl: "http://auth."+process.env.domainkey+"/api/ldapauth",
    // registrationUrl : "http://api."+process.env.domainkey+"/serverapi/register",
    registrationUrl : "http://auth."+process.env.domainkey+"/api/dashboardpass",
    feathersServiceBaseUrl :  "http://api."+process.env.domainkey+"/serverapi/",
    facebookSuccessCallbackUrl : "http://dashboard."+process.env.domainkey,
    loginWithFacebookUrl : "http://auth."+process.env.domainkey+"/auth/facebook",
    googleSuccessCallbackUrl : "http://dashboard."+process.env.domainkey,
    loginWithGoogleUrl : "http://auth."+process.env.domainkey+"/auth/Gplus",
    getAllPermissionsUrl : "http://api."+process.env.domainkey+"/authldap/getallpermission/",
    setPermissionUrl : "http://api."+process.env.domainkey+"/authldap/setpermission",
    subscriptionUrl: "http://api."+process.env.domainkey+"/subscription/"
}