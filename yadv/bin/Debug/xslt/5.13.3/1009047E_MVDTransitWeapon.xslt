<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:trwepn="urn:customs.ru:Information:SQDocuments:MVDTransitWeapon:5.11.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
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
   <xsl:template match="trwepn:MVDTransitWeapon">
      <html>
         <head>
            <title>Заключение (разрешительный документ) на ввоз и (или) вывоз гражданского и служебного оружия, его основных (составных) частей и патронов к нему</title>
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
					font-family: Arial, serif;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Заключение (разрешительный документ) на ввоз и (или) вывоз гражданского и служебного оружия, его основных (составных) частей и патронов к нему</h2>
               <table>
                  <tbody>
                     <xsl:if test="trwepn:IsCanceled = 'true' or trwepn:IsCanceled='1' or trwepn:IsCanceled = 't' ">
                        <div class="remark"> Документ аннулирован </div>
                        <br/>
                     </xsl:if>
                     <tr>
                        <td width="50%">Страна отправления</td>
                        <td width="50%">
                           <xsl:value-of select="trwepn:DepartureCountry"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Страна назначения</td>
                        <td>
                           <xsl:value-of select="trwepn:DestinationCountry"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Вид перемещения</td>
                        <td>
                           <xsl:value-of select="trwepn:MoveDirection"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Цель ввоза<br/>(вывоза)</td>
                        <td>
                           <xsl:value-of select="trwepn:GoalAction"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Срок временного ввоза<br/>(вывоза)</td>
                        <td>
                           <xsl:call-template name="russian_date">
							   <xsl:with-param name="dateIn" select="trwepn:InitialPeriod"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td>Дополнительная информация</td>
                        <td>
                           <xsl:value-of select="trwepn:AddInfo"/>
                        </td>
                     </tr>
                      <tr>
                        <td>Страна транзита</td>
                        <td>
                           <xsl:value-of select="trwepn:TransitCountry"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Отправитель</td>
                        <td>
                           <xsl:apply-templates select="trwepn:Consignor"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Получатель</td>
                        <td>
                           <xsl:apply-templates select="trwepn:Consignee"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Орган государственной власти государства-члена Таможенного союза, выдавший заключение</td>
                        <td>
                           <xsl:apply-templates select="trwepn:OrganizationName"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Разрешение</td>
                        <td>
                           <xsl:apply-templates select="trwepn:Permission"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Юридическое лицо</td>
                        <td>
                           <xsl:apply-templates select="trwepn:Organization"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Описание</td>
                        <td>
							<xsl:for-each select="trwepn:WeaponDescription">
							   <xsl:apply-templates select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td>Основание</td>
                        <td>
                           <xsl:apply-templates select="trwepn:BaseDocument"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Дата ввоза/вывоза оружия</td>
                        <td>
							<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="trwepn:docInfo_importDate"/></xsl:call-template>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:apply-templates select="trwepn:Signer"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="trwepn:Organization">
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
   <xsl:template match="cat_ru:Address">
      <span class="header">Адрес:</span>
      <br/>
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
   <xsl:template match="cat_ru:Contact">
	   <xsl:for-each select="*">
		   <xsl:value-of select="."/>
		   <xsl:if test="position()!=last()">, </xsl:if>
	   </xsl:for-each>
   </xsl:template>
   <xsl:template match="trwepn:WeaponDescription">
      <span>Вид оружия <xsl:value-of select="trwepn:Kind"/>
      </span>
      <br/>
      <span>Тип оружия <xsl:value-of select="trwepn:Type"/>
      </span>
      <br/>
      <span>Количество <xsl:apply-templates select="trwepn:Quantity"/>
      </span>
      <br/>
      <span>Количество в доп. ед. измерения <xsl:apply-templates select="trwepn:AddQuantity"/>
      </span>
      <br/>
      <xsl:if test="trwepn:Lefttover">
		  <span>Остаток по квоте:<br/>
			  <table class="bordered w190">
				<tbody>
					<tr>
						<td class="graphMain bordered">Количество товара</td>
						<td class="graphMain bordered">Условное обозначение ед.изм.</td>
						<td class="graphMain bordered">Код ед.изм.</td>
					</tr>
					<xsl:for-each select="trwepn:Lefttover">
						<tr>
							<td class="graphMain bordered">
								<xsl:value-of select="cat_ru:GoodsQuantity"/>
							</td>
							<td class="graphMain bordered">
								<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
							</td>
							<td class="graphMain bordered">
								<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		  </span>
		  <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="trwepn:Quantity | trwepn:AddQuantity">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="trwepn:Permission | trwepn:BaseDocument">
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
      <xsl:if test="trwepn:Series">
		Серия <xsl:value-of select="trwepn:Series"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="trwepn:Signer">
      <table border="0" style="margin-top:50px; width:100%">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="cat_ru:PersonPost"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td align="center" class="low" style="border:0;">Ф.И.О.</td>
               <td style="border:0;"/>
               <td align="center" class="low" style="border:0;">Должность</td>
               <td style="border:0;"/>
               <td align="center" class="low" style="border:0;">Дата подписания</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="trwepn:Consignee|trwepn:Consignor|trwepn:OrganizationName">
	   <xsl:value-of select="cat_ru:OrganizationName"/>
	   <br/>
	   <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	   <br/>
	   <xsl:apply-templates select="cat_ru:Address"/>
	   <br/>
	   <xsl:apply-templates select="cat_ru:IdentityCard"/>
	   <br/>
	   <xsl:apply-templates select="cat_ru:Contact"/>
   </xsl:template>
</xsl:stylesheet>
