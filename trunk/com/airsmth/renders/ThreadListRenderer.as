﻿<?xml version="1.0" encoding="utf-8"?>
<s:ItemRenderer xmlns:fx="http://ns.adobe.com/mxml/2009" 
    xmlns:mx="library://ns.adobe.com/flex/mx" 
    xmlns:s="library://ns.adobe.com/flex/spark">

    <fx:Script> 
        <![CDATA[ 
            
            override public function set data(value:Object):void { 
                super.data = value;
                
                // Check to see if the data property is null. 
                if (value== null) 
                    return; 
                // If the data property is not null, 
                // set the Label controls appropriately. 
                lbSubject.text = value.title;
                lbAuthor.text = value.author;
            } 
        ]]> 
    </fx:Script> 

    <s:HGroup verticalCenter="0" left="2" right="2" top="2" bottom="2">
        <s:Label id="lbSubject" />
        <s:Label id="lbAuthor" />
    </s:HGroup>
</s:ItemRenderer>