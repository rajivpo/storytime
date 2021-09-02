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

    function test_initial_value() public {
        assertEq(book.read(), "Once upon a time");
    }

    function test_extending_story() public {
        book.extendStory("in a galaxy far away");
        assertEq(book.read(), "Once upon a time in a galaxy far away");
    }

    function test_extending_story_too_far() public {
        try book.extendStory("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") {
            fail();
        } catch {}
    }
}
