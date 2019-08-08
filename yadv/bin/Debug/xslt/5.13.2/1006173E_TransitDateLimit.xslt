<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tdl="urn:customs.ru:Information:CustomsDocuments:TransitDateLimit:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tdl:TransitDateLimit">
      <html>
         <head>
            <title>
               <xsl:choose>
                  <xsl:when test="tdl:DocumentSign = '0'">
							Заявление о продлении срока таможенного транзита
						</xsl:when>
                  <xsl:otherwise>Уведомление о продлении срока таможенного транзита</xsl:otherwise>
               </xsl:choose>
            </title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
					.page {
                        width: 210mm;
                        /*height: 297mm;*/
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }
                    
                    table {
						width: 100%;
						margin-top: 15px;
                    }
                    
                    th {
						font-size: 13pt;
                    }
                   </style>
         </head>
         <body>
            <div class="page">
               <h2 align="center">
                  <xsl:choose>
                     <xsl:when test="tdl:DocumentSign = '0'">
								Заявление о продлении срока таможенного транзита
							</xsl:when>
                     <xsl:otherwise>Уведомление о продлении срока таможенного транзита</xsl:otherwise>
                  </xsl:choose>
               </h2>
               <xsl:if test="tdl:DateLimit">
				   <span style="font-weight:bold">
						<xsl:choose>
							<xsl:when test="tdl:DocumentSign = '0'">Прошу продлить срок ТТ до </xsl:when>
							<xsl:otherwise>Срок ТТ до </xsl:otherwise>
						</xsl:choose>
						 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						 <xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="tdl:DateLimit"/>
						 </xsl:call-template>
						 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						 по ТД №  <xsl:apply-templates select="tdl:TD"/>
				   </span>
               </xsl:if>
               <xsl:if test="tdl:CanselReason">
				   <span style="font-weight:bold">
						<xsl:text>Отказать в продлении срока ТТ по ТД № </xsl:text>
						<xsl:apply-templates select="tdl:TD"/>
						<br/>
						<xsl:text> Причина отказа:  </xsl:text>
						<xsl:value-of select="tdl:CanselReason"/>
				   </span>
               </xsl:if>
               <br/>
              <xsl:if test="tdl:Reason">
				  <br/>
				  <span style="font-weight:bold">
						Причина изменения срока ТТ: 
						<xsl:value-of select="tdl:Reason"/>
				  </span>
				  <br/>
			  </xsl:if>
               <div align="right">
                  <table border="1" style="margin-top:50px; width:80mm; border: 0">
                     <tbody>
                        <tr>
                           <td align="left" style="border:0;font-weight:bold">
                              <!--<xsl:apply-templates select="tdl:TD"/>-->
                              <xsl:choose>
                                 <xsl:when test="tdl:TD">
											Номер транзитной декларации:<br/>
											<xsl:apply-templates select="tdl:TD"/>
                                 </xsl:when>
                                 <xsl:otherwise>
											Номер книжки МДП:<br/>
												<xsl:value-of select="tdl:TIRID/tdl:TIRSeries"/>
                                    <xsl:value-of select="tdl:TIRID/tdl:TIRID"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                        </tr>
                        <xsl:if test="tdl:UIN">
							<tr>
								<td align="left" style="border:0;font-weight:bold">
								УИН: <xsl:apply-templates select="tdl:UIN"/>
								</td>
							</tr>
						</xsl:if>
                     </tbody>
                  </table>
               </div>
               <div>
               Ф.И.О. лица заполнившего документ: <xsl:value-of select="tdl:CustomsPerson/cat_ru:PersonName"/>
               </div>
               <div align="right">
                  <table border="1" style="margin-top:50px; width:80mm; border: 0">
                     <tbody>
                        <tr>
                           <td align="left" style="border:0;">
								<b>Дата и время направления заявления</b><br/>
								<span>
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="tdl:DocDate"/>
									 </xsl:call-template>
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 <xsl:value-of select="substring(tdl:DocTime, 1, 8)"/>
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</span>
                           </td>
                        </tr>
                        <!--	<tr><td style="border:0; font-size:12" align="center">(Номер транзитной декларации)</td></tr>-->
                     </tbody>
                  </table>
               </div>

               <!--xsl:apply-templates select="tdl:CustomsPerson"/-->
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="tdl:TD | tdl:UIN">
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
        <xsl:with-param name="dategtd" select="cat_ru:RegistrationDate"/>
        </xsl:call-template>/<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template match="tdl:CustomsPerson">
      <table border="1" style="margin-top:50px; width:100%; border:0">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:value-of select="cat_ru:PersonName"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
            </tr>
            <tr>
               <td align="center" style="border:0;">Ф.И.О.</td>
               <td style="border:0;"/>
               <td align="center" style="border:0;">ЛНП</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
</xsl:stylesheet>
