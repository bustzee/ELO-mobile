<?php

if (!function_exists('getYouTubeId')) {
    function getYouTubeId($url) {
        if (empty($url)) return null; // Check if url is empty
        preg_match('/(?:https?:\/\/)?(?:www\.)?youtu(?:be\.com\/(?:embed\/|watch\?v=)|\.be\/)([a-zA-Z0-9_-]{11})/', $url, $match);
        return isset($match[1]) ? $match[1] : null;
    }
}

if (!function_exists('getReportOptions')) {
    function getReportOptions() {
        return array(
            "option1" => "Option 1",
            "option2" => "Option 2",
            "option3" => "Option 3",
        );
    }
}

if (!function_exists('getDisputeOptions')) {
    function getDisputeOptions() {
        return array(
            "option1" => "Option 1",
            "option2" => "Option 2",
            "option3" => "Option 3",
        );
    }
}

if (!function_exists('trim_text')) {
    function trim_text($description, $char_limit = 100, $suffix = '...') {
        if (mb_strlen($description) > $char_limit) {
            $description = mb_substr($description, 0, $char_limit) . $suffix;
        }
        return $description;
    }
}