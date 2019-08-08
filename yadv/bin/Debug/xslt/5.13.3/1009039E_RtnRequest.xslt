<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rtnreq="urn:customs.ru:Information:SQDocuments:RtnRequest:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="rtnreq:RtnRequest">
      <html>
         <head>
            <title>Сведения из реестра разрешений ОГ/карточек допуска</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
				background: #cccccc;
			}

			div.page {
				width: 210mm;
				height: 297mm;
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
				
				margin-top:20px;
				font: bold;
				
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
				font-family: Arial, serif;
			}
			
			.auxiliary tbody tr td {
				border: 0;
			}
		</style>
         </head>
         <body>
            <xsl:for-each select="rtnreq:Permit">
               <div class="page">
                  <xsl:if test="position() = 1">
                     <h2>Сведения из реестра разрешений ОГ/карточек допуска</h2>
                  </xsl:if>
                  <div style="margin-bottom: 20px;">
                     <span class="header">
                        <xsl:value-of select="position()"/>. Данные по разрешению/карточке</span>
                     <!-- Дата / время принятия решения -->
                     <xsl:if test="rtnreq:AccessCertificate">
                        <div align="right">
                           <table border="0" style="width:260px; margin-top: -20px;">
                              <tbody>
                                 <tr>
                                    <td align="center" style="border-right:0; border-left:0; border-top:0;">
                                       <xsl:value-of select="rtnreq:AccessCertificate"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="low" style="border:0;">(Номер удостоверения допуска)</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </xsl:if>
                     <table border="0" class="auxiliary" style="margin-top:10px">
                        <tbody>
                           <tr>
                              <td class="low" style="width:25mm">Примечание. </td>
                              <td align="left" class="low">
                                 <xsl:value-of select="rtnreq:Information"/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                     <br/>
                     <table border="1">
                        <tbody>
                           <tr>
                              <th style="width:50%">Общие сведения</th>
                              <th>Сведения о ТС</th>
                           </tr>
                           <tr>
                              <td>
                                 <xsl:apply-templates select="rtnreq:PermitInfo"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="rtnreq:TSInfo"/>
                              </td>
                           </tr>
                           <tr>
                              <th>Компания, которой выдано разрешение</th>
                              <th>Организация, выдавшая удостоверение</th>
                           </tr>
                           <tr>
                              <td>
                                 <xsl:choose>
                                    <xsl:when test="rtnreq:PermittedCompany">
                                       <xsl:apply-templates select="rtnreq:PermittedCompany"/>
                                    </xsl:when>
                                    <xsl:otherwise>Данные отсутствуют</xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td>
                                 <xsl:choose>
                                    <xsl:when test="rtnreq:Organization">
                                       <xsl:apply-templates select="rtnreq:Organization"/>
                                    </xsl:when>
                                    <xsl:otherwise>Данные отсутствуют</xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                           <xsl:if test="rtnreq:LicAddr">
                              <tr>
                                 <th colspan="2">Места осуществления лицензируемого вида деятельности</th>
                              </tr>
                              <tr>
                                 <td colspan="2">
                                    <xsl:for-each select="rtnreq:LicAddr">
                                       <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </xsl:if>
                        </tbody>
                     </table>
                  </div>
               </div>
            </xsl:for-each>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="rtnreq:PermitInfo">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
      <xsl:if test="rtnreq:IssueTime">
		Дата и время выдачи 
		<xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="rtnreq:IssueTime"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <span>
		Тип разрешения 
		<xsl:choose>
            <xsl:when test="rtnreq:PermitKind = 1">МНГ</xsl:when>
            <xsl:when test="rtnreq:PermitKind = 2">МКП</xsl:when>
            <xsl:when test="rtnreq:PermitKind = 3">МНП</xsl:when>
            <xsl:when test="rtnreq:PermitKind = 4">МКГ</xsl:when>
            <xsl:when test="rtnreq:PermitKind = 5">Специальное разрешение МАП</xsl:when>
            <xsl:when test="rtnreq:PermitKind = 6">Специальное разрешение РФ</xsl:when>
         </xsl:choose>
      </span>
      <br/>
      <xsl:if test="rtnreq:BeginDateTime">
		Дата начала действия 
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="rtnreq:BeginDateTime"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <span>
		Дата окончания действия 
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="rtnreq:EndDateTime"/>
         </xsl:call-template>
         <br/>
      </span>
      <span>
		Статус 
		<xsl:choose>
            <xsl:when test="rtnreq:Status = 1">Действующий </xsl:when>
            <xsl:when test="rtnreq:Status = 2">Приостановлен</xsl:when>
            <xsl:when test="rtnreq:Status = 3">Аннулирован</xsl:when>
         </xsl:choose>
         <br/>
      </span>
      <xsl:if test="rtnreq:StopDateTime">
		Дата приостановки/ аннулирования/ прекращения действия разрешения
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="rtnreq:StopDateTime"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rtnreq:TSInfo">
      <xsl:if test="cat_ru:VIN">Номер шасси <xsl:value-of select="cat_ru:VIN"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportKindCode">Код типа ТС <xsl:value-of select="cat_ru:TransportKindCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportMarkCode">Код марки ТС <xsl:value-of select="cat_ru:TransportMarkCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportIdentifier">Идентификатор ТС <xsl:value-of select="cat_ru:TransportIdentifier"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportMeansNationalityCode">
		Код страны принадлежности ТС 
		<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:ActiveTransportIdentifier">
		Идентификатор активного ТС  
		<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportRegNumber">
		Номер свидетельства о регистрации ТС 
		<xsl:value-of select="cat_ru:TransportRegNumber"/>
      </xsl:if>
      <br/>
      <span>
		Модель 
		<xsl:value-of select="rtnreq:Model"/>
      </span>
      <br/>
      <span>
			Владелец ТС 
		<xsl:apply-templates select="rtnreq:TSOwner"/>
      </span>
   </xsl:template>
   <xsl:template match="rtnreq:PermittedCompany | rtnreq:Organization | rtnreq:TSOwner">
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if>
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address | rtnreq:LicAddr">
      <xsl:if test="cat_ru:Address">
         <span class="header">Адрес:</span>
         <br/>
      </xsl:if>
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
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
</xsl:stylesheet>
