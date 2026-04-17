---
title: "3761. Minimum Mirror Pair Distance"
difficulty: "Medium"
excerpt: "Use a Hash Map paired with Sets to quickly find the closest index of a reversed number."
---

## Problem Statement

Given a zero-indexed integer array `nums`, a **mirror pair** is defined as a pair of indices `(i, j)` such that `0 <= i < j < nums.length` and the reversal of `nums[i]` is equal to `nums[j]`. 

The reversal of an integer removes any leading zeros. For example, reversing `120` yields `21`.

Return the *minimum distance* `|i - j|` between any mirror pair in `nums`. If no such mirror pair exists, return `-1`.

**Example 1:**
```text
Input: nums = [12, 1, 34, 21, 43]
Output: 2
Explanation:
- The reverse of nums[0] (12) is 21, which matches nums[3]. The distance is |0 - 3| = 3.
- The reverse of nums[2] (34) is 43, which matches nums[4]. The distance is |2 - 4| = 2.
The minimum distance is 2.
```

**Example 2:**
```text
Input: nums = [11, 22, 11]
Output: 2
Explanation:
- The reverse of nums[0] (11) is 11, which matches nums[2]. The distance is |0 - 2| = 2.
The minimum distance is 2.
```

**Example 3:**
```text
Input: nums = [10, 20, 30]
Output: -1
Explanation: No mirror pairs exist, so we return -1.
```

**Constraints:**
- `2 <= nums.length <= 10^5`
- `0 <= nums[i] <= 10^9`

---

## Logic & Intuition

Checking every pair of elements takes $O(N^2)$ time, which results in a Time Limit Exceeded (TLE) error for large arrays. To optimize this to $O(N \log N)$ time, we use a Hash Map combined with a Binary Search Tree (a `std::set` in C++).

First, we store every number and a `set` of all the indices at which it occurs in the array. 
For each number in the array at index `i`, we reverse it and check our map to see if that reversed number exists. If it does, we use binary search (`std::set::lower_bound`) to instantly find the closest occurrence of that reversed number *strictly after* the current index `i`. We track the minimum distance observed out of all valid occurrences.

## Implementation

```cpp
class Solution {
public:
    int reverse(int num){
        int reverse = 0;
        // logic to reverse the number
        while(num > 0){
            int digit = num % 10;
            reverse *= 10;
            reverse += digit;
            num = num / 10;
        }
        return reverse;
    }
    
    int minMirrorPairDistance(vector<int>& nums) {
        unordered_map<int, set<int>> mp;
        int n = nums.size();
        
        for(int i = 0; i < n ; i++){
            mp[nums[i]].insert(i);
        }
        
        int ans = INT_MAX;
        
        for(int i = 0; i < n ; i++){
            int rev = reverse(nums[i]);
            
            if(mp.find(rev) != mp.end()){
                auto &st = mp[rev];

                auto it = st.lower_bound(i + 1);
                if(it != st.end() && *it != i ){
                    ans = min(ans, abs(*it - i));
                }
            }
        }
        
        return (ans < INT_MAX) ? ans : -1;
    }
};
```
