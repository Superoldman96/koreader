-- https://www.gutenberg.org/ebooks.opds/
local navigation_sample = [[
<?xml version="1.0" encoding="utf-8"?>
<!--

DON'T USE THIS PAGE FOR SCRAPING.

Seriously. You'll only get your IP blocked.

Download https://www.gutenberg.org/feeds/catalog.rdf.bz2 instead,
which contains *all* Project Gutenberg metadata in one RDF/XML file.

--><feed xmlns="http://www.w3.org/2005/Atom" xmlns:opds="http://opds-spec.org/2010/catalog" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/" xmlns:relevance="http://a9.com/-/opensearch/extensions/relevance/1.0/">
<id>http://www.gutenberg.org/ebooks.opds/</id>
<updated>2021-04-02T13:27:36Z</updated>
<title>Project Gutenberg</title>
<subtitle>Free ebooks since 1971.</subtitle>
<author>
<name>Project Gutenberg</name>
<uri>https://www.gutenberg.org</uri>
<email>webmaster@gutenberg.org</email>
</author>
<icon>https://www.gutenberg.org/gutenberg/favicon.ico</icon>
<link rel="search" type="application/opensearchdescription+xml" title="Project Gutenberg Catalog Search" href="https://www.gutenberg.org/catalog/osd-books.xml"/>
<link rel="self" title="This Page" type="application/atom+xml;profile=opds-catalog" href="/ebooks.opds/"/>
<link rel="alternate" type="text/html" title="HTML Page" href="/ebooks/"/>
<link rel="start" title="Start Page" type="application/atom+xml;profile=opds-catalog" href="/ebooks.opds/"/>
<opensearch:itemsPerPage>25</opensearch:itemsPerPage>
<opensearch:startIndex>1</opensearch:startIndex>
<entry>
<updated>2021-04-02T13:27:36Z</updated>
<id>https://www.gutenberg.org/ebooks/search.opds/?sort_order=downloads</id>
<title>Popular</title>
<content type="text">Our most popular books.</content>
<link type="application/atom+xml;profile=opds-catalog" rel="subsection" href="/ebooks/search.opds/?sort_order=downloads"/>
<link type="image/png" rel="http://opds-spec.org/image/thumbnail" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAS4SURBVHjaYvz//z8DLQBAADEx0AgABABZAKb/AWYuLgAAAAAA+QEBAPoAACcE9fVaGwAAQhMBASUA/f0C8Pv74c7+/sTxDw+mHQYGGBXy8lcY/f01CQUFFPkAAPLj/f3Ux/LytOD4+KwPBwft+fr6AOn09AACCGzwP6ChP75/j9NiY2t0d3FRULa0ZOAREADa9pPh++3bDA83b2bYe+XKBzF2dm5rFxdWcRcXBmYREYZ/wGB8/fgxw7XduxmWnDhx4uC3b4Vff/488ebrVwaAAGJM19Ji+PbjR4aXouK0kNJSRhZ9fYhfYGHPwsLA8PYtA8PSpQwMKioMDG5uDAxMwBD89w8amED2t28Mr9atY+ibPv3FvGfPwl5//34YIICY9QQEdC14eBbHlZdzMSsqMjC8eMHA8P49BH/4wMDw7h0Dw+/fDAyGhgwMEhIMDG/eQMRg8p8+gc3nNjVlMGBk5Ll88aLOzW/fNgIEEAv3t28pHm5uQkwgr9+5w8AADBasAOYDmDwrKwMDGxvDv9evGb5dvMjw9ckTBhFg+Mbz85se/fIlCiCAWOSZmJxkhYUZGJ4/Z2D48YOI6AYazMXF8O/pU4Yf+/czfAbibyDDgVKgwDGUlWWQZGe3BAggFj4GBmlmYGCDwxFoI07XggwEuhAUtn/27mX4vmsXw4+XLxn+QtMsCyhlAeODFxjmvP//8wMEEMufv38//XvyRJCJnx+cCrAaCopAoKH/gUH1C2jor5s3Gf4gK4G6lpmZmeEPMIh+/f3LABBALPf//j376fZteQEhIZAMIrZh3gYq/P/9O8OvK1cY/pw7x/AXyAap+IuGQRYJ8vExXAfqefHr12uAAGIGev6PHiNjuAIwfEHpmfHPH0iQAPF/YDL6BUzHXw4cALvyL1AO3TAQ/R2IeYDhLgwM36kfPnzf+fHjXIAAYv7679/9T//+aQCTipYwMKx/A4PjFzAZfX/0iOHjpUsMn69eZfiD5so/UPwbaigvLy+DjLIywwZgjut++XLn+79/JwIEEPOv////3P316/CzX790FdjYVKSAYfr8+nWGV0CD/4IiFRp+/9BcCTIUFCNikpIMogoKDCuB6brx6dNjd3//bgIKXwIIIGZWiOIvl3792nLjyxdhMVZWY0N5eYa/QJd//vYNbjByEIDSzl9g7MsCcyKTuDjDxIcPf7c8f77xwd+/1UCp4yA9AAEEii4GZmDYAjX8eP3v345Lnz59Yf/718pcVZWNAxhxb4Au+YtkOCils3ByMqgCy5gX7OwMTdevv5/24cNcYF5sBkpdhcU7QAAxgFzMDs1NIkBX8ABpKQaGwFYBgWevra3/fzA0/H+Kmfk/0Bn/jwHxDWHh/38cHP4f19L6783M/BCoPA+IBdBTKUAAYRgsAmUDVRqnsbGduGlq+v+rjc3/03x8/+8qKPz/4eLyf6Ws7H9gyXESqCwYiNmw5SmAAMJqMKy0AGYZST9GxmXHNDX///X1/f/Byel/j4DAXxkGhjVAaVN8OR8ggHAaDAp7YVAeYWDgsAaG3zwxsfcFXFxvgUVAL1BYnlCRAhBAeA0WRfInLwODOzBjh4KUEVM1AQQQI60qU4AAAwBnu/BQIoGoSgAAAABJRU5ErkJggg=="/>
</entry>
<entry>
<updated>2021-04-02T13:27:36Z</updated>
<id>https://www.gutenberg.org/ebooks/search.opds/?sort_order=release_date</id>
<title>Latest</title>
<content type="text">Our latest releases.</content>
<link type="application/atom+xml;profile=opds-catalog" rel="subsection" href="/ebooks/search.opds/?sort_order=release_date"/>
<link type="image/png" rel="http://opds-spec.org/image/thumbnail" href="data:image/png;base64,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"/>
</entry>
<entry>
<updated>2021-04-02T13:27:36Z</updated>
<id>https://www.gutenberg.org/ebooks/search.opds/?sort_order=random</id>
<title>Random</title>
<content type="text">Random books.</content>
<link type="application/atom+xml;profile=opds-catalog" rel="subsection" href="/ebooks/search.opds/?sort_order=random"/>
<link type="image/png" rel="http://opds-spec.org/image/thumbnail" href="data:image/png;base64,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"/>
</entry>
</feed>
]]

