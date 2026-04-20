---
title: "2078. Two Furthest Houses With Different Colors"
difficulty: "Easy"
excerpt: "A straightforward approach to finding the maximum distance between two houses of different colors."
---

## Problem Statement

There are `n` houses evenly lined up on the street, and each house is beautifully painted. You are given a **0-indexed** integer array `colors` of length `n`, where `colors[i]` represents the color of the `ith` house.

Return the **maximum** distance between **two** houses with **different** colors.

The distance between the `ith` and `jth` houses is `|i - j|`, where `|x|` is the absolute value of `x`.

**Example 1:**
```text
Input: colors = [1,1,1,6,1,1,1]
Output: 3
Explanation: In the above image, color 1 is blue, and color 6 is red.
The furthest two houses with different colors are house 0 and house 3.
House 0 has color 1, and house 3 has color 6. The distance between them is abs(0 - 3) = 3.
Note that houses 3 and 6 can also produce the optimal answer.
```

**Example 2:**
```text
Input: colors = [1,8,3,8,3]
Output: 4
Explanation: In the above image, color 1 is blue, color 8 is yellow, and color 3 is green.
The furthest two houses with different colors are house 0 and house 4.
House 0 has color 1, and house 4 has color 3. The distance between them is abs(0 - 4) = 4.
```

**Constraints:**
- `n == colors.length`
- `2 <= n <= 100`
- `0 <= colors[i] <= 100`
- Test data are generated such that at least two houses have different colors.

---

## Logic & Intuition

Given the small constraints ($N \le 100$), we can use a straightforward brute force approach. We pair up every single house with every other house that comes after it. For each pair `(i, j)`, we check if the color of house `i` is different from the color of house `j`. If they are different, we calculate the distance between them as `j - i` and keep track of the maximum distance found so far.

Since we are checking every possible valid pair, we are guaranteed to find the absolute maximum distance.

> **Note:** A more optimal $O(N)$ approach exists by observing that the maximum distance must involve either the very first house or the very last house. However, the $O(N^2)$ solution provided below is perfectly acceptable and optimal enough for $N \le 100$.

## Implementation

```cpp
class Solution {
public:
    int maxDistance(vector<int>& colors) {
        int ans = 0;
        int n = colors.size();
        
        // Check every possible pair of houses
        for(int i = 0 ; i < n ; i++){
            for(int j = i + 1 ; j < n ; j++){
                // If they have different colors, update the maximum distance
                if(colors[i] != colors[j]) {
                    ans = max(ans, j - i);
                }
            }
        }
        
        return ans;
    }
};
```

### Complexity
* **Time Complexity:** $O(N^2)$
  * We use two nested loops. The outer loop runs $N$ times, and the inner loop runs roughly $N/2$ times on average, leading to $O(N^2)$ iterations.
* **Space Complexity:** $O(1)$
  * We are only using a few variables (`ans`, `n`, `i`, `j`), which require constant extra space.
