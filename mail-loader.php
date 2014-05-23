<?php
require('vendor/autoload.php');
$email = 'matthew@example.com';
$subject = 'testing';
$message = 'test message';

// Create the SMTP configuration
$transport = Swift_SmtpTransport::newInstance("localhost", 1025);

// Create the message
$message = Swift_Message::newInstance();
$message->setTo(array(
    "matthew@maltblue.com" => "Matthew Setter",
));
$message->setSubject("This email is sent using Swift Mailer");
$message->setBody("You're our best client ever.");
$message->setFrom("matthew@localhost", "Your bank");

// Send the email
$mailer = Swift_Mailer::newInstance($transport);
$mailer->send($message, $failedRecipients);