-- https://www.gutenberg.org/ebooks/42474.opds
local acquisition_sample = [[
<?xml version="1.0" encoding="utf-8"?>
<!--

DON'T USE THIS PAGE FOR SCRAPING.

Seriously. You'll only get your IP blocked.

Download https://www.gutenberg.org/feeds/catalog.rdf.bz2 instead,
which contains *all* Project Gutenberg metadata in one RDF/XML file.

--><feed xmlns="http://www.w3.org/2005/Atom" xmlns:opds="http://opds-spec.org/2010/catalog" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/" xmlns:relevance="http://a9.com/-/opensearch/extensions/relevance/1.0/">
<id>http://www.gutenberg.org/ebooks/42474.opds</id>
<updated>2021-04-02T13:29:52Z</updated>
<title>1000 Mythological Characters Briefly Described by Edward Sylvester Ellis</title>
<subtitle>Free ebooks since 1971.</subtitle>
<author>
<name>Project Gutenberg</name>
<uri>https://www.gutenberg.org</uri>
<email>webmaster@gutenberg.org</email>
</author>
<icon>https://www.gutenberg.org/gutenberg/favicon.ico</icon>
<link rel="search" type="application/opensearchdescription+xml" title="Project Gutenberg Catalog Search" href="https://www.gutenberg.org/catalog/osd-books.xml"/>
<link rel="self" title="This Page" type="application/atom+xml;profile=opds-catalog" href="/ebooks/42474.opds"/>
<link rel="alternate" type="text/html" title="HTML Page" href="/ebooks/42474"/>
<link rel="start" title="Start Page" type="application/atom+xml;profile=opds-catalog" href="/ebooks.opds/"/>
<opensearch:itemsPerPage>25</opensearch:itemsPerPage>
<opensearch:startIndex>1</opensearch:startIndex>
<entry>
<updated>2021-04-02T13:29:52Z</updated>
<title>1000 Mythological Characters Briefly Described</title>
<content type="xhtml">
<div xmlns="http://www.w3.org/1999/xhtml">
<p>This edition had all images removed.</p>
<p>
LoC No.:
00001011
</p>
<p>
Title:
1000 Mythological Characters Briefly Described<br />Adapted to Private Schools, High Schools and Academies
</p>
<p>
Alternate Title:
One Thousand Mythological Characters Briefly Described
<br />Adapted to Private Schools, High Schools and Academies
</p>
<p>Author: Ellis, Edward Sylvester, 1840-1916</p>
<p>Ebook No.: 42474</p>
<p>Published: 7 apr. 2013</p>
<p>Downloads: 401</p>
<p>Language: English</p>
<p>Subject: Mythology -- Dictionaries</p>
<p>LoCC: Philosophy, Psychology, Religion: Religion: General, Miscellaneous and Atheism</p>
<p>Category: Text</p>
<p>Rights: Public domain in the USA.</p>
</div>
</content>
<id>urn:gutenberg:42474:2</id>
<published>2013-04-07T00:00:00+00:00</published>
<rights>Public domain in the USA.</rights>
<author>
<name>Ellis, Edward Sylvester</name>
</author>
<category scheme="http://purl.org/dc/terms/LCSH" term="Mythology -- Dictionaries"/>
<category scheme="http://purl.org/dc/terms/LCC" term="BL" label="Philosophy, Psychology, Religion: Religion: General, Miscellaneous and Atheism"/>
<category scheme="http://purl.org/dc/terms/DCMIType" term="Text"/>
<dcterms:language>en</dcterms:language>
<dcterms:identifier>urn:lccn:00001011</dcterms:identifier>
<relevance:score>1</relevance:score>
<link type="application/epub+zip" rel="http://opds-spec.org/acquisition" title="EPUB (no images)" length="143854" href="https://www.gutenberg.org/ebooks/42474.epub.noimages"/>
<link type="application/x-mobipocket-ebook" rel="http://opds-spec.org/acquisition" title="Kindle (no images)" length="550462" href="https://www.gutenberg.org/ebooks/42474.kindle.noimages"/>
<link type="image/jpeg" rel="http://opds-spec.org/image" href="https://www.gutenberg.org/cache/epub/42474/pg42474.cover.medium.jpg"/>
<link type="image/jpeg" rel="http://opds-spec.org/image/thumbnail" href="https://www.gutenberg.org/cache/epub/42474/pg42474.cover.small.jpg"/>
<link type="application/atom+xml;profile=opds-catalog" rel="related" href="/ebooks/42474/also/.opds" title="Readers also downloaded…"/>
<link type="application/atom+xml;profile=opds-catalog" rel="related" href="/ebooks/author/2569.opds" title="By Ellis, Edward Sylvester…"/>
<link type="application/atom+xml;profile=opds-catalog" rel="related" href="/ebooks/subject/25016.opds" title="On Mythology -- Dictionaries…"/>
</entry>
<entry>
<updated>2021-04-02T13:29:52Z</updated>
<title>1000 Mythological Characters Briefly Described</title>
<content type="xhtml">
<div xmlns="http://www.w3.org/1999/xhtml">
<p>This edition has images.</p>
<p>
LoC No.:
00001011
</p>
<p>
Title:
1000 Mythological Characters Briefly Described<br />Adapted to Private Schools, High Schools and Academies
</p>
<p>
Alternate Title:
One Thousand Mythological Characters Briefly Described
<br />Adapted to Private Schools, High Schools and Academies
</p>
<p>Author: Ellis, Edward Sylvester, 1840-1916</p>
<p>Ebook No.: 42474</p>
<p>Published: 7 apr. 2013</p>
<p>Downloads: 401</p>
<p>Language: Engels</p>
<p>Subject: Mythology -- Dictionaries</p>
<p>LoCC: Philosophy, Psychology, Religion: Religion: General, Miscellaneous and Atheism</p>
<p>Category: Text</p>
<p>Rights: Public domain in the USA.</p>
</div>
</content>
<id>urn:gutenberg:42474:3</id>
<published>2013-04-07T00:00:00+00:00</published>
<rights>Public domain in the USA.</rights>
<author>
<name>Ellis, Edward Sylvester</name>
</author>
<category scheme="http://purl.org/dc/terms/LCSH" term="Mythology -- Dictionaries"/>
<category scheme="http://purl.org/dc/terms/LCC" term="BL" label="Philosophy, Psychology, Religion: Religion: General, Miscellaneous and Atheism"/>
<category scheme="http://purl.org/dc/terms/DCMIType" term="Text"/>
<dcterms:language>en</dcterms:language>
<dcterms:identifier>urn:lccn:00001011</dcterms:identifier>
<relevance:score>1</relevance:score>
<link type="application/epub+zip" rel="http://opds-spec.org/acquisition" title="EPUB (with images)" length="646067" href="https://www.gutenberg.org/ebooks/42474.epub.images"/>
<link type="application/x-mobipocket-ebook" rel="http://opds-spec.org/acquisition" title="Kindle (with images)" length="1552799" href="https://www.gutenberg.org/ebooks/42474.kindle.images"/>
<link type="image/jpeg" rel="http://opds-spec.org/image" href="https://www.gutenberg.org/cache/epub/42474/pg42474.cover.medium.jpg"/>
<link type="image/jpeg" rel="http://opds-spec.org/image/thumbnail" href="https://www.gutenberg.org/cache/epub/42474/pg42474.cover.small.jpg"/>
<link type="application/atom+xml;profile=opds-catalog" rel="related" href="/ebooks/42474/also/.opds" title="Readers also downloaded…"/>
<link type="application/atom+xml;profile=opds-catalog" rel="related" href="/ebooks/author/2569.opds" title="By Ellis, Edward Sylvester…"/>
<link type="application/atom+xml;profile=opds-catalog" rel="related" href="/ebooks/subject/25016.opds" title="On Mythology -- Dictionaries…"/>
</entry>
</feed>
]]

