<?php

shell_exec('cd ..');
exec('./server/scripts/git-deployer.sh', $out);

foreach ($out as $line) {
    echo $line.PHP_EOL;
}
