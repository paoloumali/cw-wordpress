<?php

exec(__DIR__.'/../_deploy.sh', $out);

foreach ($out as $line) {
    echo $line.PHP_EOL;
}
