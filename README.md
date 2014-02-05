# diskspeed

Simple bash script to test disk speed.

# Examples

    # Test disk speed in current directory
    $ diskspeed.sh
    Writing .: 251658240 bytes (252 MB) copied, 1.91234 s, 132 MB/s
    Reading .: 251658240 bytes (252 MB) copied, 0.0470604 s, 5.3 GB/s

    # Test disk speed in two folders
    $ diskspeed.sh /dir/encrypted /dir/not_encrypted
    Writing /dir/encrypted: 251658240 bytes (252 MB) copied, 1.39117 s, 181 MB/s
    Reading /dir/encrypted: 251658240 bytes (252 MB) copied, 0.0474908 s, 5.3 GB/s
    Writing /dir/not_encrypted: 251658240 bytes (252 MB) copied, 0.747143 s, 337 MB/s
    Reading /dir/not_encrypted: 251658240 bytes (252 MB) copied, 0.046063 s, 5.5 GB/s


# Installation
(Not necessary. You can run script using full path)

        $ git clone https://github.com/jedvardsson/diskspeed.git
        $ cd diskspeed
        $ ./INSTALL.sh  
