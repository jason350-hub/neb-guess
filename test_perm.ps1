function Get-Permutations($items) {
    if ($items.Count -le 1) { return ,$items }
    $result = @()
    for ($i = 0; $i -lt $items.Count; $i++) {
        $first = $items[$i]
        $rest = $items[0..($i-1)] + $items[($i+1)..($items.Count-1)]
        $subPerms = Get-Permutations $rest
        foreach ($p in $subPerms) {
            $result += ,(@($first) + @($p))
        }
    }
    return ,$result
}

Write-Host "Permutation test..."
$p3 = Get-Permutations @(1,2,3)
Write-Host "3! count = $($p3.Count)"
