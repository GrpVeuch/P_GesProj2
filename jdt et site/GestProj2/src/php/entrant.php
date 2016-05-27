<?php
// Author : dasilvafdi
// Date : 20.05.2016 
// Summary : Formular to add entrant

// Includes header and menu
include_once("../../resources/lib/header.php");
include_once("../../resources/lib/menu.php");

include_once("../../resources/lib/db/dbConnection.php");

?>

    <html>
    <body>
    <!-- Title -->
    <!-- section initialise -->
    <section>
        <div class="col-lg-12">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
                <!-- Form and validation form initialise -->
                <form method="post" action="addTeacher.php" enctype="multipart/form-data">
                    <h3>Informations personnelles</h3>
                    <input type="text" autocomplete="off" name="firstName" class="form-control"
                           placeholder="Nom de Famille">
                    <br>
                    <input type="text" autocomplete="off" name="lastName" class="form-control" placeholder="Prénom">
                    <br>
                    <input type="text" autocomplete="off" name="phone" class="form-control"
                           placeholder="Numéro de téléphone">
                    <br>
                    <input type="text" autocomplete="off" name="avs" class="form-control" placeholder="AVS">
                    <br>

                    <h3>Coordonnées</h3>
                    <input type="text" autocomplete="off" name="phone" class="form-control"
                           placeholder="Numéro de téléphone">
                    <br>

                    <h3>Votre adresse</h3>
                    <input type="text" autocomplete="off" name="address" class="form-control" placeholder="Adresse">
                    <br>
                    <input type="text" autocomplete="off" name="zip" class="form-control" placeholder="Code postal">
                    <br>
                    <input type="text" autocomplete="off" name="city" class="form-control" placeholder="Ville">
                    <br>
                    <button style="width: 100%" class="btn btn-success" type="submit"> Ajouter</button>

                </form>
            </div>
            <div class="col-lg-3"></div>
        </div>
        <!-- // End table -->
        <!-- // End forme -->
    </section>
    <!-- // End section -->
    </body>
    </html>
<?php

// Includes header and menu

include_once("../../resources/lib/footer.php");