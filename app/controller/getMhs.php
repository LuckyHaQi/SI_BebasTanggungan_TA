<?php

require_once '../model/SuperAdmin.php';


$admin = $_SESSION['superAdmin'];

$allMahasiswa = $admin->getMahasiswa();
