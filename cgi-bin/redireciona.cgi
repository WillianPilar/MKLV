#!/bin/bash
cat <<EOFFF
content-type: text/html

<html>
	<head>
		<meta http-equiv="refresh" content="1;URL=../$1">
	</head>

	<body>
		<h1>Redirecionando...</h1>
	</body>
</html>
EOFFF
