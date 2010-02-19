#! /usr/bin/perl

use File::Find;

exit main( @ARGV );

sub main()
{
    my @argv = @_;

    print("extract all ids from svg files under directory: $argv[0]\n");
    find(\&create_id_list, $argv[0]);
}

sub create_id_list()
{
    my $filename = $_;

     # skip directories
    return unless -f;

    # skip non-svg files
    return unless rindex($filename, ".svg") == length($filename) - 4;

    # open file and read it to array of lines
    open( FILE, $filename ) || die( "Could not open $filename for reading: $!" );
    @lines = <FILE>;
    close(FILE) || die "Couldn't close file properly";

    # create one long string from the file
    $content = join('', @lines);

    my @tags;
    my @ids;
    my $g_tags_open = 0;
    while ($content =~ m/<(\/)?([^\s>\/]+)([^>]*?)(\/)?>/g) 
    {
        if($1)
        {
            $id = pop(@tags);
            if($id eq "g")
            {
                $g_tags_open--;
            }
        }
        else
        {
            if(length($4) eq 0)
            {
                push(@tags, $2);
            }

            $tagname = $2;

            if ($g_tags_open eq 1)
            {
                if($3)
                {
                    $3 =~ m/id="([^"]+)"/;
                    if(length($1) > 0)
                    {
                        #print "$filename - level " .@tags. " element: $1\n";
                        push(@ids, $1);
                    }
                }
            }

            if($tagname eq "g") {
                $g_tags_open++;
            }
        }
    }

    if(@ids)
    {
        my $outputfilename = $filename.".ids";
        open( OUTPUT, ">$outputfilename") || die( "Could not open $outputfilename for writing: $!" );
        foreach(@ids)
        {
            print OUTPUT "$_\n";
        }
        close(OUTPUT) || die "Couldn't close file properly";
    }
    return 0;
}