-- https://www.gutenberg.org/catalog/osd-books.xml
local opensearch_sample = [[
<?xml version="1.0" encoding="UTF-8"?>
<OpenSearchDescription xmlns="http://a9.com/-/spec/opensearch/1.1/">
   <LongName>Project Gutenberg</LongName>
   <ShortName>Gutenberg</ShortName>
   <Description>Search the Project Gutenberg ebook catalog.</Description>
   <Tags>free ebooks books public domain</Tags>
   <Developer>Marcello Perathoner</Developer>
   <Contact>webmaster@gutenberg.org</Contact>

   <Url type="text/html"
        template="http://www.gutenberg.org/ebooks/search/?query={searchTerms}"/>

   <Url type="application/atom+xml"
        template="http://m.gutenberg.org/ebooks/search.opds/?query={searchTerms}"/>

   <Url type="application/x-suggestions+json"
    rel="suggestions"
        template="http://www.gutenberg.org/ebooks/suggest/?query={searchTerms}"/>

   <Query role="example" searchTerms="shakespeare hamlet" />
   <Query role="example" searchTerms="doyle detective" />
   <Query role="example" searchTerms="love stories" />

   <Attribution>Search Data Copyright 1971-2012, Project Gutenberg, All Rights Reserved.</Attribution>
   <SyndicationRight>open</SyndicationRight>
   <Language>en-us</Language>
   <OutputEncoding>UTF-8</OutputEncoding>
   <InputEncoding>UTF-8</InputEncoding>
</OpenSearchDescription>
]]

