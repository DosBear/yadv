<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:psysi="urn:customs.ru:Information:ExchangeDocuments:ParticipantSysInfo:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="psysi:ParticipantSysInfo">
      <html>
         <head>
            <title>Информация об учетной записи участника ВЭД</title>
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
						
						.graphMain2 {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
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
               <h2>Информация об учетной записи участника ВЭД</h2>
               <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" bgcolor="#808085" class="graphMain2" style="width:95mm">Наименование
								</td>
                        <td align="center" bgcolor="#808085" class="graphMain2" style="width:95mm">Значение
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain2" style="width:95mm">Идентификатор участника
								</td>
                        <td class="graphMain" style="width:95mm">
                           <xsl:value-of select="psysi:ParticipantID"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain2" style="width:95mm">Наименование точки подключения
								</td>
                        <td class="graphMain" style="width:95mm">
                           <xsl:value-of select="psysi:ParticipantName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain2" style="width:95mm">Наименование СВХ
								</td>
                        <td class="graphMain" style="width:95mm">
                           <xsl:value-of select="psysi:SVHName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain2" style="width:95mm">Номер свидельства о включении в реестр
								</td>
                        <td class="graphMain" style="width:95mm">
                           <xsl:value-of select="psysi:CertificateNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain2" style="width:95mm">Наименование организации
								</td>
                        <td class="graphMain" style="width:95mm">
                           <xsl:value-of select="psysi:OrganizationName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain2" style="width:95mm">ОГРН/ОГРНИП организации.
								</td>
                        <td class="graphMain" style="width:95mm">
                           <xsl:value-of select="psysi:OrganizationFeatures/cat_ru:OGRN"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain2" style="width:95mm">ИНН организации.
								</td>
                        <td class="graphMain" style="width:95mm">
                           <xsl:value-of select="psysi:OrganizationFeatures/cat_ru:INN"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain2" style="width:95mm">КПП организации.
								</td>
                        <td class="graphMain" style="width:95mm">
                           <xsl:value-of select="psysi:OrganizationFeatures/cat_ru:KPP"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
