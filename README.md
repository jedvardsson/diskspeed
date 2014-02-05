# diskspeed

Simple bash script to test disk speed.

# Examples

    # Test disk speed in current directory
    $ diskspeed.sh
	Writing .: 251658240 bytes (252 MB) copied, 0.873465 s, 288 MB/s
	Reading .: 251658240 bytes (252 MB) copied, 0.0401338 s, 6.3 GB/s    

    # Test disk speed in two folders
    $ diskspeed.sh /dir/encrypted /dir/not_encrypted
	Writing /dir/encrypted: 251658240 bytes (252 MB) copied, 0.816196 s, 308 MB/s
	Reading /dir/encrypted: 251658240 bytes (252 MB) copied, 0.0390377 s, 6.4 GB/s
	Writing /dir/not_encrypted: 251658240 bytes (252 MB) copied, 0.45864 s, 549 MB/s
	Reading /dir/not_encrypted: 251658240 bytes (252 MB) copied, 0.0466736 s, 5.4 GB/s


# Installation
(Not necessary. You can run script using full path)

        $ git clone https://github.com/jedvardsson/diskspeed.git
        $ cd diskspeed
        $ ./INSTALL.sh  
