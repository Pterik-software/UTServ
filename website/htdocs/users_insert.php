<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
$servername = "localhost";
$username = "test";
$password = "test123";
$database = "utilbills";

$link = mysqli_connect(
            $servername,
            $username, 
            $password, 
            $database);
mysqli_set_charset($link, "utf8");
if (!$link) {
   printf("Невозможно подключиться к базе данных. Код ошибки: %s\n", mysqli_connect_error());
   exit;
}
if ($result = mysqli_query($link, 'select user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date from users')) {
    print("insert into users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) values ");
	$first_line = TRUE;
    while( $row = mysqli_fetch_assoc($result) ){
		if ($first_line==FALSE)
			{printf("%s",',');}
		else 
			{$first_line=FALSE;}
		printf("%s\n",'<br>');
		printf("(%s, '%s','%s', '%s','%s', %b,", $row['user_id'], $row['full_name'], $row['user'], $row['password'], $row['role_id'], $row['is_active']);
		if (is_null($row['hiring_date']))
			{ printf("%s", 'NULL,');}
		else 
			{ printf("%s'%s'%s", 'CAST(', $row['hiring_date'], ' AS DATE),');};
		if (is_null($row['closure_date']))
			{ printf("%s", 'NULL');}
		else 
			{ printf("%s'%s'%s", 'CAST(', $row['closure_date'], ' AS DATE)');};
		printf("%s",')');
    }
	printf("%s",';');
    mysqli_free_result($result);
}
mysqli_close($link);;
?>