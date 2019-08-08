<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cipr="urn:customs.ru:Information:CustomsDocuments:CurrentImportProlong:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cipr:CurrentImportProlong">
      <html>
         <head>
            <title>Заявление на продление сроков временного ввоза</title>
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
               <!--<div align="right" style="positition">
						В 
						<span style="text-decoration: underline">
							<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
							<xsl:apply-templates select="cipr:Place/cipr:Customs"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
						</span>
					</div>-->
               <h2 align="center">ЗАЯВЛЕНИЕ НА ПРОДЛЕНИЕ СРОКА <br/> ВРЕМЕННОГО ВВОЗА</h2>
               <span>Прошу продлить срок временного ввоза транспортного(ых) средств(а)</span>
               <table border="1" cellpadding="0" cellspacing="0" style="margin-bottom: 2mm">
                  <tbody>
                     <tr>
                        <td>№ п/п</td>
                        <td>Идентификатор ТС</td>
                        <xsl:if test="//cat_ru:TransportMeansNationalityCode">
                           <td>Код страны принадлежности</td>
                        </xsl:if>
                        <xsl:if test="//cat_ru:ActiveTransportIdentifier">
                           <td>Идентификатор активного ТС</td>
                        </xsl:if>
                     </tr>
                     <xsl:for-each select="cipr:Transport">
                        <tr>
                           <td>
                              <xsl:value-of select="position()"/>
                           </td>
                           <td>
                              <xsl:value-of select="cat_ru:TransportIdentifier"/>
                           </td>
                           <xsl:if test="//cat_ru:TransportMeansNationalityCode">
                              <td>
                                 <xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:if>
                           <xsl:if test="//cat_ru:ActiveTransportIdentifier">
                              <td>
                                 <xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:if>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <table border="1" style="border:0">
                  <tbody>
                     <tr>
                        <td style="border:0" width="30%">фактически находящегося </td>
                        <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom">
                           <xsl:apply-templates select="cipr:Place"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="border:0" width="30%">Регистрационный номер ТДТС</td>
                        <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom">
                           <xsl:apply-templates select="cipr:TDTSNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="border:0" width="30%">Первоначальный срок </td>
                        <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cipr:InitialPeriod"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td style="border:0" width="30%">Новый срок</td>
                        <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cipr:DateProlong"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <xsl:if test="cipr:Reason">
                        <tr>
                           <td style="border:0" width="30%">Дополнительно сообщаю</td>
                           <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom">
                              <xsl:value-of select="cipr:Reason"/>
                           </td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cipr:TDTSNumber">
      <xsl:value-of select="cat_ru:CustomsCode"/> /
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/> /
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cipr:TransportModeCode"/>
      <xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template match="cipr:Customs">
      <xsl:choose>
         <xsl:when test="cat_ru:OfficeName">
            <xsl:value-of select="cat_ru:OfficeName"/>
				(<xsl:value-of select="cat_ru:Code"/>)
			</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="cat_ru:Code"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cipr:Place">
      <xsl:apply-templates select="cipr:Customs"/>. 
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:apply-templates select="cipr:FactTSAddress"/>
      <xsl:apply-templates select="cipr:RWstation"/>
   </xsl:template>
   <xsl:template match="cipr:FactTSAddress">
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>.
		<xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>. </xsl:if>
   </xsl:template>
   <xsl:template match="cipr:RWstation">
      <!-- ЖД станция -->
	Код станции: <xsl:value-of select="cipr:StationCode"/>
      <xsl:if test="cipr:StationName">(<xsl:value-of select="cipr:StationName"/>)</xsl:if>;
	<xsl:if test="cipr:RailwayCode">
		код ж/д <xsl:value-of select="cipr:RailwayCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
</xsl:stylesheet>
