<cfhttp url="https://dummyjson.com/posts" method="get" result="httpResult">

<cfset responseText = httpResult.fileContent>
<cfset jsonData = deserializeJSON(responseText)>

<!DOCTYPE html>
<html lang="en">
	<cfprocessingdirective pageencoding="utf-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" href="style.css">
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
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Posts from dummyjson.com</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      
    }
    pre {
      background-color: #f4f4f4;
      padding: 20px;
      border-radius: 5px;
      overflow-x: auto;
      box-sizing: border-box;
      white-space: pre-wrap;
    }
  </style>
</head>
<body>
  <h1>Posts from dummyjson.com</h1>
  <div>
    <pre id="jsonDataDisplay"></pre>
  </div>
  <script>
    var jsonData = <cfoutput>#serializeJSON(jsonData)#</cfoutput>;
    document.getElementById('jsonDataDisplay').textContent = JSON.stringify(jsonData, null, 2);
  </script>
</body>
</html>

