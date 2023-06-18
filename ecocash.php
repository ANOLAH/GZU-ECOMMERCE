<?php

// Include the Paynow PHP SDK library
require_once 'vendor/autoload.php';

use Paynow\Integrations\Integrations;
use Paynow\Payments\Payment;

// Set up your API keys
$integrationId = '16186';
$integrationKey = '07d6f404-9375-4c62-9274-356aa26e137f';
$integration = new Integrations($integrationId, $integrationKey, Integrations::getTestUrl());

// Check if the payment form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get the payment details from the form
    $name = $_POST['name'];
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];
    $amount = $_POST['amount'];

    // Create a payment request
    $payment = $integration->createPayment('Order #1234', $email);
    $payment->add('Item 1', $amount, 'SKU001');
    $payment->setMobile($mobile);
    $payment->setMethod(Payment::ECOCASH);
    $response = $payment->send();

    // Check the payment status
    if ($response->success()) {
        // Payment was successful
        $statusResponse = $integration->pollTransaction($response->pollUrl());
        if ($statusResponse->status() == PaymentStatus::AWAITING_DELIVERY) {
            // Redirect the user to the payment confirmation page
            header("Location: payment-confirmation.php");
            exit();
        } else {
            // Payment was not successful
            $error = $statusResponse->getError();
            $message = "Payment was not successful: " . $error->getMessage();
        }
    } else {
        // Payment request failed
        $error = $response->getError();
        $message = "Payment request failed: " . $error->getMessage();
    }
}

// Display the payment form
?>
<html>
<head>
    <title>Paynow Payment Form</title>
</head>
<body>
    <?php if (isset($message)) { ?>
        <p><?php echo $message; ?></p>
    <?php } ?>
    <form method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required><br>
        <label for="email">Email:</label>
        <input type="email" name="email" required><br>
        <label for="mobile">Mobile:</label>
        <input type="tel" name="mobile" required><br>
        <label for="amount">Amount:</label>
        <input type="number" name="amount" step="0.01" required><br>
        <button type="submit">Pay Now</button>
    </form>
</body>
</html>