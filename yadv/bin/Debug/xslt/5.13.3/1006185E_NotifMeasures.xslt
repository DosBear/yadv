<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nm="urn:customs.ru:Information:CustomsDocuments:NotifMeasures:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="nm:NotifMeasures">
      <html>
         <head>
            <title>
               <xsl:choose>
                  <xsl:when test="nm:DocSign='1'">Уведомление о применении/неприменении меры по минимизации риска</xsl:when>
                  <xsl:when test="nm:DocSign='2'">Уведомление о необходимости применения меры</xsl:when>
                  <xsl:otherwise>Уведомление об отсутствии необходимости проведения сверки сведений</xsl:otherwise>
               </xsl:choose>
            </title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
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
				
				div.album_page {
					width: 297mm;
					height: 210mm;
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
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 12pt;
							}
				jh {
				font: 18;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <b>
                           <xsl:choose>
                              <xsl:when test="nm:DocSign='1'">Уведомление о применении/неприменении меры по минимизации риска</xsl:when>
                              <xsl:when test="nm:DocSign='2'">Уведомление о необходимости применения меры</xsl:when>
                              <xsl:otherwise>Уведомление об отсутствии необходимости проведения сверки сведений</xsl:otherwise>
                           </xsl:choose>
                        </b>
                     </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="nm:PI_RegID">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">Идентификатор предварительной информации:
				<xsl:value-of select="nm:PI_RegID"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nm:ProcedureSign">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">Таможенная процедура, при которой было принято решение должностным лицом:
				<xsl:choose>
                              <xsl:when test="nm:ProcedureSign='1'">Таможенный транзит</xsl:when>
                              <xsl:when test="nm:ProcedureSign='0'">Декларирование</xsl:when>
                           </xsl:choose>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nm:RegNumberDT">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">Регистрационный номер ДТ: <xsl:apply-templates select="nm:RegNumberDT"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nm:MeasuresSign">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">Признак применения мер:
				<xsl:choose>
                              <xsl:when test="nm:MeasuresSign='true' or nm:MeasuresSign='1' or nm:MeasuresSign='t'">применялись</xsl:when>
                              <xsl:when test="nm:MeasuresSign='false' or nm:MeasuresSign='0' or nm:MeasuresSign='f'">не  применялись</xsl:when>
                           </xsl:choose>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nm:MeasuresApplyDate">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">
                           <xsl:if test="nm:MeasuresApplyDate">Дата применения мер:
				        <xsl:call-template name="date">
                                 <xsl:with-param name="dateIn" select="nm:MeasuresApplyDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nm:MeasuresApplyTime">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">
                           <xsl:if test="nm:MeasuresApplyTime">
				Время применения мер:
				<xsl:value-of select="substring(nm:MeasuresApplyTime, 1, 8)"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nm:Comments">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">
                           <xsl:if test="nm:Comments">Комментарии:
				<xsl:for-each select="nm:Comments">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nm:CustomsPerson">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">Должностное лицо таможенного органа:
				<xsl:value-of select="nm:CustomsPerson/cat_ru:PersonName"/>
                           <xsl:if test="nm:CustomsPerson/cat_ru:LNP">
				,<xsl:value-of select="nm:CustomsPerson/cat_ru:LNP"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="nm:Customs">
                     <tr>
                        <td align="left" class="graph" style="border:solid 0pt">Сведения о таможенном органе:
				<xsl:value-of select="nm:Customs/cat_ru:Code"/>
                           <xsl:if test="nm:Customs/cat_ru:OfficeName">
		  <xsl:value-of select="nm:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="date">
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
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,3,1)='.' and substring($dategtd,6,1)=':' and substring($dategtd,9,1)=':'">
            <xsl:value-of select="substring($dategtd,11,2)"/>
            <xsl:value-of select="substring($dategtd,8,2)"/>
            <xsl:value-of select="substring($dategtd,5,2)"/>
            <xsl:value-of select="substring($dategtd,2,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="nm:RegNumberDT">
      <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
</xsl:stylesheet>
