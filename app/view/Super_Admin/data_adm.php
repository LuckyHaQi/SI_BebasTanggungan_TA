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
                            <a href="data_mhs.html">Mahasiswa</a>
                            <a href="data_adm.html" class="aktif">Admin</a>
                        </div>
                    </div>
                </div>

                <div class="data">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Role</th>
                                    <th>NIP</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                </tr>
                            </thead>
        
                            <tbody>
                                <tr>
                                    <td class="peran">Technician</td>
                                    <td class="nip">-</td>
                                    <td class="nama">Budi Santoso</td>
                                    <td class="email"><u>budiSantoso23@polinema.ac.id</u></td>
                                    <td class="password">BudiS1023</td>
                                </tr>

                                <tr>
                                    <td class="peran">Major Admin</td>
                                    <td class="nip">3201568512</td>
                                    <td class="nama">Siti Aminah</td>
                                    <td class="email"><u>sitiAminah@polinema.ac.id</u></td>
                                    <td class="password">Amin@h79</td>
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