<html lang="en">
<head>
	<cfprocessingdirective pageencoding="utf-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Haberler</title>
    <link rel="stylesheet" href="style.css">
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
            <div class="news">
                <cfparam name="url.ID" default="0">
				<cfquery name="GetArticles" datasource="workCubeDSN">
				    SELECT Title, Detail, ID, TopicID
				    FROM News
				    WHERE ID = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
				</cfquery>
				<cfif GetArticles.RecordCount>
					<cfoutput query="GetArticles">  
		        	<article>
		            	<h3>#GetArticles.Title#</h3>
		            	<p>#GetArticles.Detail#</p>
		            	<a href="update.cfm?id=#GetArticles.ID#" class="update-button">Güncelle</a>
		            	</article>
		            </cfoutput>
				<cfelse>
				    <p>Haber Bulunamadı.</p>
				</cfif>
            </div>
		</div>
</body>
</html>

