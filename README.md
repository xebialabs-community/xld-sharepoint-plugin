# Preface #

This document describes the functionality provided by the Sharepoint plugin.

See the **XL Deploy Reference Manual** for background information on XL Deploy and deployment concepts.

# Overview #

The Sharepoint plugin is a XL Deploy plugin that adds capability for deploying a sharepoint solution towards a sharepoint instance.

## Types ##

+ SharePoint Solution. 
  * `artifact`: specify the solution file to be deployed.  

# Troubleshooting #

Situation:  XL Deploy running on Windows 2012 server, connecting to Sharepoint Windows 2012, so we used WINRM_NATIVE for connectivity.  This connection worked fine.   But, using the plugin to deploy a simple website, we ran into SharePoint permissions issues.

In the end, we:

1. Used this post to fix the "local farm" issue from SharePoint: http://community.bamboosolutions.com/blogs/bambooteamblog/archive/2014/01/02/fix-for-the-local-farm-is-not-accessible-cmdlets-with-featuredependencyid-are-not-registered.aspx

2. Then, we followed the directions for enabling a multi-hop station (https://docs.xebialabs.com/xl-deploy/how-to/set-up-credssp-for-a-winrm-connection.html)
