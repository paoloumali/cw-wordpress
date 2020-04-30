<?php

exec(__DIR__.'/../_backup-now.sh', $out);

foreach ($out as $line) {
    echo $line.PHP_EOL;
}
