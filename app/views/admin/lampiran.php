<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="/../SI_BebasTanggungan_TA/image/icon.png">
        <title>Attachment</title>
        <link rel="stylesheet" href="/../SI_BebasTanggungan_TA/css/Admin/lampiran.css">
    </head>

    <body>
        <div class="container">
            <nav>
                <div class="logo">
                    <img src="/../SI_BebasTanggungan_TA/image/logo.png" alt="SIBETA">
                    <span>SIBETA</span>
                </div>

                <div class="attach">
                    <span>STUDENT ATTACHMENT</span>
                </div>

                <div class="profile">
                    <a href="../Admin/profil.html"><span class="role">Admin</span></a>
                    <img src="/../SI_BebasTanggungan_TA/image/pp.png" alt="Foto Profil" class="pp">
                </div>
            </nav>

            <div class="content">
                <div class="top">
                    <div class="search-container">
                        <form action="#" method="GET">
                            <button type="submit"><img src="/../SI_BebasTanggungan_TA/image/search.png" alt=""></button>
                            <input type="text" placeholder="search here...">
                        </form>
                    </div>
                    <div class="choose">
                        <a href="/../SI_BebasTanggungan_TA/app/view/Admin/verifikasi_all.html" class="aktif">All</a>
                        <a href="/../SI_BebasTanggungan_TA/app/view/Admin/verifikasi.html">Verified</a>
                        <a href="/../SI_BebasTanggungan_TA/app/view/Admin/verifikasi_pending.html">Pending</a>
                        <a href="/../SI_BebasTanggungan_TA/app/view/Admin/verifikasi_unverif.html">Unverified</a>
                    </div>
                </div>

                <div class="data">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>NIM</th>
                                    <th>NAME</th>
                                    <th>DATE</th>
                                    <th>STATUS</th>
                                </tr>
                            </thead>
        
                            <tbody>
                                <tr>
                                    <td class="nim">2341720155</td>
                                    <td class="student">Hasbi Arridwan</td>
                                    <td class="date">2024 - 11 - 19  08:55</td>
                                    <td class="status">Verified</td>
                                </tr>

                                <tr>
                                    <td class="nim">2341720146</td>
                                    <td class="student">Keisya Nisrina Aulia</td>
                                    <td class="date">2024 - 11 - 19  08:42</td>
                                    <td class="status">Pending</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
        
                    <div class="halaman">
                        <button type="button" class="prev">< Previous</button>
                        <button type="button" class="page-number">01 02 03 04 ... 11</button>
                        <button type="button" class="next">Next ></button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>