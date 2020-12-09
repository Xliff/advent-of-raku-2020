my @program = lines».Int;

my $pointer = 26;
my $error;

while $pointer++ < +@program {
    my @buffer = @program[$pointer - 26 .. $pointer - 1];
    my @sum = @buffer.combinations(2).grep:  *.sum == @program[$pointer];
    $error = @program[$pointer] and last unless @sum;
}

say 'A: ', $error;



my $bottom = 0;
my $top    = 1;

loop {
    $top++    if @program[$bottom .. $top].sum <  $error;
    $bottom++ if @program[$bottom .. $top].sum >  $error;
    last      if @program[$bottom .. $top].sum == $error;
}

say 'B: ', sum @program[$bottom .. $top].minmax.bounds;
