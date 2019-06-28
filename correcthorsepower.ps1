# configuration
$wordcount=7
$separator="_";
$capitalize=$false

# load popular english word list (found at https://github.com/dolph/dictionary)
$list=Get-Content popular.txt
$result=""

# calculate and display entropy
$entropy=$wordcount * [System.Math]::Log($list.Length,2)
"The following password is good for $("{0:n1}" -f $entropy) bits of entropy:"

for ($i = 0; $i -lt $wordcount; $i += 1)
{
    $word = (Get-Random $list).ToLowerInvariant()

    if($capitalize)
    {
        $word=$word.Substring(0,1).ToUpper() + $word.Substring(1,$word.Length-1)
    }

    if($i -gt 0)
    {
        $result=$result+$separator+$word
    }
    else
    {
        $result=$word
    }
}

$result
