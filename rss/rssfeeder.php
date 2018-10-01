<?PHP
    require 'rssparser.php';
    use \Chirp\RSSParser;

    $url = "http://www.the-art-of-web.com/rss.xml";
    $rss_parser = new RSSParser($url);

    $output = $rss_parser->getRawOutput();
    echo $output;
?>
