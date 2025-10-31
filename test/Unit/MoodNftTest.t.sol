// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";

contract MoodNftTest is Test {
    MoodNft moodNft;
    string public constant SAD_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAyNHB4IiBoZWlnaHQ9IjEwMjRweCIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGZpbGw9IiMzMzMiCiAgICAgICAgZD0iTTUxMiA2NEMyNjQuNiA2NCA2NCAyNjQuNiA2NCA1MTJzMjAwLjYgNDQ4IDQ0OCA0NDggNDQ4LTIwMC42IDQ0OC00NDhTNzU5LjQgNjQgNTEyIDY0em0wIDgyMGMtMjA1LjQgMC0zNzItMTY2LjYtMzcyLTM3MnMxNjYuNi0zNzIgMzcyLTM3MiAzNzIgMTY2LjYgMzcyIDM3Mi0xNjYuNiAzNzItMzcyIDM3MnoiIC8+CiAgICA8cGF0aCBmaWxsPSIjRTZFNkU2IgogICAgICAgIGQ9Ik01MTIgMTQwYy0yMDUuNCAwLTM3MiAxNjYuNi0zNzIgMzcyczE2Ni42IDM3MiAzNzIgMzcyIDM3Mi0xNjYuNiAzNzItMzcyLTE2Ni42LTM3Mi0zNzItMzcyek0yODggNDIxYTQ4LjAxIDQ4LjAxIDAgMCAxIDk2IDAgNDguMDEgNDguMDEgMCAwIDEtOTYgMHptMzc2IDI3MmgtNDguMWMtNC4yIDAtNy44LTMuMi04LjEtNy40QzYwNCA2MzYuMSA1NjIuNSA1OTcgNTEyIDU5N3MtOTIuMSAzOS4xLTk1LjggODguNmMtLjMgNC4yLTMuOSA3LjQtOC4xIDcuNEgzNjBhOCA4IDAgMCAxLTgtOC40YzQuNC04NC4zIDc0LjUtMTUxLjYgMTYwLTE1MS42czE1NS42IDY3LjMgMTYwIDE1MS42YTggOCAwIDAgMS04IDguNHptMjQtMjI0YTQ4LjAxIDQ4LjAxIDAgMCAxIDAtOTYgNDguMDEgNDguMDEgMCAwIDEgMCA5NnoiIC8+CiAgICA8cGF0aCBmaWxsPSIjMzMzIgogICAgICAgIGQ9Ik0yODggNDIxYTQ4IDQ4IDAgMSAwIDk2IDAgNDggNDggMCAxIDAtOTYgMHptMjI0IDExMmMtODUuNSAwLTE1NS42IDY3LjMtMTYwIDE1MS42YTggOCAwIDAgMCA4IDguNGg0OC4xYzQuMiAwIDcuOC0zLjIgOC4xLTcuNCAzLjctNDkuNSA0NS4zLTg4LjYgOTUuOC04OC42czkyIDM5LjEgOTUuOCA4OC42Yy4zIDQuMiAzLjkgNy40IDguMSA3LjRINjY0YTggOCAwIDAgMCA4LTguNEM2NjcuNiA2MDAuMyA1OTcuNSA1MzMgNTEyIDUzM3ptMTI4LTExMmE0OCA0OCAwIDEgMCA5NiAwIDQ4IDQ4IDAgMSAwLTk2IDB6IiAvPgo8L3N2Zz4=";

    string public constant HAPPY_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgaGVpZ2h0PSI0MDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiBmaWxsPSJ5ZWxsb3ciIHI9Ijc4IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjMiIC8+CiAgPGcgY2xhc3M9ImV5ZXMiPgogICAgPGNpcmNsZSBjeD0iNzAiIGN5PSI4MiIgcj0iMTIiIC8+CiAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0iMTIiIC8+CiAgPC9nPgogIDxwYXRoIGQ9Im0xMzYuODEgMTE2LjUzYy42OSAyNi4xNy02NC4xMSA0Mi04MS41Mi0uNzMiIHN0eWxlPSJmaWxsOm5vbmU7IHN0cm9rZTogYmxhY2s7IHN0cm9rZS13aWR0aDogMzsiIC8+Cjwvc3ZnPg==";

    address USER = makeAddr("user");

    address ATTACKER = makeAddr("attacker");

    address APPROVED = makeAddr("approved");

    function setUp() public {
        moodNft = new MoodNft(SAD_SVG_IMAGE_URI, HAPPY_SVG_IMAGE_URI);
    }

    function test_viewTokenURI() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function test_MintIncreasesTokenCounterAndAssignsOwner() public {
        vm.prank(USER);
        uint256 startingTokenCounter = moodNft.getTokenCounter();

        vm.prank(USER);
        moodNft.mintNft();

        uint256 newTokenCounter = moodNft.getTokenCounter();
        address owner = moodNft.ownerOf(startingTokenCounter);

        assertEq(
            newTokenCounter,
            startingTokenCounter + 1,
            "Token counter did not increment"
        );

        assertEq(owner, USER, "Minted token not assigned to correct owner");
    }
    function test_flipMoodTogglesCorrectlyByOwner() public {
        uint256 tokenId = 0;

        vm.startPrank(USER);
        moodNft.mintNft();
        vm.stopPrank();

        MoodNft.Mood initialMood = moodNft.getMood(tokenId);
        console.log("Initial mood:", uint256(initialMood)); // 0 = HAPPY, 1 = SAD

        vm.startPrank(USER);
        moodNft.flipMood(tokenId);
        vm.stopPrank();

        MoodNft.Mood moodAfterFirstFlip = moodNft.getMood(tokenId);
        console.log("Mood after first flip:", uint256(moodAfterFirstFlip));

        vm.startPrank(USER);
        moodNft.flipMood(tokenId);
        vm.stopPrank();

        MoodNft.Mood moodAfterSecondFlip = moodNft.getMood(tokenId);
        console.log("Mood after second flip:", uint256(moodAfterSecondFlip));

        assertEq(
            uint256(initialMood),
            uint256(MoodNft.Mood.HAPPY),
            "Expected initial mood to be HAPPY"
        );
        assertEq(
            uint256(moodAfterFirstFlip),
            uint256(MoodNft.Mood.SAD),
            "Expected mood to flip to SAD"
        );

        assertEq(
            uint256(moodAfterSecondFlip),
            uint256(MoodNft.Mood.HAPPY),
            "Expected mood to flip back to HAPPY"
        );
    }

    function test_mintSetsDefaultMoodToHappy() public {
        uint256 tokenId = 0;

        vm.startPrank(USER);
        moodNft.mintNft();
        vm.stopPrank();

        MoodNft.Mood mood = moodNft.getMood(tokenId);
        assertEq(uint256(mood), uint256(MoodNft.Mood.HAPPY));
    }

    function test_flipOwnerRevertsIfNotOwnerOrApproved() public {
        uint256 tokenId = 0;

        vm.startPrank(USER);
        moodNft.mintNft();
        vm.stopPrank();

        vm.prank(ATTACKER);
        vm.expectRevert(
            MoodNft.MoodNft__CantFlipMoodIfNotOwnerOrApproved.selector
        );
        moodNft.flipMood(tokenId);
    }

    function test_tokenURReflectsMoodChange() public {
        uint256 tokenId = 0;

        vm.prank(USER);
        moodNft.mintNft();

        string memory happyTokenUri = moodNft.tokenURI(tokenId);

        vm.prank(USER);
        moodNft.flipMood(tokenId);

        string memory sadTokenUri = moodNft.tokenURI(tokenId);

        assertEq(
            keccak256(abi.encodePacked(happyTokenUri)) ==
                keccak256(abi.encodePacked(sadTokenUri)),
            false,
            "TokenURI should update to reflect mood change"
        );
    }

    function test_tokenURIRevertsForNonExistentTokenId() public {
        vm.prank(USER);
        moodNft.mintNft();
        uint256 invalidId = 1;

        vm.expectRevert("ERC721: invalid token ID");
        moodNft.tokenURI(invalidId);
    }

    function test_baseURIIsCorrect() public view {
        string memory baseUri = moodNft.exposed_baseURI();
        assertEq(baseUri, "data:application/json;base64,");
    }
    function test_contractHasCorrectNameAndSymbol() public view {
        string memory nftName = moodNft.name();
        string memory nftSymbol = moodNft.symbol();

        assertEq(nftName, "MoodNft");
        assertEq(nftSymbol, "MOOD");

        console.log("NFT Name:", nftName);
        console.log("NFT Symbol:", nftSymbol);
    }
    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external pure returns (bytes4) {
        return this.onERC721Received.selector;
    }

    function test_onlyOwnerCanFlipMood() public {
        vm.prank(USER);
        moodNft.mintNft();
        uint256 tokenId = 0;

        vm.prank(ATTACKER);
        vm.expectRevert(
            MoodNft.MoodNft__CantFlipMoodIfNotOwnerOrApproved.selector
        );
        moodNft.flipMood(tokenId);

        vm.prank(USER);
        moodNft.flipMood(tokenId);
        assertEq(uint256(moodNft.getMood(tokenId)), uint256(MoodNft.Mood.SAD));

        vm.prank(USER);
        moodNft.approve(APPROVED, tokenId);

        vm.prank(APPROVED);
        moodNft.flipMood(tokenId);
        assertEq(
            uint256(moodNft.getMood(tokenId)),
            uint256(MoodNft.Mood.HAPPY)
        );
    }

    function _stringContains(
        string memory haystack,
        string memory needle
    ) internal pure returns (bool) {
        bytes memory haystackBytes = bytes(haystack);
        bytes memory needleBytes = bytes(needle);

        if (
            needleBytes.length == 0 || needleBytes.length > haystackBytes.length
        ) {
            return false;
        }

        for (
            uint256 i = 0;
            i <= haystackBytes.length - needleBytes.length;
            i++
        ) {
            bool found = true;
            for (uint256 j = 0; j < needleBytes.length; j++) {
                if (haystackBytes[i + j] != needleBytes[j]) {
                    found = false;
                    break;
                }
            }
            if (found) return true;
        }
        return false;
    }
}
