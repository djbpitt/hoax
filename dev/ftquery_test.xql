xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare variable $stories as document-node()+ := collection('/db/apps/hoax/TEI');
count($stories[descendant::tei:body[ft:query(., 'thou')]])