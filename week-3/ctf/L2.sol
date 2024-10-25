// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

/* 
  interface Isolution2 {
    function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
  }
*/

contract Level2Template {
    function solution(
        uint256[10] calldata unsortedArray
    ) external returns (uint256[10] memory sortedArray) {
        // TODO: Implement your solution here.
        sortedArray = unsortedArray;
        for (uint8 i = 0; i < unsortedArray.length; i++) {
            uint8 minIndex = i;
            for (uint8 j = i + 1; j < sortedArray.length; j++) {
                if (sortedArray[j] < sortedArray[minIndex]) {
                    minIndex = j;
                }
            }

            if (minIndex != i) {
                uint256 temp = sortedArray[i];
                sortedArray[i] = sortedArray[minIndex];
                sortedArray[minIndex] = temp;
            }
        }
    }
}