local popular_new_sample = [[
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xml:lang="en" xmlns:app="http://www.w3.org/2007/app" xmlns:thr="http://purl.org/syndication/thread/1.0" xmlns:opds="http://opds-spec.org/2010/catalog">
  <id>https://catalog.feedbooks.com/catalog/public_domain.atom</id>
  <title>Public Domain Books</title>
  <updated>2014-11-30T17:54:01Z</updated>
  <icon>https://catalog.feedbooks.com/favicon.ico</icon>
  <author>
    <name>Feedbooks</name>
    <uri>http://www.feedbooks.com</uri>
    <email>help@demarque.com</email>
  </author>
  <link rel="self" type="application/atom+xml;profile=opds-catalog;kind=navigation; charset=utf-8" href="https://catalog.feedbooks.com/catalog/public_domain.atom"/>
  <link rel="start" type="application/atom+xml;profile=opds-catalog;kind=navigation" title="Home" href="https://catalog.feedbooks.com/catalog/index.atom"/>
  <link rel="search" href="https://catalog.feedbooks.com/opensearch.xml" type="application/opensearchdescription+xml" title="Search on Feedbooks"/>
<link rel="http://opds-spec.org/featured" type="application/atom+xml;profile=opds-catalog;kind=acquisition" title="Featured books" href="https://catalog.feedbooks.com/publicdomain/browse/homepage_selection.atom?lang=en"/>
<link rel="http://opds-spec.org/sort/popular" type="application/atom+xml;profile=opds-catalog;kind=acquisition" title="Literary" href="https://catalog.feedbooks.com/publicdomain/browse/best.atom?cat=FBFIC019000&amp;lang=en"/>
<link rel="http://opds-spec.org/sort/popular" type="application/atom+xml;profile=opds-catalog;kind=acquisition" title="Mystery &amp; detective" href="https://catalog.feedbooks.com/publicdomain/browse/best.atom?cat=FBFIC022000&amp;lang=en"/>
<link rel="http://opds-spec.org/sort/popular" type="application/atom+xml;profile=opds-catalog;kind=acquisition" title="Science fiction" href="https://catalog.feedbooks.com/publicdomain/browse/best.atom?cat=FBFIC028000&amp;lang=en"/>
<entry>
  <title>Most popular</title>
  <link type="application/atom+xml;profile=opds-catalog;kind=acquisition" rel="http://opds-spec.org/sort/popular" href="https://catalog.feedbooks.com/publicdomain/browse/top.atom?lang=en"/>
  <updated>2024-07-19T16:19:38Z</updated>
  <id>https://catalog.feedbooks.com/publicdomain/browse/top.atom?lang=en</id>
  <content type="text">Based on last week's downloads</content>
</entry>
<entry>
  <title>Recently added</title>
  <link type="application/atom+xml;profile=opds-catalog;kind=acquisition" rel="http://opds-spec.org/sort/new" href="https://catalog.feedbooks.com/publicdomain/browse/recent.atom?lang=en"/>
  <updated>2024-07-19T16:19:38Z</updated>
  <id>https://catalog.feedbooks.com/publicdomain/browse/recent.atom?lang=en</id>
  <content type="text">Find the latest books available</content>
</entry>
<entry>
  <title>Fiction</title>
  <link type="application/atom+xml;profile=opds-catalog;kind=navigation" rel="subsection" href="https://catalog.feedbooks.com/publicdomain/category/FBFIC000000/sub.atom"/>
  <updated>2024-07-19T16:19:38Z</updated>
  <id>https://catalog.feedbooks.com/publicdomain/category/FBFIC000000/sub.atom</id>
  <content type="text">Browse books by category</content>
</entry>
<entry>
  <title>Nonfiction</title>
  <link type="application/atom+xml;profile=opds-catalog;kind=navigation" rel="subsection" href="https://catalog.feedbooks.com/publicdomain/category/FBNFC000000/sub.atom"/>
  <updated>2024-07-19T16:19:38Z</updated>
  <id>https://catalog.feedbooks.com/publicdomain/category/FBNFC000000/sub.atom</id>
  <content type="text">Browse books by category</content>
</entry>
</feed>
]]

