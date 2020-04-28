<?php

exec(__DIR__.'/../server/scripts/git-deployer.sh', $out);

foreach ($out as $line) {
    echo $line.PHP_EOL;
}
