pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {
    // Create necessary variables.
    address payable account_one;
    address payable account_two;
    address public last_to_withdraw;
    uint public last_withdraw_amount;
    uint public contract_balance;

    // Define withdraw function
    function withdraw(uint amount, address payable recipient) public {
        require(recipient == account_one || recipient == account_two, "Account mismatch. 😮");
        require(address(this).balance >= amount, "Account funds insufficient.");
        if (last_to_withdraw != recipient) {
            last_to_withdraw = recipient;
          }

        recipient.transfer(amount);
        last_withdraw_amount = amount;
        contract_balance = address(this).balance - amount;
    }

    // Define public payable depositl function
    function deposit() public payable {
        contract_balance = address(this).balance;
    }

    // Define set_accounts function
    function set_ccounts(address payable account_1, address payable account_2) public {
        // Set account_one, account_two to account1, account2
        account_one = account_1;
        account_two = account_2;
    }

    // Add fallback
    function() external payable {}
}