local facet_sample = [[
<?xml version="1.0" encoding="utf-8"?>
 <feed xmlns="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/terms/" xmlns:os="http://a9.com/-/spec/opensearch/1.1/" xmlns:opds="http://opds-spec.org/2010/catalog"> <id>tag:root:authors:Санд</id>
 <title>Книги по авторам</title>
 <updated>2014-11-30T17:27:27+01:00</updated>
 <icon>/favicon.ico</icon>
 <link href="/opds-opensearch.xml" rel="search" type="application/opensearchdescription+xml" />
 <link href="/opds/search?searchTerm={searchTerms}" rel="search" type="application/atom+xml" />
 <link href="/opds" rel="start" type="application/atom+xml;profile=opds-catalog" />
 <link href="/opds/authors/%D0%A1%D0%B0%D0%BD%D0%B4/1" rel="next" type="application/atom+xml;profile=opds-catalog" />
 <entry> <updated>2014-11-30T17:27:27+01:00</updated>
 <id>tag:author:75357</id>
 <title>Санд Жаклин</title>
 <content type="text">6 книг</content>
 <link href="/opds/author/75357" type="application/atom+xml;profile=opds-catalog" />
 <link href="/opds/authorsequences/75357" rel="http://www.feedbooks.com/opds/facet" type="application/atom+xml;profile=opds-catalog" title="Книги автора по сериям" />
 <link href="/opds/authorsequenceless/75357" rel="http://www.feedbooks.com/opds/facet" type="application/atom+xml;profile=opds-catalog" title="Книги автора вне серий" />
</entry>
</feed>
]]

