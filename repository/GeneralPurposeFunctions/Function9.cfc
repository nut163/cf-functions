```coldfusion
<cfcomponent>

    <cffunction name="apiRequest" access="public" returntype="any">
        <cfargument name="url" type="string" required="yes">
        <cfargument name="method" type="string" required="no" default="GET">
        <cfargument name="headers" type="struct" required="no" default="#structNew()#">
        <cfargument name="body" type="any" required="no" default="">
        
        <cfhttp url="#arguments.url#" method="#arguments.method#" result="httpResult">
            <cfloop collection="#arguments.headers#" item="headerKey">
                <cfhttpparam type="header" name="#headerKey#" value="#arguments.headers[headerKey]#">
            </cfloop>
            <cfif arguments.method EQ "POST" OR arguments.method EQ "PUT">
                <cfhttpparam type="body" value="#arguments.body#">
            </cfif>
        </cfhttp>
        
        <cfreturn httpResult>
    </cffunction>

    <cffunction name="parseJsonResponse" access="public" returntype="any">
        <cfargument name="response" type="string" required="yes">
        
        <cfset var parsedResponse = DeserializeJSON(arguments.response)>
        
        <cfreturn parsedResponse>
    </cffunction>

    <cffunction name="logError" access="public" returntype="void">
        <cfargument name="errorMessage" type="string" required="yes">
        
        <cflog file="application" text="#arguments.errorMessage#">
    </cffunction>

</cfcomponent>
```