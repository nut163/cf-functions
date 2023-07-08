```coldfusion
<cfcomponent>

    <!--- Function to make a GET request to an API --->
    <cffunction name="apiGetRequest" access="public" returntype="any">
        <cfargument name="url" type="string" required="yes">
        
        <cfset var result = "">
        
        <cfhttp url="#arguments.url#" method="get" result="result">
        </cfhttp>
        
        <cfreturn result>
    </cffunction>
    
    <!--- Function to parse JSON response --->
    <cffunction name="parseJsonResponse" access="public" returntype="any">
        <cfargument name="jsonResponse" type="string" required="yes">
        
        <cfset var parsedResponse = DeserializeJSON(arguments.jsonResponse)>
        
        <cfreturn parsedResponse>
    </cffunction>
    
    <!--- Function to log errors --->
    <cffunction name="logError" access="public" returntype="void">
        <cfargument name="errorMessage" type="string" required="yes">
        
        <cflog file="errorLog" text="#arguments.errorMessage#">
    </cffunction>

</cfcomponent>
```