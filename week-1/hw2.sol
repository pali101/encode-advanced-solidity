// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract DynamicArray {
    // Function to remove multiple values from an array at specified indices
    function removeArrayValues(
        uint256[] memory array,
        uint256[] memory indices
    ) public pure returns (uint256[] memory) {
        require(indices.length <= array.length, "Too many indices to delete");

        // sort indices array
        for (uint256 i = 0; i < indices.length; i++) {
            for (uint256 j = i + 1; j < indices.length; j++) {
                if (indices[i] < indices[j]) {
                    (indices[i], indices[j]) = (indices[j], indices[i]);
                }
            }
        }

        uint256 length = array.length;

        // Delete each element at the specified indices
        for (uint256 i = 0; i < indices.length; i++) {
            uint256 index = indices[i];
            require(index < array.length, "Array index out of bound");
            array[index] = array[array.length - (i + 1)];
            length--;
        }

        // Create a new array with only remaining elements
        uint256[] memory newArray = new uint256[](length);
        for (uint256 i = 0; i < newArray.length; i++) {
            newArray[i] = array[i];
        }
        return newArray;
    }
}
