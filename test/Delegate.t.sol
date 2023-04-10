// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Delegate.sol";
import "../src/AttackDelegate.sol";

contract D31eg4t3Test is Test {

    address owner = 0x0000000000000000000000000000000000000001;
    address attacker = 0x0000000000000000000000000000000000000003;

    D31eg4t3 public d31eg4t3;
    AttackD31eg4t3 public attackD31eg4t3;

    function setUp() public {
        vm.prank(owner);
        d31eg4t3 = new D31eg4t3();
        
        vm.prank(attacker);
        attackD31eg4t3 = new AttackD31eg4t3(address(d31eg4t3));
    }

    function testAttack() public {        
        
        // owner of D31eg4t3 is owner
        assertEq(owner, d31eg4t3.owner());
        
        // contract is not hacked yet by attacker
        assertFalse(d31eg4t3.canYouHackMe(attacker));

        // we now attack the D31eg4t3 to update the owner
        attackD31eg4t3.hackTheD31eg4t3();

        // owner of D31eg4t3 is now the attacker
        assertEq(attacker, d31eg4t3.owner());

        // contract is now hacked by attacker
        assertTrue(d31eg4t3.canYouHackMe(attacker));
    }
}
