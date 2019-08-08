<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="EReq" version="1.0" xmlns:EReq="urn:customs.ru:Information:CustomsDocuments:ESADInfoReq:5.10.0" xmlns:catSCVV="urn:customs.ru:SCVVCommonAggregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Запрос информации из ДТ -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <!--шаблон для преобразования даты формата "yyyy-mm-dd" в формат "dd.mm.yyyy"-->
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--шаблон для преобразования даты формата "yyyy-mm-dd" в формат "ddmmyy" для использования в регистрационных номерах-->
   <xsl:template name="russian_date_td">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="EReq:ESADInfoReq">
      <html>
         <head>
            <title>
Запрос информации из декларации на товары
</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					    div.page {
						border: solid 1pt #000000;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm;
						padding-left: 15mm;
						background: #ffffff;
						}
						
						table { 
						width:180mm 
						border: solid  2pt #ffffff;
						border-collapse: collapse; 
						cellspacing:0;
						}
							
						.bheader {
						border: solid 1pt #bbbbbb;
						padding-left:	5pt;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						background: #CFECEC;
						}			
						
						p {
						text-indent: 5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 11pt;
						}
						
					    .b0 {
						border: solid 1pt #bbbbbb;
						padding-left: 5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						margin-left:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						background: #ffffff;
   					    }
					    
					   .b1 {
						border: solid 1pt #bbbbbb;
					    text-indent: 20pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
					    .b1h {
						border: solid 1pt #bbbbbb;
					    text-indent: 20pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						background: #ffffff;
						}
						
						.b2 {
						border: solid 1pt #bbbbbb;
					    padding-left: 40pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
						
						.b3 {
						border: solid 1pt #bbbbbb;
					    text-indent: 60pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;						
						}
						
						.b4 {
						border: solid 1pt #bbbbbb;
					    text-indent: 80pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;						
						}
						
						.btext {
						border: solid 1pt #bbbbbb;
					    padding-left:	5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
				</style>
         </head>
         <body>
            <div class="page">
               <h2>Запрос информации из декларации на товары</h2>
               <table>
                  <tbody>
                     <tr>
                        <td class="b0" style="width:80mm;">
		Номер запрашиваемой ДТ
		</td>
                        <td class="btext" style="width:100mm;">
                           <xsl:value-of select="EReq:DTID/catSCVV:CustomsCode"/>/<xsl:call-template name="russian_date_td">
                              <xsl:with-param name="dateIn" select="EReq:DTID/catSCVV:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="EReq:DTID/catSCVV:GTDNumber"/>
                        </td>
                     </tr>
                     <xsl:if test="EReq:DTID/catSCVV:GoodsNumeric">
                        <tr>
                           <td class="b0" style="width:80mm;">
			Порядковые номера товаров, по которым запрашивается информация
			</td>
                           <td class="btext" style="width:100mm;">
                              <xsl:for-each select="EReq:DTID/catSCVV:GoodsNumeric[position() = 1]">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                              <xsl:for-each select="EReq:DTID/catSCVV:GoodsNumeric[position() != 1]">, <xsl:value-of select="."/>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
