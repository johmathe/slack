$Conf{RsyncShareName} = ['/etc','/home'];

$Conf{XferMethod} = 'rsync';
$Conf{RsyncClientCmd} = '$sshPath -q -x -l root $host $rsyncPath $argList+';
$Conf{RsyncClientPath} = '/usr/bin/rsync';

$Conf{BackupFilesExclude} =
       [
        '*.AVI',
        '*.CR2',
        '*.ISO',
        '*.MP3',
        '*.WMA',
        '*.WMV',
        '*.avi',
        '*.cr2',
        '*.flac',
        '*.iso',
        '*.m4a',
        '*.m4p',
        '*.m4v',
        '*.mkv',
        '*.mp3',
        '*.mp4',
        '*.mpg',
        '*.obj',
        '*.raw',
        '*.rmj',
        '*.tmp',
        '*.wav',
        '*.wma',
        '*.wmv',
];

