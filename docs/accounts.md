# Accounts

This guide walks you through retrieving information about relevant bank accounts. It allows to get list of bank accounts with information about their owner (company) with recent transaction history. API is usable only for users that have passive disposition rights to at least one bank account belonging to any of his/her related companies.

[`AccountsResource`](../CSCorporateSDK/AccountsResource.swift)

```swift

    // Get AccountsResource Instance
    let accountsResource = corporateClient.accounts
    
```

## 1\. List all relevant bank accounts

You can list all of the relevant accounts by calling the `list` method on [`AccountsResource`](../CSCorporateSDK/AccountsResource.swift). The method takes object with properties such as pageSize or sortBy as a parameter. See all parameters in [`AccountsParameters`](../CSCorporateSDK/AccountsParameters.swift).

```swift

    // List all accounts
    corporateClient.accounts
        .list(accountsParameters, callback: {
            accounts in
            //Do something with accounts
        });

```

## 2. Get account balance

Get account balance by getting the [BalanceResource](../CSCorporateSDK/BalanceResource.swift) and then calling the `get` method. For complete response see [AccountBalance](../CSCorporateSDK/AccountBalance.swift)

```swift

    // Account balance
    corporateClient.accounts
        .withId(id)
        .balance
        .get({
            balance in
            //Do something with the balance
        });

```

## 3. List account transactions

List account transactions by getting the [TransactionsResource](../CSCorporateSDK/TransactionsResource.swift) and then calling the `list` method. The method takes object with properties such as pageSize or sortBy as a parameter. See all parameters in [TransactionsParameters](../CSCorporateSDK/TransactionsParameters.swift).

```swift

    // Account transactions
    corporateClient.accounts
        .withId(id)
        .transactions
        .list(transactionsParameters, callback: {
            transactions in
            //Do something with transactions
        });

```