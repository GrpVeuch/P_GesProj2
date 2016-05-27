<?php

/**
 * Author: sallaino
 * Date: 23.03.2016
 * Summary:
 */

/**
 * Modification by: sallaino
 * Date: 18.05.2016
 * Modification: update of the function updateTeacher() with the new parameter '$modifiedBy'
 *               modification of the deletePersonData(). The delete function is now an update function. The teacher is not delete in the data base in case it to back up it.
 */

class dbConnection {

    /**
     * Connection to the database
     * Do the request
     * Retrives data
     * Disconnect the database
     *
     * @return mixed
     */
    public function getAllTeachers(){


        $bdd = $this->dbConnect();

        $valueDb = $this->executeSqlRequest($bdd, 'SELECT * FROM t_teacher INNER JOIN t_section ON fkSection = idSection');

        $this->dbDisconnect($bdd);

        return $valueDb;

    } // end getAllTeachers()
    /**
     * Connect the database
     * @return PDO
     */
    public function dbConnect(){


        /** Connection to the database **/
        try

        {

            $bdd = new PDO('mysql:host=localhost;dbname=db_formation;charset=utf8', 'root', '');

        }
        /** Send the error **/
        catch (Exception $e)

        {

            die('Erreur : ' . $e->getMessage());

        }

        return $bdd;
    } // end dbConnect()

    /**
     * Disconnect the database
     * @param $db
     */
    public function dbDisconnect($db){

        unset($db);

    } // end dbDisconnect()

    /**
     *  Make request and search the data
     * @param $bdd
     * @return mixed
     */
    public function executeSqlRequest($bdd, $sqlRequest){

        //
        $query = $bdd->prepare($sqlRequest);
        $query->execute();

        //
        $fetchAll = $query->fetchAll();
        return $fetchAll;

    } // end executeSqlRequest()

    /**
     * Get the teacher's data
     * @param $idTeacher
     * @return all teacher data
     */
    public function getPersonDetail($idTeacher){

        $sql = ('SELECT * FROM t_teacher INNER JOIN t_section ON fkSection = idSection WHERE idTeacher =' . $idTeacher);

        $bdd = $this->dbConnect();

        $valueDb = $this->executeSqlRequest($bdd,$sql );


        $this->dbDisconnect($bdd);
        return $valueDb[0];

    } // end getPersonDetail()


    /**
     * Delete the teacher's data
     * @param $idTeacher = the id of the teacher
     * @return mixed
     */
    public function deletePersonData($idTeacher){

        $sql = ("UPDATE t_teacher SET isDelete='1' WHERE idTeacher='$idTeacher'");

        $bdd = $this->dbConnect();

        $valueDb = $this->executeSqlRequest($bdd,$sql);

        $this->dbDisconnect($bdd);

        return $valueDb;
    } // end deleteTeacher()

    /**
     * add the teacher in the data base
     * @param $lastName
     * @param $firstName
     * @param $gender
     * @param $pseudo
     * @param $nickNameOrigin
     * @param $section
     * @param $pathPictureDB
     * @return all teacher data
     */
    public function addTrainer($lastName,$firstName,$numPhone, $Street, $PostalCode,$City,$email)
    {
        // SQL request to execute.
        $sql = "INSERT INTO t_teacher (idTeacher,teaLastName,teaFirstName,teaPhone,teaStreet,teaPostalCode,teaCity,teaMail) VALUES (NULL, '$lastName','$firstName', '$numPhone', '$Street', '$PostalCode','$City','$email')";

        $bdd = $this->dbConnect();

        $valueDb = $this->executeSqlRequest($bdd,$sql);

        $this->dbDisconnect($bdd);

        return $valueDb;

    }// end of addTeacher()


    /**
     * update the teacher's data
     * @param $lastName = lastname of the teacher
     * @param $firstName = firstname of the teacher
     * @param $gender = gender of the teacher
     * @param $nickName = nickname of the teacher
     * @param $Origin = origin of the nickname
     * @param $section = section of the teacher
     * @param $idTeacher = id of the teacher
     * @param $modifiedBy = the person that modified the teacher
     * @return The teacher's value that will be update
     */
    public function updateTeacher($lastName,$firstName, $gender, $nickName, $Origin, $section, $idTeacher,$modifiedBy)
    {
        // sql request
        $sql = ("UPDATE t_teacher SET teaLastName='$lastName',teaFirstName ='$firstName',teaGender= '$gender',teaNickName='$nickName',teaOrigin='$Origin',fkSection='$section',teaModifiedBy ='$modifiedBy ' WHERE idTeacher='$idTeacher' ");

        // New connection to the database and execution of the request
        $bdd = $this->dbConnect();
        $valueDb = $this->executeSqlRequest($bdd,$sql);

        // Disconnection of the database
        $this->dbDisconnect($bdd);

        return $valueDb;

    }// end of addTeacher()

    /**
     * @param $pseudo
     * @return mixed
     */
    public function login($pseudo)
    {

        // Instantiates the function
        $bdd = $this->dBConnect();

        $member = $this->executeSqlRequest($bdd, "SELECT * FROM t_user WHERE useName = '$pseudo'");

        return $member[0];

    } //end login()

   /* public function register($pseudo,$password)
    {

        $hashPassword = password_hash($password,PASSWORD_BCRYPT);

        $priority = 0;

        // SQL request to execute.
        $sql = "INSERT INTO t_user (idUser,useName,usePassword,usePriority) VALUES (NULL, '$pseudo','$hashPassword',$priority)";

        $bdd = $this->dbConnect();

        $valueDb = $this->executeSqlRequest($bdd,$sql);

        $this->dbDisconnect($bdd);

        return $valueDb;

    } //end login()*/

}