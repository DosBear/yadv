<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rsnfdt="urn:customs.ru:Information:SQDocuments:ResolutionNotifData:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="rsnfdt:ResolutionNotifData">
      <html>
         <head>
            <title>Сведения о принятом решении</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
				background: #cccccc;
			}

			div.page {
				width: 210mm;
				margin: auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				padding-left: 20mm;
				background: #ffffff;
				border: solid 1pt #000000;
			}
			
			h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
			}
		</style>
         </head>
         <body>
            <div class="page">
               <h2>Сведения о принятом решении</h2>
               <span>Идентификатор запроса: <span style="text-decoration: underline">
                     <xsl:value-of select="rsnfdt:RequestId"/>
                  </span>
               </span>
               <br/>
               <span>
				Решение ответственного должностного лица: 
				<span style="text-decoration: underline">
                     <xsl:choose>
                        <xsl:when test="rsnfdt:Action = 1">Пропущено</xsl:when>
                        <xsl:when test="rsnfdt:Action = 2">
                           <br/>Пропущено с уведомлением на внешней границе Таможенного союза (Беларусь)</xsl:when>
                        <xsl:when test="rsnfdt:Action = 3">
                           <br/>Пропущено с уведомлением на внешней границе Таможенного союза (Казахстан)</xsl:when>
                        <xsl:when test="rsnfdt:Action = 4">Задержано</xsl:when>
                     </xsl:choose>
                  </span>
               </span>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
