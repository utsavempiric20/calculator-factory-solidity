// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./Calculator.sol";

contract UsersFactory {
    Calculator[] calculators;

    function createCalculator() public {
        Calculator calc = new Calculator();
        calculators.push(calc);
    }

    function additionCalc(address calc, uint256 num1, uint256 num2) public {
        Calculator(calc).addition(num1, num2, msg.sender);
    }

    function subtractionCalc(address calc, uint256 num1, uint256 num2) public {
        Calculator(calc).subtraction(num1, num2, msg.sender);
    }

    function multiplicationCalc(
        address calc,
        uint256 num1,
        uint256 num2
    ) public {
        Calculator(calc).multiplication(num1, num2, msg.sender);
    }

    function divisionCalc(address calc, uint256 num1, uint256 num2) public {
        Calculator(calc).division(num1, num2, msg.sender);
    }

    function getSingleCalculation(
        address calc
    )
        public
        view
        returns (
            uint256 num1,
            uint256 num2,
            uint256 result,
            Calculator.Operators operator
        )
    {
        return Calculator(calc).getCalculation(msg.sender);
    }

    function getHistory(
        address calc
    ) public view returns (Calculator.Calculation[] memory) {
        return Calculator(calc).getHistory(msg.sender);
    }

    function getCalculatorUsers() public view returns (Calculator[] memory) {
        return calculators;
    }
}
