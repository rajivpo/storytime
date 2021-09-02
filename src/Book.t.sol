pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Book.sol";

contract BookTest is DSTest {
    Book book;

    function setUp() public {
        book = new Book();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
