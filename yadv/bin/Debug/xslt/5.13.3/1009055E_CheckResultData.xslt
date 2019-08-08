<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ckrtdt="urn:customs.ru:Information:SQDocuments:CheckResultData:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="ckrtdt:CheckResultData">
      <html>
         <head>
            <title>Сведения о результатах проверки данных весогабаритного контроля с данными разрешительных документов</title>
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
			
			.header {
					font-weight: bold;
					margin-top:20px;
				}
		</style>
         </head>
         <body>
            <div class="page">
               <h2>Сведения о результатах проверки данных весогабаритного контроля с данными разрешительных документов</h2>
               <span>Идентификатор запроса: <span style="text-decoration: underline">
                     <xsl:value-of select="ckrtdt:RequestId"/>
                  </span>
               </span>
               <br/>
               <span>
				Статус запроса: 
				<span style="text-decoration: underline">
                     <xsl:choose>
                        <xsl:when test="ckrtdt:StatusCode = 1">Ошибка в параметрах запроса</xsl:when>
                        <xsl:when test="ckrtdt:StatusCode = 2">Положительный результат проверки</xsl:when>
                        <xsl:when test="ckrtdt:StatusCode = 3">
                           <br/>Не найдено действующее разрешение по гос.номеру АТС (или найдено более одного разрешения)
						</xsl:when>
                        <xsl:when test="ckrtdt:StatusCode = 4">Указанное разрешение не зарегистрировано</xsl:when>
                        <xsl:when test="ckrtdt:StatusCode = 5">
                           <br/>Параметры АТС, дата или место проезда не соответствуют указанным в разрешении
						</xsl:when>
                     </xsl:choose>
                  </span>
               </span>
               <br/>
               <xsl:if test="ckrtdt:Result">
                  <div class="header">Ошибки по результатам проверки:</div>
                  <xsl:for-each select="ckrtdt:Result">
                     <span>
                        <xsl:value-of select="ckrtdt:Code"/>
                        <xsl:if test="ckrtdt:Description">
							(<xsl:value-of select="ckrtdt:Description"/>)
						</xsl:if>
                     </span>;<br/>
                  </xsl:for-each>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
