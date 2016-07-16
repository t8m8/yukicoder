package main

import "fmt"

const MAX = 1000000

func main() {
	var n int
	fmt.Scan(&n)
	a := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}

	dp := make([]int, MAX+1)
	for _, v := range a {
		dp[v] = 1
	}
	ans := 1
	for i := 1; i < MAX+1; i++ {
		if dp[i] <= 0 {
			continue
		}
		for j := i+i; j < MAX+1; j+=i {
			if dp[j] != 0 {
				dp[j] = max(dp[i] + 1, dp[j])
			}
		}
		ans = max(dp[i], ans)
	}
	fmt.Println(ans)
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}