describe("OPDS module", function()
    local socketutil
    local OPDSParser, OPDSBrowser
    local orig_path, orig_lbt, orig_ltt, orig_fbt, orig_ftt

    setup(function()
        orig_path = package.path
        package.path = "plugins/opds.koplugin/?.lua;" .. package.path
        require("commonrequire")
        socketutil = require("socketutil")
        OPDSParser = require("opdsparser")
        OPDSBrowser = require("opdsbrowser")

        -- Make the timeouts more lenient to avoid spurious test failures
        orig_lbt = socketutil.LARGE_BLOCK_TIMEOUT
        socketutil.LARGE_BLOCK_TIMEOUT = socketutil.DEFAULT_BLOCK_TIMEOUT
        orig_ltt = socketutil.LARGE_TOTAL_TIMEOUT
        socketutil.LARGE_TOTAL_TIMEOUT = socketutil.DEFAULT_TOTAL_TIMEOUT
        orig_fbt = socketutil.FILE_BLOCK_TIMEOUT
        socketutil.FILE_BLOCK_TIMEOUT = socketutil.DEFAULT_BLOCK_TIMEOUT
        orig_ftt = socketutil.FILE_TOTAL_TIMEOUT
        socketutil.FILE_TOTAL_TIMEOUT = socketutil.DEFAULT_TOTAL_TIMEOUT
    end)

    teardown(function()
        package.path = orig_path
        socketutil.LARGE_BLOCK_TIMEOUT = orig_lbt
        socketutil.LARGE_TOTAL_TIMEOUT = orig_ltt
        socketutil.FILE_BLOCK_TIMEOUT = orig_fbt
        socketutil.FILE_TOTAL_TIMEOUT = orig_ftt
    end)

    describe("OPDS parser module", function()
        it("should parse OPDS navigation catalog", function()
            local catalog = OPDSParser:parse(navigation_sample)
            local feed = catalog.feed
            assert.truthy(feed)
            assert.are.same(feed.title, "Project Gutenberg")
            local entries = feed.entry
            assert.truthy(entries)
            assert.are.same(#entries, 3)
            local entry = entries[3]
            assert.are.same(entry.title, "Random")
            assert.are.same(entry.id, "https://www.gutenberg.org/ebooks/search.opds/?sort_order=random")
            assert.are.same(
                "/ebooks/search.opds/?sort_order=random",
                entry.link[1].href)
        end)
        it("should parse OPDS acquisition catalog", function()
            local catalog = OPDSParser:parse(acquisition_sample)
            local feed = catalog.feed
            assert.truthy(feed)
            local entries = feed.entry
            assert.truthy(entries)
            assert.are.same(#entries, 2)
            local entry = entries[2]
            assert.are.same(entry.title, "1000 Mythological Characters Briefly Described")
            assert.are.same(entry.link[1].href, "https://www.gutenberg.org/ebooks/42474.epub.images")
            assert.are.same(entry.link[1].title, "EPUB (with images)")
        end)
    end)

    describe("OPDS browser module", function()
        before_each(function()
            local Cache = require("cache")
            stub(Cache, "check", function() return nil end)
        end)

        after_each(function()
            local Cache = require("cache")
            if Cache.check.revert then
                Cache.check:revert()
            end
        end)

        describe("URL generation", function()
            it("should generate search url and catalog items #internet", function()
                local fetch_feed_stub = stub(OPDSBrowser, "getSearchTemplate", function(self, osd_url)
                    local search_descriptor = OPDSParser:parse(opensearch_sample)
                    if search_descriptor and search_descriptor.OpenSearchDescription and search_descriptor.OpenSearchDescription.Url then
                        for _, candidate in ipairs(search_descriptor.OpenSearchDescription.Url) do
                            if candidate.type and candidate.template and candidate.type:find(self.search_template_type) then
                                return candidate.template:gsub("{searchTerms}", "%%s")
                            end
                        end
                    end
                    return nil
                end)

                local main_catalog = OPDSParser:parse(navigation_sample)
                local item_table = OPDSBrowser:genItemTableFromCatalog(main_catalog, "https://www.gutenberg.org/ebooks.opds/?format=opds")

                assert.truthy(OPDSBrowser.search_url)
                assert.are.same("http://m.gutenberg.org/ebooks/search.opds/?query=%s", OPDSBrowser.search_url)

                assert.truthy(item_table)
                assert.are.same(3, #item_table)
                assert.are.same("Popular", item_table[1].title)
                assert.are.same("Latest", item_table[2].title)
                assert.are.same("Random", item_table[3].title)

                fetch_feed_stub:revert()
            end)
            it("should generate URL on rel=subsection #internet", function()
                local catalog = OPDSParser:parse(navigation_sample)
                local item_table = OPDSBrowser:genItemTableFromCatalog(catalog, "https://www.gutenberg.org/ebooks.opds/?format=opds")

                assert.truthy(item_table)
                assert.are.same(item_table[1].title, "Popular")
                assert.are.same(item_table[1].url, "https://www.gutenberg.org/ebooks/search.opds/?sort_order=downloads")
            end)
            it("should generate URL on rel=popular and rel=new #internet", function()
                local catalog = OPDSParser:parse(popular_new_sample)
                local item_table = OPDSBrowser:genItemTableFromCatalog(catalog, "http://www.feedbooks.com/publicdomain/catalog.atom")

                assert.truthy(item_table)
                assert.are.same(item_table[1].title, "Most popular")
                assert.are.same(item_table[1].url, "https://catalog.feedbooks.com/publicdomain/browse/top.atom?lang=en")
                assert.are.same(item_table[2].title, "Recently added")
                assert.are.same(item_table[2].url, "https://catalog.feedbooks.com/publicdomain/browse/recent.atom?lang=en")
            end)
            it("should use the main URL for faceted links as long as faceted links aren't properly supported #internet", function()
                local catalog = OPDSParser:parse(facet_sample)
                local item_table = OPDSBrowser:genItemTableFromCatalog(catalog, "http://flibusta.is/opds")

                assert.truthy(item_table)
                assert.are.same(item_table[1].url, "http://flibusta.is/opds/author/75357")
            end)
        end)

        it("should not fill item table incorrectly with thumbnail or image URL #internet", function()
            local catalog = OPDSParser:parse(facet_sample)
            local item_table = OPDSBrowser:genItemTableFromCatalog(catalog, "http://flibusta.is/opds")

            assert.truthy(item_table)
            assert.are_not.same(item_table[1].image, "http://flibusta.is/opds/author/75357")
        end)
    end)
end)
