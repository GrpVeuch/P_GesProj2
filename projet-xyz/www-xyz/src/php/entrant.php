<?php
// Author : dasilvafdi
// Date : 20.05.2016 
// Summary : Formular to add entrant

// Includes header and menu
include_once ("header.php");
include_once ("menu.php");

?>

	<html>
		<body>
			<!-- Title -->
			<h2>
				Ajouter d'un participant
			</h2>
			<!-- section initialise -->
			<section>
				<!-- Form and validation form initialise -->
				<form name="" action="" method="post">
					<table style="...">

						<!-- Name entry -->
						<tr>
							<td>
								Nom
							</td>
						</tr>
						<tr>
							<td>
								<input id="name" type="text" name="lastName">
							</td>
						</tr>

						<!-- First name entry -->
						<tr>
							<td>
								Prénom
						</tr>
						<tr>
							<td>
								<input id="firstName" type="text" name="firstName">
							</td>
						</tr>

						<!-- Nickname entry -->
						<tr>
							<td>
								Surnom
							</td>
						</tr>
						<tr>
							<td>
								<input id="nickname" type="text" name="nickname">
							</td>
						</tr>

						<!-- Address entry -->
						<tr>
							<td>
								Adresse
							</td>
						</tr>
						<tr>
							<td>
								<input id="origin" type="text" name="origin">
							</td>
						</tr>

						<!-- Mail entry  -->
						<tr>
							<td>
								Mail
							</td>
						</tr>
						<tr>
							<td>
								<input id="origin" type="text" name="origin">
							</td>
						</tr>
						
						<!-- Phone number entry  -->
						<tr>
							<td>
								Téléphone
							</td>
						</tr>
						<tr>
							<td>
								<input id="origin" type="text" name="origin">
							</td>
						</tr>
						
						<!-- AVS number entry  -->
						<tr>
							<td>
								AVS
							</td>
						</tr>
						<tr>
							<td>
								<input id="origin" type="text" name="origin">
							</td>
						</tr>
						
						<!-- Form sender -->
						<tr>
							<td>
								<input class="button" id="input" type="submit">
							</td>
						</tr>
					</table>
					<!-- // End table -->
				</form>
				<!-- // End forme -->
			</section>
			<!-- // End section -->
		</body>
	</html>
<?php

// Includes header and menu
include_once ("footer.php");