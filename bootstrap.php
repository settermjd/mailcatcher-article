<?php
function customError($errno, $errstr){
    print "<br />".date('Y-m-d H:m:s')." Error: [$errno] $errstr";
}
set_error_handler("customError", -1);