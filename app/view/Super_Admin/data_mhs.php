<?php

include '../controller/getAdmin.php';
include '../controller/getMhs.php';
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Data List</title>
        <link rel="stylesheet" href="/../SI_BebasTanggungan_TA/css/Super_Admin/data.css">
    </head>

    <body>
        <div class="container">
            <nav>
                <div class="profile">
                    <span class="role">Super Admin</span>
                    <img src="/../SI_BebasTanggungan_TA/image/pp.png" alt="Foto Profil" class="pp">
                </div>
            </nav>
            
            <div class="menu-container">
                <div class="logo">
                    <img src="/../SI_BebasTanggungan_TA/image/logo.png" alt="SIBETA">
                    <span>SIBETA</span>
                </div>
                
                <div class="menu">
                    <a href="add_mhs.html">Add User Account</a>
                    <div class="pilih">
                        <a href="data_mhs.html" class="aktif">Data List</a>
                    </div>
                    <a href="log.html">Admin Log Activity</a>
                    <a href="verifikasi_all.html">Verification Activity</a>
                    <a href="module.html">Module</a>
                </div>
            </div>

            <div class="content">
                <div class="top">
                    <h2>Data List</h2>

                    <div class="top2">
                        <div class="search-container">
                            <form action="#" method="GET">
                                <button type="submit"><img src="/../SI_BebasTanggungan_TA/image/search.png" alt=""></button>
                                <input type="text" placeholder="search here...">
                            </form>
                        </div>

                        <div class="choose">
                            <a href="data_mhs.html" class="aktif">Mahasiswa</a>
                            <a href="data_adm.html">Admin</a>
                        </div>
                    </div>
                </div>

                <div class="data">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>NIM</th>
                                    <th>Name</th>
                                    <th>Major</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                </tr>
                            </thead>
        
                            <tbody>
                                <tr>
                                    <td class="nim">2341720146</td>
                                    <td class="nama">Keisya Nisrina Aulia</td>
                                    <td class="major">D-IV Informatics Engineer</td>
                                    <td class="email"><u>keisya.aulia@gmail.com</u></td>
                                    <td class="password">adbyc12@1as</td>
                                </tr>
                                <tr>
                                    <td class="nim">2340271532</td>
                                    <td class="nama">Azka Cahya</td>
                                    <td class="major">D-IV Informatics Engineer</td>
                                    <td class="email"><u>azka.cahya@gmail.com</u></td>
                                    <td class="password">azkacahya@94</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
        
                    <div class="halaman">
                        <button type="button" class="prev">< Previous</button>
                        <div>
                            <button type="button" class="page-number">01 02 03 04 ... 11</button>
                        </div>
                        <button type="button" class="next">Next ></button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>