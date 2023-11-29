<html lang="en">
<head>
    <cfprocessingdirective pageencoding="utf-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Haberler</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function showSuccessMessage(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="navbar">
            <div class="logo">
                <a href="index.cfm">LOGO</a>
                <span class="site-title"><a href="index.cfm">Haberler</a></span>
            </div>
            <ul>               
                <li><a href="getJsonData.cfm">Json Data</a></li>
                <li><a href="breakingNews.cfm">Son Dakika</a></li>
                <li><a href="world.cfm">Dünya</a></li>
                <li><a href="economy.cfm">Ekonomi</a></li>
                <li><a href="technology.cfm">Teknoloji</a></li>
                <li><a href="sport.cfm">Spor</a></li>
                <li><a href="culture.cfm">Kültür</a></li>                          
            </ul>
        </div>                
        <div class="textarea">
            <cfform id="form1">
                <cfparam name="url.ID" default="0">
                <cfquery name="GetArticles" datasource="workCubeDSN">
                    SELECT Title, Detail, ID, TopicID
                    FROM News
                    WHERE ID = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
                </cfquery>
                <cfif GetArticles.RecordCount>
                    <cfoutput query="GetArticles">
                        <form action="update.cfm" method="post">
                            <cfinput type="hidden" name="id" value="#GetArticles.ID#">
                            <label for="title">Başlık:</label>
                            <cftextarea name="title" id="title" required="true" richtext="true" toolbar="Basic" >#GetArticles.Title#</cftextarea>
                            <label for="detail">Detay:</label>
                            <cftextarea name="detail" id="detail" required="true" richtext="true" toolbar="Basic">#GetArticles.Detail#</cftextarea>
						 	<div class="button-container">
								<input type="submit" value="Güncelle" class="update-button" name="update">
                            	<input type="submit" value="Sil" class="delete-button" name="delete">
                            </div>
                        </form>
                    </cfoutput>
                <cfelse>
                    <p>Haber Bulunamadı.</p>
                </cfif>
            </cfform>
        </div> 
        <div class="textarea">
        	<cfif structKeyExists(form, "update")>
            <cfform id="form2" action="update.cfm" method="post">
                <cfparam name="url.id" default="0">
                <cfparam name="form.title" type="string" default="">
                <cfparam name="form.detail" type="string" default="">
                <cfquery name="UpdateArticle" datasource="workCubeDSN">
                    UPDATE News
                    SET
                    Title = <cfqueryparam value="#form.title#" cfsqltype="cf_sql_varchar">,
                    Detail = <cfqueryparam value="#form.detail#" cfsqltype="cf_sql_varchar">
                    WHERE ID = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
                </cfquery>
                <cfset variables.formSubmitComplete = true />
                 <p>Haber başarıyla güncellendi.</p>
                 <cflocation url="article.cfm?id=#url.id#" addtoken="false">      
            </cfform>
            </cfif>
        </div>
        <cfif structKeyExists(form, "delete")>
                <cfparam name="url.id" default="0">
                <cfquery name="DeleteArticle" datasource="workCubeDSN">
                    DELETE FROM News
                    WHERE ID = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
                </cfquery>
                <cfset variables.formSubmitComplete = true />
 		   <script>
       		 showSuccessMessage("Haber başarıyla silindi.");
    	   </script>
			</cfif> 
    	</div>
</body>
</html>


