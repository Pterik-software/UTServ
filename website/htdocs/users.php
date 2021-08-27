<?php
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
    print("Пользователи<br>\n");
    while( $row = mysqli_fetch_assoc($result) ){
        printf("%s (%s)<br>\n", $row['full_name'], $row['user']);
    }
    mysqli_free_result($result);
}
mysqli_close($link);;
?>