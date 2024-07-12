// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Calculator {
    struct Calculation {
        uint256 num1;
        uint256 num2;
        uint256 result;
        Operators operator;
    }

    enum Operators {
        ADD,
        SUB,
        MUL,
        DIV
    }

    mapping(address => Calculation) user;
    mapping(address => Calculation[]) history;

    function addition(uint256 num1, uint256 num2, address _user) public {
        uint256 result = num1 + num2;
        storeCalculation(num1, num2, result, Operators.ADD, _user);
    }

    function subtraction(uint256 num1, uint256 num2, address _user) public {
        uint256 result = num1 - num2;
        storeCalculation(num1, num2, result, Operators.SUB, _user);
    }

    function multiplication(uint256 num1, uint256 num2, address _user) public {
        uint256 result = num1 * num2;
        storeCalculation(num1, num2, result, Operators.MUL, _user);
    }

    function division(uint256 num1, uint256 num2, address _user) public {
        require(num2 != 0, "0 is not Valid.");
        uint256 result = num1 / num2;
        storeCalculation(num1, num2, result, Operators.DIV, _user);
    }

    function storeCalculation(
        uint256 _num1,
        uint256 _num2,
        uint256 _result,
        Operators _operator,
        address _user
    ) public {
        Calculation memory calculation = Calculation({
            num1: _num1,
            num2: _num2,
            result: _result,
            operator: _operator
        });
        user[_user] = calculation;
        history[_user].push(calculation);
    }

    function getCalculation(
        address _user
    )
        public
        view
        returns (uint256 num1, uint256 num2, uint256 result, Operators operator)
    {
        Calculation memory calculation = user[_user];
        return (
            calculation.num1,
            calculation.num2,
            calculation.result,
            calculation.operator
        );
    }

    function getHistory(
        address _user
    ) public view returns (Calculation[] memory) {
        return history[_user];
    }
}
