<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cipr="urn:customs.ru:Information:CustomsDocuments:CurrentImportProlong:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
               <br/>
               <xsl:if test="cipr:Applicant">
					<table class="w190">
						<tbody>
							<tr>
								<td style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="cipr:Applicant"/>
								</td>
							</tr>
							<tr>
								<td style="font-size: 8pt;text-align:center">
									(наименование организации или Ф.И.О., реквизиты, документ, удостоверящий личность физ.лица, адрес, способ информирования)
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
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
                     <tr valign="top">
                        <td style="border:0" width="30%">Маршрут</td>
                        <td align="left" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom">
                           <xsl:apply-templates select="cipr:Route"/>
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
   <xsl:template match="cipr:Route">
	   <xsl:for-each select="cipr:Destination">
		   <xsl:value-of select="position()"/>
		   <xsl:text>) </xsl:text>
		   <xsl:for-each select="*">
			   <xsl:value-of select="."/>
			   <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		   </xsl:for-each>
		   <xsl:if test="position()!=last()"><br/></xsl:if>	   
	   </xsl:for-each>
	   <xsl:if test="cipr:FlightInfo">
		   <br/>
		   <xsl:text>Рейс: </xsl:text>
		   <xsl:for-each select="cipr:FlightInfo/*">
			   <xsl:choose>
					<xsl:when test="contains(local-name(.),'Date')">
						<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
					</xsl:when>
					<xsl:when test="contains(local-name(.),'Time')">
						<xsl:value-of select="substring(., 1, 8)"/>
					</xsl:when>
					<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		   </xsl:for-each>
	   </xsl:if>
   </xsl:template>
   <xsl:template match="cipr:Applicant">
	   <xsl:value-of select="cat_ru:OrganizationName"/>
	   <xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
		   <xsl:value-of select="cat_ru:ShortName"/>
	   </xsl:if>
	   <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	   <xsl:apply-templates select="cipr:IdentityCard"/>
	   <xsl:apply-templates select="cipr:SubjectAddressDetails"/>
	   <xsl:apply-templates select="cipr:CommunicationDetails"/>
   </xsl:template>
   <xsl:template match="cipr:CommunicationDetails">
	   <xsl:if test="cat_ru:Phone">
		   <xsl:text> тел.: </xsl:text>
		   <xsl:for-each select="cat_ru:Phone">
			   <xsl:value-of select="."/>
			   <xsl:if test="position()!=last()">, </xsl:if>
		   </xsl:for-each>
	   </xsl:if>
	   <xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:Telex">
		   <xsl:text> телекс: </xsl:text>
		   <xsl:value-of select="cat_ru:Telex"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:E_mail">
		   <xsl:text> e-mail: </xsl:text>
		   <xsl:for-each select="cat_ru:E_mail">
			   <xsl:value-of select="."/>
			   <xsl:if test="position()!=last()">, </xsl:if>
		   </xsl:for-each>
	   </xsl:if>
   </xsl:template>
   <xsl:template match="cipr:SubjectAddressDetails">
	   <xsl:text>; адрес: </xsl:text>
	   <xsl:for-each select="RUScat_ru:AddressKindCode|RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
		   <xsl:value-of select="."/>
		   <xsl:if test="position()!=last()">, </xsl:if>
	   </xsl:for-each>
   </xsl:template>
   <xsl:template match="cipr:IdentityCard">
	   <xsl:text>; документ, удостоверящий личность: </xsl:text>
	   <xsl:for-each select="*">
		   <xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
	   </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
	   <xsl:if test="cat_ru:OGRN">
		   <xsl:text> ОГРН: </xsl:text>
		   <xsl:value-of select="cat_ru:OGRN"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:INN">
		   <xsl:text> ИНН: </xsl:text>
		   <xsl:value-of select="cat_ru:INN"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:KPP">
		   <xsl:text> КПП: </xsl:text>
		   <xsl:value-of select="cat_ru:KPP"/>
	   </xsl:if>
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
