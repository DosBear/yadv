<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pita="urn:customs.ru:Information:PriorInformation:PI_TIAuto:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="pita:PI_TIAuto">
      <html>
         <head>
            <title>Предварительная информация в отношении временно ввозимых физическими лицами авто-, мототранспортных средств для личного пользования</title>
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
							font-size: 8pt;
							}
				.graph1 {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: pt;
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
                     <td align="center" class="graph" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Предварительная информация в отношении временно ввозимых физическими лицами авто-, мототранспортных средств для личного пользования</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">
                        <span class="header">Информация о владельце (водителе) транспортного средства:<br/>
                        </span>
                        <xsl:value-of select="pita:TransportDriver/cat_ru:PersonSurname"/> 
				<xsl:value-of select="pita:TransportDriver/cat_ru:PersonName"/>
                        <xsl:if test="pita:TransportDriver/cat_ru:PersonMiddleName"> <xsl:value-of select="pita:TransportDriver/cat_ru:PersonMiddleName"/>
                        </xsl:if>
                        <xsl:if test="pita:TransportDriver/pita:BirthDate"> Дата рождения: <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pita:TransportDriver/pita:BirthDate"/>
                           </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="pita:TransportDriver/cat_ru:PersonPost"> Должность: <xsl:value-of select="pita:TransportDriver/cat_ru:PersonPost"/>
                        </xsl:if>
				 <xsl:apply-templates select="pita:TransportDriver/pita:IdentityCardInfo"/>
                        <xsl:if test="pita:TransportDriver/pita:IdentityCardInfo/pita:CountryCode">
                           <xsl:value-of select="pita:TransportDriver/pita:IdentityCardInfo/pita:CountryCode"/> </xsl:if>
                        <xsl:if test="pita:TransportDriver/pita:IdentityCardInfo/pita:CountryName">
                           <xsl:value-of select="pita:TransportDriver/pita:IdentityCardInfo/pita:CountryName"/> </xsl:if>
                        <xsl:apply-templates select="pita:TransportDriver/pita:Address"/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">
                        <span class="header">Информация о собственнике транспортного средства:<br/>
                        </span>
                        <xsl:value-of select="pita:TransportOwner/cat_ru:PersonSurname"/> 
				<xsl:value-of select="pita:TransportOwner/cat_ru:PersonName"/>
                        <xsl:if test="pita:TransportOwner/cat_ru:PersonMiddleName"> <xsl:value-of select="pita:TransportOwner/cat_ru:PersonMiddleName"/>
                        </xsl:if>
                        <xsl:if test="pita:TransportOwner/pita:BirthDate"> Дата рождения: <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pita:TransportOwner/pita:BirthDate"/>
                           </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="pita:TransportOwner/cat_ru:PersonPost"> Должность: <xsl:value-of select="pita:TransportOwner/cat_ru:PersonPost"/>
                        </xsl:if>
				 <xsl:apply-templates select="pita:TransportOwner/pita:IdentityCardInfo"/>
                        <xsl:if test="pita:TransportOwner/pita:IdentityCardInfo/pita:CountryCode">
                           <xsl:value-of select="pita:TransportOwner/pita:IdentityCardInfo/pita:CountryCode"/> </xsl:if>
                        <xsl:if test="pita:TransportOwner/pita:IdentityCardInfo/pita:CountryName">
                           <xsl:value-of select="pita:TransportOwner/pita:IdentityCardInfo/pita:CountryName"/> </xsl:if>
                        <xsl:apply-templates select="pita:TransportOwner/pita:Address"/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">
                        <span class="header">Карточка транспортного средства:</span>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" width="50%">Марка, модель</td>
                     <td class="graph">
                        <xsl:value-of select="pita:TransportMeanCard/cat_ru:Model"/>
                     </td>
                  </tr>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:Mark">
                     <tr>
                        <td class="graph">Наименование марки в оригинале</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:Mark"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:MarkCode">
                     <tr>
                        <td class="graph">Код марки</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:MarkCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:OfftakeYear">
                     <tr>
                        <td class="graph">Год изготовления транспортного средства</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:OfftakeYear"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:EngineVolumeQuanity">
                     <tr>
                        <td class="graph">Рабочий объем двигателя, куб. см.</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:EngineVolumeQuanity"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:VINID">
                     <tr>
                        <td class="graph">Идентификационный номер (VIN)</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:VINID"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:BodyID">
                     <tr>
                        <td class="graph">Идентификационный номер кузова (прицепа)</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:BodyID"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:EngineID">
                     <tr>
                        <td class="graph">Идентификационный номер двигателя, нанесенный на блоке двигателя</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:EngineID"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:ChassisID">
                     <tr>
                        <td class="graph">Идентификационный номер шасси (рамы)</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:ChassisID"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/cat_ru:CabID">
                     <tr>
                        <td class="graph">Идентификационный номер кабины</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/cat_ru:CabID"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/pita:CountryCode or pita:TransportMeanCard/pita:CountryName">
                     <tr>
                        <td class="graph">Название страны</td>
                        <td class="graph">
                           <xsl:if test="pita:TransportMeanCard/pita:CountryCode">
                              <xsl:value-of select="pita:TransportMeanCard/pita:CountryCode"/> </xsl:if>
                           <xsl:if test="pita:TransportMeanCard/pita:CountryName">
                              <xsl:value-of select="pita:TransportMeanCard/pita:CountryName"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/pita:TransportMeansTypeCode">
                     <tr>
                        <td class="graph">Код типа транспортного средства</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/pita:TransportMeansTypeCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pita:TransportMeanCard/pita:TransportCategoryCode">
                     <tr>
                        <td class="graph">Код категории транспортного средства</td>
                        <td class="graph">
                           <xsl:value-of select="pita:TransportMeanCard/pita:TransportCategoryCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph">Государственный регистрационный номер</td>
                     <td class="graph">
                        <xsl:value-of select="pita:TransportMeanCard/pita:StateRegNumber"/>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cat_ru:Organization">
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
      <xsl:if test="RUScat_ru:IdentityCard">
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
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
   <xsl:template match="pita:Address">
	Адрес: 
	<xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode"> (<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
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
	 
</xsl:template>
   <xsl:template match="pita:IdentityCardInfo">
	Документ удостоверяющий личность:
	<xsl:if test="RUScat_ru:IdentityCardName"> <xsl:value-of select="RUScat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode"> </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
         </span>
		 
	</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="RUScat_ru:OrganizationName"/>
		 
	</xsl:if>
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
</xsl:stylesheet>
