<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<?= IMAGE; ?>icon.png">
    <link rel="stylesheet" href="<?= CSS; ?>profil.css">
    <title>Profile</title>
</head>

<body>
    <div class="container">
        <nav>
            <div class="logo">
                <img src="<?= IMAGE; ?>logo.png" alt="SIBETA">
                <span>SIBETA</span>
            </div>

            <div class="home-h">
                <a href="<?= BASEURL; ?>/Mahasiswa/home">HOME</a>
            </div>

            <div class="notif">
                <img src="<?= IMAGE; ?>notification.png" alt="">
            </div>

            <div class="profile aktif" onclick="window.location.href='<?= BASEURL; ?>/mahasiswa/profil'">
                <span class="role aktif"><?= $data['nim']; ?></span>
                <img src="<?= IMAGE; ?>pp.png" alt="Foto Profil" class="pp">
            </div>
        </nav>

        <div class="content">
            <div class="top">
                <span>Profile</span>
            </div>
            <form action="<?= BASEURL; ?>/Mahasiswa/edit" method="post">
                <div class="data-content">
                    <div class="photo">
                        <img src="<?= IMAGE; ?>pp.png" alt="Foto Profil">
                    </div>

                    <div class="cont">
                        <div class="data">

                            <input type="hidden" name="nim" value="<?= $data['nim']; ?>">

                            <div class="isi e">
                                <label for="nama">Name :</label>
                                <input type="text" name="nama" value="<?= $data['nama']; ?>">
                            </div>

                            <div class="isi e">
                                <label for="email">Email :</label>
                                <input type="text" name="email" value="<?= $data['email']; ?>">
                            </div>

                            <div class="isi e">
                                <label for="password">Password :</label>
                                <input type="text" name="password" value="<?= $data['password']; ?>">
                            </div>
                        </div>

                        <div class="btn">
                            <input type="submit">
                            <button><a href="<?= BASEURL; ?>/Mahasiswa/profil">Cancel</a></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>

</html>