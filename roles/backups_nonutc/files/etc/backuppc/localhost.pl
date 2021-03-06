#
# Local server backup of /etc as user backuppc
#
$Conf{XferMethod} = 'tar';

$Conf{TarShareName} = ['/etc','/home/slack/','/home/www/','/home/svn/'];

$Conf{TarClientCmd} = '/usr/bin/env LC_ALL=C $tarPath -c -v -f - -C $shareName'
                        . ' --totals';

# remove extra shell escapes ($fileList+ etc.) that are
# needed for remote backups but may break local ones
$Conf{TarFullArgs} = '$fileList';
$Conf{TarIncrArgs} = '--newer=$incrDate $fileList';
