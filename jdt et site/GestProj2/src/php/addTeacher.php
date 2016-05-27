<?php

/**
 * Author: sallaino
 * Date: 16.03.2016
 * Summary:
 */

include_once("../../resources/lib/header.php");
include_once("../../resources/lib/menu.php");

include_once("../../resources/lib/db/dbConnection.php");

?>
<body>
<div class="col-lg-12">
    <div class="col-lg-1"></div>
    <div class="col-lg-10 table-responsive">

        <?php

        // Connection to the database
        $sql = new dbConnection();

        // Set the post in a variable
        $firstName = $_POST["firstName"];
        $lastName = $_POST["lastName"];
        $email = $_POST["email"];
        $zip = $_POST["zip"];
        $city = $_POST["city"];
        $phone = $_POST["phone"];
        $address = $_POST["address"];


        //add teacher in DB
        $sql->addTrainer($firstName, $lastName, $phone, $address, $zip, $city, $email);


        header("location:index.php")

        ?>

    </div>
    <div class="col-lg-1"></div>
</div>
<?php

include_once("../../resources/lib/footer.php")

?>
