# Revolut
Swift SDK for the Revolut Open Business API

## Getting Started

Set the API Key on application start in `application:didFinishLaunchingWithOptions` of the app's delegate:

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // MARK: Set your Revolut API Key
    // It should have one of the following formats:
    //
    // Sandbox: sand_XXXXXXX
    // Production: prod_XXXXXXX
    
    Revolut.configure("sand_XXXXXXX")

```

Now you're able to call the endpoints below.

## [Accounts](https://revolutdev.github.io/business-api/#accounts)

### [Get Accounts](https://revolutdev.github.io/business-api/#get-accounts)
This endpoint retrieves your accounts.

```
Revolut.shared.accounts(
    completionHandler: ([Account]?, Error?) -> Void
)
```

### [Get Account](https://revolutdev.github.io/business-api/#get-account)
This endpoint retrieves one of your accounts by ID.

### [Get Account Details](https://revolutdev.github.io/business-api/#get-account-details)
This endpoint retrieves individual account details.

## [Counterparties](https://revolutdev.github.io/business-api/#counterparties)
Before a transfer or payment can be made, you need to add the counterparties with which you intend to transact with.

### [Add Revolut Counterparty](https://revolutdev.github.io/business-api/#add-revolut-counterparty)
You can create a counterparty for an existing Revolut user.

### [Add non-Revolut Counterparty](https://revolutdev.github.io/business-api/#add-non-revolut-counterparty)
You can create a counterparty for an non-Revolut bank account.

### [Delete Counterparty](https://revolutdev.github.io/business-api/#delete-counterparty)
This endpoint deletes a counterparty with the given ID. Once a counterparty is deleted no payments can be made to it.

### [Get Counterparty](https://revolutdev.github.io/business-api/#get-counterparty)
This endpoint retrieves a counterparty by ID.

### [Get Counterparties](https://revolutdev.github.io/business-api/#get-counterparties)
This endpoint retrieves all your counterparties.

## [Payments](https://revolutdev.github.io/business-api/#payments)
All incoming and outgoing payments are represented as transactions and are processed in two stages from the user's perspective:

1. a new transaction is created,
2. the created transaction is processed, i.e.
- credit/debit on both sides of transaction if Revolut-to-Revolut,
- posted to the external payment network (Faster Paymetns, SEPA, SWIFT etc.).

A new transaction has pending state, and a processed transaction's state can be one of `completed`, `failed`, `reverted` or `declined`.

### [Transfer](https://revolutdev.github.io/business-api/#transfer)
This endpoint processes transfers between accounts of the business with the same currency.

### [Create Payment](https://revolutdev.github.io/business-api/#create-payment)
This endpoint creates a new payment. If the payment is for another Revolut account, business or personal, the transaction may be processed synchronously.

### [Schedule Payment](https://revolutdev.github.io/business-api/#schedule-payment)
It is possible to schedule an internal payments for up to 30 days ahead. Scheduling external payments is not supported at the moment. Scheduled payments must be in the currency of the account from which you pay. 

### [Check Payment Status](https://revolutdev.github.io/business-api/#check-payment-status)
This endpoint retrieves transaction details by transaction ID or by request ID. It also allows you to find out more about the transaction, such as cardholder details for card payments.

### [Cancel Payment](https://revolutdev.github.io/business-api/#cancel-payment)
This endpoint allows to cancel a scheduled transaction that was initiated by you, via API.

### [Get Transactions](https://revolutdev.github.io/business-api/#get-transactions)
This endpoint retrieves historical transactions based on the provided query criteria.

```
Revolut.shared.transactions(
    where: [Revolut.TransactionsFilter],
    completionHandler: (([Transaction]?, Error?) -> Void)
)
```

## [Webhooks](https://revolutdev.github.io/business-api/#web-hooks)
Web-hook is a mechanism that allows you to receive updates about your account to an HTTPS endpoint provided by you. When a supported event occurs, a notification will be posted, via HTTP POST method, to the specified endpoint. If the receiver returns an HTTP error response, there will be two more consequent attempts for delivery.

Currently the following events are supported:

* Transaction Creation (TransactionCreated)
* Transaction State Change (TransactionStateChanged)


## Errors
The API may return one of the following errors:

| Error                    | Description |
| :---                     | :--- |
| **.badRequest**          | Your request is invalid. |
| **.unauthorized**        | Your API key is wrong. |
| **.forbidden**           | Access to the requested resource or action is forbidden. |
| **.notFound**            | The requested resource could not be found. |
| **.methodNotAllowed**    | You tried to access an endpoint with an invalid method. |
| **.notAcceptable**       | You requested a format that isn't JSON. |
| **.unprocessableEntity** | The server response does not match the expected format. |
| **.tooManyRequests**     | You're sending too many requests. |
| **.internalServerError** | We had a problem with our server. Try again later. |
| **.serviceUnavailable**  | We're temporarily offline for maintenance. Please try again later. |
