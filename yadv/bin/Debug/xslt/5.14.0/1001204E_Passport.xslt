<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pass="urn:customs.ru:Information:RegistrationDocuments:Passport:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
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
   <xsl:template name="russian_date_gtd">
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
   <xsl:template name="ResidencePlace">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="pass:Passport">
      <html>
         <head>
            <title>Паспорт гражданина РФ</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
										}	
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="bold" colspan="2">Сведения из паспорта гражданина РФ
							</td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2">Серия
								<span class="bordered">
                              <xsl:value-of select="pass:CardSeries"/>
                           </span>
                           <xsl:text> </xsl:text>Номер
									<span class="bordered">
                              <xsl:value-of select="pass:CardNumber"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain"> Паспорт выдан
									<span class="bordered">
                              <xsl:value-of select="pass:OrganizationName"/>
                           </span>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain">Дата выдачи
									<span class="bordered">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pass:CardDate"/>
                              </xsl:call-template>
                           </span>
                        </td>
                        <td align="left" class="graphMain">Код подразделения
									<span class="bordered">
                              <xsl:value-of select="pass:OrgCode"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">Фамилия
									<span class="bordered">
                              <xsl:value-of select="pass:PersonInfo/pass:PersonSurname"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">Имя
									<span class="bordered">
                              <xsl:value-of select="pass:PersonInfo/pass:PersonName"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">Отчество
								<span class="bordered">
                              <xsl:value-of select="pass:PersonInfo/pass:PersonMiddleName"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain">Пол
								<xsl:if test="pass:PersonInfo/pass:Sex = '1'">
                              <span class="bordered">жен.</span>
                           </xsl:if>
                           <xsl:if test="pass:PersonInfo/pass:Sex = '0'">
                              <span class="bordered">муж.</span>
                           </xsl:if>
                        </td>
                        <td align="left" class="graphMain">Дата рождения
								<span class="bordered">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pass:PersonInfo/pass:Birthday"/>
                              </xsl:call-template>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">Место рождения
									<span class="bordered">
                              <xsl:value-of select="pass:PersonInfo/pass:Birthplace"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">
                           <xsl:for-each select="pass:ResidencePlace">
                              <br/>Место жительства
					<span class="bordered">
                                 <xsl:call-template name="ResidencePlace"/>
                              </span>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
